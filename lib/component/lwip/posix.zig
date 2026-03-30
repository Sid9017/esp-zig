const embed = @import("embed");
const binding = @import("binding.zig");

pub const socket_t = binding.socket_t;
pub const socklen_t = binding.socklen_t;
pub const sockaddr = binding.sockaddr;

pub const AF = struct {
    pub const UNSPEC: u32 = 0;
    pub const INET: u32 = 2;
    pub const INET6: u32 = 10;
};

pub const SOCK = struct {
    pub const STREAM: u32 = 1;
    pub const DGRAM: u32 = 2;
    pub const RAW: u32 = 3;
    pub const NONBLOCK: u32 = 0x4000;
    pub const CLOEXEC: u32 = 0x80000;
};

pub const IPPROTO = struct {
    pub const IP: u32 = 0;
    pub const ICMP: u32 = 1;
    pub const TCP: u32 = 6;
    pub const UDP: u32 = 17;
    pub const IPV6: u32 = 41;
    pub const ICMPV6: u32 = 58;
    pub const RAW: u32 = 255;
};

pub const SOL = struct {
    pub const SOCKET: c_int = 0xfff;
};

pub const SO = struct {
    pub const DEBUG: u32 = 0x0001;
    pub const ACCEPTCONN: u32 = 0x0002;
    pub const REUSEADDR: u32 = 0x0004;
    pub const KEEPALIVE: u32 = 0x0008;
    pub const BROADCAST: u32 = 0x0020;
    pub const LINGER: u32 = 0x0080;
    pub const REUSEPORT: u32 = 0x0200;
    pub const SNDBUF: u32 = 0x1001;
    pub const RCVBUF: u32 = 0x1002;
    pub const SNDTIMEO: u32 = 0x1005;
    pub const RCVTIMEO: u32 = 0x1006;
    pub const ERROR: u32 = 0x1007;
    pub const TYPE: u32 = 0x1008;
};

const E = struct {
    pub const SUCCESS = 0;
    pub const PERM = 1;
    pub const INTR = 4;
    pub const BADF = 9;
    pub const AGAIN = 11;
    pub const NOMEM = 12;
    pub const ACCES = 13;
    pub const INVAL = 22;
    pub const MFILE = 24;
    pub const PIPE = 32;
    pub const DESTADDRREQ = 89;
    pub const MSGSIZE = 90;
    pub const PROTOTYPE = 91;
    pub const NOPROTOOPT = 92;
    pub const PROTONOSUPPORT = 93;
    pub const SOCKTNOSUPPORT = 94;
    pub const OPNOTSUPP = 95;
    pub const AFNOSUPPORT = 97;
    pub const ADDRINUSE = 98;
    pub const ADDRNOTAVAIL = 99;
    pub const NETUNREACH = 101;
    pub const CONNABORTED = 103;
    pub const CONNRESET = 104;
    pub const NOBUFS = 105;
    pub const ISCONN = 106;
    pub const NOTCONN = 107;
    pub const SHUTDOWN = 108;
    pub const CONNREFUSED = 111;
    pub const TIMEDOUT = 116;
    pub const HOSTUNREACH = 118;
    pub const INPROGRESS = 119;
    pub const ALREADY = 120;
    pub const NOTSOCK = 128;
    pub const WOULD_BLOCK = AGAIN;
};

pub fn socket(domain: u32, socket_type: u32, protocol: u32) embed.posix.SocketError!socket_t {
    const rc = binding.espz_lwip_socket(domain, socket_type, protocol);
    return switch (errnoOf(rc)) {
        E.SUCCESS => rc,
        E.ACCES => error.AccessDenied,
        E.AFNOSUPPORT => error.AddressFamilyNotSupported,
        E.PROTONOSUPPORT => error.ProtocolNotSupported,
        E.PROTOTYPE, E.SOCKTNOSUPPORT => error.ProtocolFamilyNotAvailable,
        E.NOBUFS, E.NOMEM, E.MFILE => error.SystemResources,
        else => error.Unexpected,
    };
}

pub fn bind(sock: socket_t, addr: *const sockaddr, len: socklen_t) embed.posix.BindError!void {
    return switch (errnoOf(binding.espz_lwip_bind(sock, addr, len))) {
        E.SUCCESS => {},
        E.ACCES => error.AccessDenied,
        E.ADDRINUSE => error.AddressInUse,
        E.ADDRNOTAVAIL => error.AddressNotAvailable,
        E.AFNOSUPPORT => error.AddressFamilyNotSupported,
        E.INVAL => error.AlreadyBound,
        else => error.Unexpected,
    };
}

