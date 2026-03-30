pub const fd_t = i32;
pub const mode_t = u32;
const time_t = i64;

pub const timeval = extern struct {
    tv_sec: time_t,
    tv_usec: c_long,
};

pub const timespec = extern struct {
    tv_sec: time_t,
    tv_nsec: c_long,
};

pub const pollfd = extern struct {
    fd: fd_t,
    events: c_short,
    revents: c_short,
};

pub extern fn espz_newlib_errno() c_int;
pub extern fn espz_newlib_poll(fds: ?*pollfd, nfds: u32, timeout: i32) c_int;
pub extern fn espz_newlib_close(fd: fd_t) void;
pub extern fn espz_newlib_open(path: [*:0]const u8, flags: c_int, mode: mode_t) c_int;
pub extern fn espz_newlib_fcntl(fd: fd_t, cmd: c_int, arg: usize) c_int;
pub extern fn espz_newlib_read(fd: fd_t, buf: ?*anyopaque, len: usize) isize;
pub extern fn espz_newlib_write(fd: fd_t, buf: ?*const anyopaque, len: usize) isize;
pub extern fn espz_newlib_lseek_set(fd: fd_t, offset: u64) i64;
pub extern fn espz_newlib_lseek_cur(fd: fd_t, offset: i64) i64;
pub extern fn espz_newlib_lseek_cur_get(fd: fd_t) i64;
pub extern fn espz_newlib_lseek_end(fd: fd_t, offset: i64) i64;
pub extern fn espz_newlib_mkdir(path: [*:0]const u8, mode: mode_t) c_int;
pub extern fn espz_newlib_unlink(path: [*:0]const u8) c_int;
pub extern fn espz_newlib_clock_gettime_monotonic(ts: *timespec) c_int;
