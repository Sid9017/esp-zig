const embed = @import("embed");
const newlib = @import("newlib.zig").posix;
const lwip = @import("lwip.zig").posix;

const embed_nonblock_flag: usize = @as(usize, 1) << @bitOffsetOf(newlib.O, "NONBLOCK");
const socket_nonblock_flag: usize = lwip.SOCK.NONBLOCK;
const socket_flag_mask: u32 = lwip.SOCK.NONBLOCK | lwip.SOCK.CLOEXEC;

pub const fd_t = newlib.fd_t;
pub const mode_t = newlib.mode_t;
pub const timeval = newlib.timeval;
pub const timespec = newlib.timespec;
pub const pollfd = newlib.pollfd;
pub const O = newlib.O;
pub const F = newlib.F;
pub const E = enum(c_int) {
    ACCES = 13,
    PERM = 1,
    ADDRINUSE = 98,
    ADDRNOTAVAIL = 99,
    AFNOSUPPORT = 97,
    CONNREFUSED = 111,
    CONNRESET = 104,
    HOSTUNREACH = 118,
    NETUNREACH = 101,
    TIMEDOUT = 116,
    NOENT = 2,
};
pub const POLL = newlib.POLL;

pub const socket_t = lwip.socket_t;
pub const socklen_t = lwip.socklen_t;
pub const sockaddr = lwip.sockaddr;
pub const AF = lwip.AF;
pub const SOCK = lwip.SOCK;
pub const IPPROTO = lwip.IPPROTO;
pub const SOL = lwip.SOL;
pub const SO = lwip.SO;

pub const poll = newlib.poll;
pub const close = newlib.close;
pub const open = newlib.open;
pub fn fcntl(fd: fd_t, cmd: i32, arg: usize) embed.posix.FcntlError!usize {
    const socket_fd = isSocketFd(fd);
    const raw_arg = if (socket_fd and cmd == F.SETFL)
        translateEmbedFlagsToSocketFlags(arg)
    else
        arg;

    const raw_flags = try newlib.fcntl(fd, cmd, raw_arg);
    if (socket_fd and cmd == F.GETFL) {
        return translateSocketFlagsToEmbedFlags(raw_flags);
    }
    return raw_flags;
}
pub const read = newlib.read;
pub const write = newlib.write;
pub const lseek_SET = newlib.lseek_SET;
pub const lseek_CUR = newlib.lseek_CUR;
pub const lseek_CUR_get = newlib.lseek_CUR_get;
pub const lseek_END = newlib.lseek_END;
pub const mkdir = newlib.mkdir;
pub const unlink = newlib.unlink;

pub fn socket(domain: u32, socket_type: u32, protocol: u32) embed.posix.SocketError!socket_t {
    const flags = socket_type & socket_flag_mask;
    const raw_type = socket_type & ~socket_flag_mask;
    const sock = try lwip.socket(domain, raw_type, protocol);
    errdefer close(sock);

    applySocketOpenFlags(sock, flags) catch |err| switch (err) {
        error.ProcessFdQuotaExceeded => return error.ProcessFdQuotaExceeded,
        error.OperationNotSupported,
        error.PermissionDenied,
        error.FileBusy,
        error.Locked,
        error.DeadLock,
        error.LockedRegionLimitExceeded,
        error.Unexpected,
        => return error.Unexpected,
    };
    return sock;
}
pub const bind = lwip.bind;
pub const listen = lwip.listen;
pub fn accept(sock: socket_t, addr: ?*sockaddr, addrlen: ?*socklen_t, flags: u32) embed.posix.AcceptError!socket_t {
    const accepted = try lwip.accept(sock, addr, addrlen, 0);
    errdefer close(accepted);

    applySocketOpenFlags(accepted, flags) catch |err| switch (err) {
        error.ProcessFdQuotaExceeded => return error.ProcessFdQuotaExceeded,
        error.OperationNotSupported => return error.OperationNotSupported,
        error.PermissionDenied,
        error.FileBusy,
        error.Locked,
        error.DeadLock,
        error.LockedRegionLimitExceeded,
        error.Unexpected,
        => return error.Unexpected,
    };
    return accepted;
}
pub const connect = lwip.connect;
pub const send = lwip.send;
pub const recv = lwip.recv;
pub const sendto = lwip.sendto;
pub const recvfrom = lwip.recvfrom;
pub const setsockopt = lwip.setsockopt;
pub const getsockopt = lwip.getsockopt;
pub const shutdown = lwip.shutdown;
pub const getsockname = lwip.getsockname;

fn applySocketOpenFlags(fd: fd_t, flags: u32) SocketFlagError!void {
    if ((flags & ~socket_flag_mask) != 0) {
        return error.OperationNotSupported;
    }

    if ((flags & lwip.SOCK.NONBLOCK) != 0) {
        _ = try fcntl(fd, F.SETFL, embed_nonblock_flag);
    }

    // `CLOEXEC` is a no-op on bare-metal ESP targets with no exec().
}

fn isSocketFd(fd: fd_t) bool {
    var sock_type: i32 = 0;
    lwip.getsockopt(fd, lwip.SOL.SOCKET, lwip.SO.TYPE, bytesOf(&sock_type)) catch return false;
    return sock_type != 0;
}

fn translateEmbedFlagsToSocketFlags(flags: usize) usize {
    // lwIP F_SETFL only implements O_NONBLOCK; passing access-mode bits
    // like O_RDWR causes lwip_fcntl() to mask everything back to 0.
    return if ((flags & embed_nonblock_flag) != 0) socket_nonblock_flag else 0;
}

fn translateSocketFlagsToEmbedFlags(flags: usize) usize {
    var raw = flags & ~socket_nonblock_flag;
    if ((flags & socket_nonblock_flag) != 0) raw |= embed_nonblock_flag;
    return raw;
}

fn bytesOf(ptr: anytype) []u8 {
    const Ptr = @TypeOf(ptr);
    const info = @typeInfo(Ptr);
    if (info != .pointer or info.pointer.size != .one)
        @compileError("bytesOf expects a single-item pointer");

    const T = info.pointer.child;
    const raw: [*]u8 = @ptrCast(ptr);
    return raw[0..@sizeOf(T)];
}

const SocketFlagError = error{OperationNotSupported} || embed.posix.FcntlError;