pub fn listen(sock: socket_t, backlog: u31) embed.posix.ListenError!void {
    return switch (errnoOf(binding.espz_lwip_listen(sock, backlog))) {
        E.SUCCESS => {},
        E.ADDRINUSE => error.AddressInUse,
        E.DESTADDRREQ, E.INVAL, E.OPNOTSUPP => error.OperationNotSupported,
        E.ISCONN => error.AlreadyConnected,
        else => error.Unexpected,
    };
}

pub fn accept(sock: socket_t, addr: ?*sockaddr, addrlen: ?*socklen_t, flags: u32) embed.posix.AcceptError!socket_t {
    const rc = binding.espz_lwip_accept(
        sock,
        if (addr) |ptr| ptr else null,
        if (addrlen) |ptr| ptr else null,
        flags,
    );
    return switch (errnoOf(rc)) {
        E.SUCCESS => rc,
        E.WOULD_BLOCK => error.WouldBlock,
        E.CONNABORTED => error.ConnectionAborted,
        E.INVAL => error.SocketNotListening,
        E.MFILE => error.ProcessFdQuotaExceeded,
        E.NOBUFS, E.NOMEM => error.SystemResources,
        E.OPNOTSUPP => error.OperationNotSupported,
        E.PERM => error.BlockedByFirewall,
        else => error.Unexpected,
    };
}

pub fn connect(sock: socket_t, addr: *const sockaddr, len: socklen_t) embed.posix.ConnectError!void {
    while (true) {
        switch (errnoOf(binding.espz_lwip_connect(sock, addr, len))) {
            E.SUCCESS, E.ISCONN => return,
            E.WOULD_BLOCK, E.INPROGRESS => return error.WouldBlock,
            E.ADDRINUSE => return error.AddressInUse,
            E.ADDRNOTAVAIL => return error.AddressNotAvailable,
            E.AFNOSUPPORT => return error.Unexpected,
            E.ALREADY => return error.ConnectionPending,
            E.CONNREFUSED => return error.ConnectionRefused,
            // lwIP can surface an active reject during connect as ECONNRESET
            // instead of ECONNREFUSED, especially on local loopback paths.
            E.CONNRESET => return error.ConnectionRefused,
            E.HOSTUNREACH, E.NETUNREACH => return error.NetworkUnreachable,
            E.TIMEDOUT => return error.ConnectionTimedOut,
            E.INTR => continue,
            E.OPNOTSUPP => return error.ConnectionResetByPeer,
            else => return error.Unexpected,
        }
    }
}

pub fn send(sock: socket_t, buf: []const u8, flags: u32) embed.posix.SendError!usize {
    if (buf.len == 0) return 0;
    while (true) {
        const rc = binding.espz_lwip_send(sock, buf.ptr, buf.len, flags);
        switch (errnoOf(rc)) {
            E.SUCCESS => return @intCast(rc),
            E.AGAIN => return error.WouldBlock,
            E.ALREADY => return error.FastOpenAlreadyInProgress,
            E.CONNRESET => return error.ConnectionResetByPeer,
            E.INTR => continue,
            E.INVAL => return error.Unexpected,
            E.ISCONN => return error.Unexpected,
            E.MSGSIZE => return error.MessageTooBig,
            E.NOBUFS, E.NOMEM => return error.SystemResources,
            E.NOTCONN, E.SHUTDOWN => return error.Unexpected,
            E.OPNOTSUPP => return error.Unexpected,
            E.PIPE => return error.BrokenPipe,
            E.AFNOSUPPORT => return error.Unexpected,
            else => return error.Unexpected,
        }
    }
}

pub fn recv(sock: socket_t, buf: []u8, flags: u32) embed.posix.RecvFromError!usize {
    if (buf.len == 0) return 0;
    while (true) {
        const rc = binding.espz_lwip_recv(sock, buf.ptr, buf.len, flags);
        switch (errnoOf(rc)) {
            E.SUCCESS => return @intCast(rc),
            E.WOULD_BLOCK => return error.WouldBlock,
            E.CONNRESET => return error.ConnectionResetByPeer,
            E.INTR => continue,
            E.INVAL => return error.Unexpected,
            E.NOMEM => return error.SystemResources,
            E.NOTCONN => return error.SocketNotConnected,
            E.TIMEDOUT => return error.ConnectionTimedOut,
            else => return error.Unexpected,
        }
    }
}

