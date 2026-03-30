const embed = @import("embed");
const binding = @import("binding.zig");
const time_t = i64;

pub const fd_t = binding.fd_t;
pub const mode_t = binding.mode_t;
pub const pollfd = binding.pollfd;

pub const timeval = extern struct {
    sec: time_t,
    usec: c_long,
};

pub const timespec = extern struct {
    sec: time_t,
    nsec: c_long,
};

comptime {
    if (@sizeOf(timeval) != @sizeOf(binding.timeval) or @alignOf(timeval) != @alignOf(binding.timeval))
        @compileError("newlib.Posix.timeval must match binding.timeval layout");
    if (@sizeOf(timespec) != @sizeOf(binding.timespec) or @alignOf(timespec) != @alignOf(binding.timespec))
        @compileError("newlib.Posix.timespec must match binding.timespec layout");
}

pub const O = packed struct(u32) {
    ACCMODE: AccessMode = .RDONLY,
    _reserved2: u1 = 0,
    APPEND: bool = false,
    _reserved4_8: u5 = 0,
    CREAT: bool = false,
    TRUNC: bool = false,
    EXCL: bool = false,
    _reserved12_13: u2 = 0,
    NONBLOCK: bool = false,
    _reserved15_17: u3 = 0,
    CLOEXEC: bool = false,
    _reserved19_31: u13 = 0,

    pub const AccessMode = enum(u2) {
        RDONLY = 0,
        WRONLY = 1,
        RDWR = 2,
    };

    pub const RDONLY = AccessMode.RDONLY;
    pub const WRONLY = AccessMode.WRONLY;
    pub const RDWR = AccessMode.RDWR;

    pub fn bits(self: O) c_int {
        return @bitCast(self);
    }
};

pub const F = struct {
    pub const GETFL: c_int = 3;
    pub const SETFL: c_int = 4;
};

pub const POLL = struct {
    pub const IN: c_short = 1 << 0;
    pub const RDNORM: c_short = 1 << 1;
    pub const RDBAND: c_short = 1 << 2;
    pub const PRI: c_short = RDBAND;
    pub const OUT: c_short = 1 << 3;
    pub const WRNORM: c_short = OUT;
    pub const WRBAND: c_short = 1 << 4;
    pub const ERR: c_short = 1 << 5;
    pub const HUP: c_short = 1 << 6;
    pub const NVAL: c_short = 1 << 7;
};

const path_max = 1024;

pub const E = struct {
    pub const SUCCESS = 0;
    pub const PERM = 1;
    pub const NOENT = 2;
    pub const SRCH = 3;
    pub const INTR = 4;
    pub const IO = 5;
    pub const NXIO = 6;
    pub const BADF = 9;
    pub const AGAIN = 11;
    pub const NOMEM = 12;
    pub const ACCES = 13;
    pub const BUSY = 16;
    pub const EXIST = 17;
    pub const NODEV = 19;
    pub const NOTDIR = 20;
    pub const ISDIR = 21;
    pub const INVAL = 22;
    pub const NFILE = 23;
    pub const MFILE = 24;
    pub const FBIG = 27;
    pub const NOSPC = 28;
    pub const SPIPE = 29;
    pub const PIPE = 32;
    pub const DEADLK = 45;
    pub const NOLCK = 46;
    pub const DQUOT = 132;
    pub const LOOP = 92;
    pub const CONNRESET = 104;
    pub const NOBUFS = 105;
    pub const TIMEDOUT = 116;
    pub const NOTCONN = 128;
    pub const ILSEQ = 138;
    pub const OVERFLOW = 139;
    pub const CANCELED = 140;
};

pub fn poll(fds: []pollfd, timeout: i32) embed.posix.PollError!usize {
    while (true) {
        const rc = binding.espz_newlib_poll(if (fds.len == 0) null else &fds[0], @intCast(fds.len), timeout);
        switch (errnoOf(rc)) {
            E.SUCCESS => return @intCast(rc),
            E.INTR => continue,
            E.NOMEM => return error.SystemResources,
            else => return error.Unexpected,
        }
    }
}

pub fn close(fd: fd_t) void {
    binding.espz_newlib_close(fd);
}

pub fn open(path: []const u8, flags: O, mode: mode_t) embed.posix.OpenError!fd_t {
    const path_z = try toPathZ(path);
    while (true) {
        const rc = binding.espz_newlib_open(&path_z, flags.bits(), mode);
        switch (errnoOf(rc)) {
            E.SUCCESS => return rc,
            E.INTR => continue,
            E.INVAL => return error.BadPathName,
            E.ACCES => return error.AccessDenied,
            E.FBIG, E.OVERFLOW => return error.FileTooBig,
            E.ISDIR => return error.IsDir,
            E.LOOP => return error.SymLinkLoop,
            E.MFILE => return error.ProcessFdQuotaExceeded,
            91 => return error.NameTooLong,
            E.NFILE => return error.SystemFdQuotaExceeded,
            E.NODEV => return error.NoDevice,
            E.NOENT => return error.FileNotFound,
            E.SRCH => return error.ProcessNotFound,
            E.NOMEM => return error.SystemResources,
            E.NOSPC => return error.NoSpaceLeft,
            E.NOTDIR => return error.NotDir,
            E.PERM => return error.PermissionDenied,
            E.EXIST => return error.PathAlreadyExists,
            E.BUSY => return error.DeviceBusy,
            E.AGAIN => return error.WouldBlock,
            else => return error.Unexpected,
        }
    }
}