pub fn sendto(
    sock: socket_t,
    buf: []const u8,
    flags: u32,
    dest_addr: ?*const sockaddr,
    addrlen: socklen_t,
) embed.posix.SendToError!usize {
    if (buf.len == 0) return 0;
    while (true) {
        const rc = binding.espz_lwip_sendto(
            sock,
            buf.ptr,
            buf.len,
            flags,
            if (dest_addr) |ptr| ptr else null,
            addrlen,
        );
        switch (errnoOf(rc)) {
            E.SUCCESS => return @intCast(rc),
            E.AGAIN => return error.WouldBlock,
            E.CONNRESET => return error.ConnectionResetByPeer,
            E.INTR => continue,
            E.INVAL => return error.Unexpected,
            E.ISCONN => return error.Unexpected,
            E.MSGSIZE => return error.MessageTooBig,
            E.NOBUFS, E.NOMEM => return error.SystemResources,
            E.NOTCONN => return error.SocketNotConnected,
            E.OPNOTSUPP => return error.Unexpected,
            E.PIPE => return error.BrokenPipe,
            E.AFNOSUPPORT => return error.AddressFamilyNotSupported,
            else => return error.Unexpected,
        }
    }
}

pub fn recvfrom(
    sock: socket_t,
    buf: []u8,
    flags: u32,
    src_addr: ?*sockaddr,
    addrlen: ?*socklen_t,
) embed.posix.RecvFromError!usize {
    if (buf.len == 0) return 0;
    while (true) {
        const rc = binding.espz_lwip_recvfrom(
            sock,
            buf.ptr,
            buf.len,
            flags,
            if (src_addr) |ptr| ptr else null,
            if (addrlen) |ptr| ptr else null,
        );
        switch (errnoOf(rc)) {
            E.SUCCESS => return @intCast(rc),
            E.WOULD_BLOCK => return error.WouldBlock,
            E.CONNRESET => return error.ConnectionResetByPeer,
            E.INTR => continue,
            E.INVAL => return error.Unexpected,
            E.NOMEM => return error.SystemResources,
            E.NOTCONN => return error.SocketNotConnected,
            E.TIMEDOUT => return error.ConnectionTimedOut,
            else => return error.Unexpected,
        }
    }
}

pub fn setsockopt(
    sock: socket_t,
    level: c_int,
    optname: u32,
    opt: []const u8,
) embed.posix.SetSockOptError!void {
    return switch (errnoOf(binding.espz_lwip_setsockopt(
        sock,
        level,
        optname,
        if (opt.len == 0) null else opt.ptr,
        @intCast(opt.len),
    ))) {
        E.SUCCESS => {},
        E.INVAL, E.NOPROTOOPT => error.InvalidProtocolOption,
        E.ISCONN => error.AlreadyConnected,
        E.NOMEM => error.SystemResources,
        else => error.Unexpected,
    };
}

pub fn getsockopt(
    sock: socket_t,
    level: c_int,
    optname: u32,
    opt: []u8,
) embed.posix.GetSockOptError!void {
    var opt_len: socklen_t = @intCast(opt.len);
    return switch (errnoOf(binding.espz_lwip_getsockopt(
        sock,
        level,
        optname,
        if (opt.len == 0) null else opt.ptr,
        &opt_len,
    ))) {
        E.SUCCESS => {
            if (opt_len > opt.len) return error.Unexpected;
        },
        E.NOPROTOOPT, E.INVAL => error.InvalidProtocolOption,
        E.NOBUFS, E.NOMEM => error.SystemResources,
        E.ACCES => error.AccessDenied,
        else => error.Unexpected,
    };
}

pub fn shutdown(sock: socket_t, how: embed.posix.ShutdownHow) embed.posix.ShutdownError!void {
    const how_value: c_int = switch (how) {
        .recv => 0,
        .send => 1,
        .both => 2,
    };
    return switch (errnoOf(binding.espz_lwip_shutdown(sock, how_value))) {
        E.SUCCESS => {},
        E.CONNRESET => error.ConnectionResetByPeer,
        E.INVAL => error.ConnectionAborted,
        E.NOTCONN => error.SocketNotConnected,
        else => error.Unexpected,
    };
}

pub fn getsockname(sock: socket_t, addr: *sockaddr, addrlen: *socklen_t) embed.posix.GetSockNameError!void {
    return switch (errnoOf(binding.espz_lwip_getsockname(sock, addr, addrlen))) {
        E.SUCCESS => {},
        E.INVAL => error.SocketNotBound,
        else => error.Unexpected,
    };
}

fn errnoOf(rc: anytype) c_int {
    return if (rc == -1) binding.espz_lwip_errno() else E.SUCCESS;
}