pub fn fcntl(fd: fd_t, cmd: i32, arg: usize) embed.posix.FcntlError!usize {
    while (true) {
        const rc = binding.espz_newlib_fcntl(fd, cmd, arg);
        switch (errnoOf(rc)) {
            E.SUCCESS => return @intCast(rc),
            E.INTR => continue,
            E.AGAIN, E.ACCES => return error.Locked,
            E.BADF => unreachable,
            E.BUSY => return error.FileBusy,
            E.PERM => return error.PermissionDenied,
            E.MFILE => return error.ProcessFdQuotaExceeded,
            E.DEADLK => return error.DeadLock,
            E.NOLCK => return error.LockedRegionLimitExceeded,
            else => return error.Unexpected,
        }
    }
}

pub fn read(fd: fd_t, buf: []u8) embed.posix.ReadError!usize {
    if (buf.len == 0) return 0;
    while (true) {
        const rc = binding.espz_newlib_read(fd, buf.ptr, buf.len);
        switch (errnoOf(rc)) {
            E.SUCCESS => return @intCast(rc),
            E.INTR => continue,
            E.SRCH => return error.ProcessNotFound,
            E.AGAIN => return error.WouldBlock,
            E.CANCELED => return error.Canceled,
            E.BADF => return error.NotOpenForReading,
            E.IO => return error.InputOutput,
            E.ISDIR => return error.IsDir,
            E.NOBUFS, E.NOMEM => return error.SystemResources,
            E.NOTCONN => return error.SocketNotConnected,
            E.CONNRESET => return error.ConnectionResetByPeer,
            E.TIMEDOUT => return error.ConnectionTimedOut,
            else => return error.Unexpected,
        }
    }
}

pub fn write(fd: fd_t, buf: []const u8) embed.posix.WriteError!usize {
    if (buf.len == 0) return 0;
    while (true) {
        const rc = binding.espz_newlib_write(fd, buf.ptr, buf.len);
        switch (errnoOf(rc)) {
            E.SUCCESS => return @intCast(rc),
            E.INTR => continue,
            E.INVAL => return error.InvalidArgument,
            E.SRCH => return error.ProcessNotFound,
            E.AGAIN => return error.WouldBlock,
            E.BADF => return error.NotOpenForWriting,
            E.DQUOT => return error.DiskQuota,
            E.FBIG => return error.FileTooBig,
            E.IO => return error.InputOutput,
            E.NOSPC => return error.NoSpaceLeft,
            E.PERM => return error.PermissionDenied,
            E.PIPE => return error.BrokenPipe,
            E.BUSY => return error.DeviceBusy,
            E.CONNRESET => return error.ConnectionResetByPeer,
            E.NOBUFS, E.NOMEM => return error.SystemResources,
            E.NODEV => return error.NoDevice,
            else => return error.Unexpected,
        }
    }
}

pub fn lseek_SET(fd: fd_t, offset: u64) embed.posix.SeekError!void {
    _ = try seekResult(binding.espz_newlib_lseek_set(fd, offset));
}

pub fn lseek_CUR(fd: fd_t, offset: i64) embed.posix.SeekError!void {
    _ = try seekResult(binding.espz_newlib_lseek_cur(fd, offset));
}

pub fn lseek_CUR_get(fd: fd_t) embed.posix.SeekError!u64 {
    return @intCast(try seekResult(binding.espz_newlib_lseek_cur_get(fd)));
}

pub fn lseek_END(fd: fd_t, offset: i64) embed.posix.SeekError!void {
    _ = try seekResult(binding.espz_newlib_lseek_end(fd, offset));
}

pub fn mkdir(path: []const u8, mode: mode_t) embed.posix.MakeDirError!void {
    const path_z = try toPathZ(path);
    switch (errnoOf(binding.espz_newlib_mkdir(&path_z, mode))) {
        E.SUCCESS => return,
        E.ACCES => return error.AccessDenied,
        E.PERM => return error.PermissionDenied,
        E.DQUOT => return error.DiskQuota,
        E.EXIST => return error.PathAlreadyExists,
        E.LOOP => return error.SymLinkLoop,
        91 => return error.NameTooLong,
        E.NOENT => return error.FileNotFound,
        E.NOMEM => return error.SystemResources,
        E.NOSPC => return error.NoSpaceLeft,
        E.NOTDIR => return error.NotDir,
        30 => return error.ReadOnlyFileSystem,
        else => return error.Unexpected,
    }
}

pub fn unlink(path: []const u8) embed.posix.UnlinkError!void {
    const path_z = try toPathZ(path);
    switch (errnoOf(binding.espz_newlib_unlink(&path_z))) {
        E.SUCCESS => return,
        E.ACCES => return error.AccessDenied,
        E.PERM => return error.PermissionDenied,
        E.BUSY => return error.FileBusy,
        E.IO => return error.FileSystem,
        E.ISDIR => return error.IsDir,
        E.LOOP => return error.SymLinkLoop,
        91 => return error.NameTooLong,
        E.NOENT => return error.FileNotFound,
        E.NOTDIR => return error.NotDir,
        E.NOMEM => return error.SystemResources,
        30 => return error.ReadOnlyFileSystem,
        else => return error.Unexpected,
    }
}

fn seekResult(rc: i64) embed.posix.SeekError!i64 {
    return switch (errnoOf(rc)) {
        E.SUCCESS => rc,
        E.INVAL, E.OVERFLOW, E.SPIPE, E.NXIO => error.Unseekable,
        else => error.Unexpected,
    };
}

fn errnoOf(rc: anytype) c_int {
    return if (rc == -1) binding.espz_newlib_errno() else E.SUCCESS;
}

fn toPathZ(path: []const u8) error{NameTooLong}![path_max:0]u8 {
    if (path.len >= path_max) return error.NameTooLong;
    var path_z: [path_max:0]u8 = undefined;
    @memcpy(path_z[0..path.len], path);
    path_z[path.len] = 0;
    return path_z;
}
