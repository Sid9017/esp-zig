pub const socket_t = i32;
pub const socklen_t = u32;

pub const sockaddr = extern struct {
    len: u8,
    family: u8,
    data: [14]u8,

    pub const in = extern struct {
        len: u8 = @sizeOf(@This()),
        family: u8 = 2,
        port: u16 = 0,
        addr: u32 = 0,
        zero: [8]u8 = [_]u8{0} ** 8,
    };

    pub const in6 = extern struct {
        len: u8 = @sizeOf(@This()),
        family: u8 = 10,
        port: u16 = 0,
        flowinfo: u32 = 0,
        addr: [16]u8 = [_]u8{0} ** 16,
        scope_id: u32 = 0,
    };

    // sockaddr_storage-compatible scratch buffer for APIs like accept/getsockname.
    pub const storage = extern struct {
        len: u8 = @sizeOf(@This()),
        family: u8 = 0,
        _padding0: u16 = 0,
        _padding1: u32 = 0,
        data: [20]u8 = [_]u8{0} ** 20,
    };
};

pub extern fn espz_lwip_socket(domain: u32, socket_type: u32, protocol: u32) c_int;
pub extern fn espz_lwip_bind(sock: socket_t, addr: ?*const anyopaque, len: socklen_t) c_int;
pub extern fn espz_lwip_listen(sock: socket_t, backlog: u32) c_int;
pub extern fn espz_lwip_accept(sock: socket_t, addr: ?*anyopaque, addrlen: ?*socklen_t, flags: u32) c_int;
pub extern fn espz_lwip_connect(sock: socket_t, addr: ?*const anyopaque, len: socklen_t) c_int;
pub extern fn espz_lwip_send(sock: socket_t, buf: ?*const anyopaque, len: usize, flags: u32) isize;
pub extern fn espz_lwip_recv(sock: socket_t, buf: ?*anyopaque, len: usize, flags: u32) isize;
pub extern fn espz_lwip_sendto(
    sock: socket_t,
    buf: ?*const anyopaque,
    len: usize,
    flags: u32,
    dest_addr: ?*const anyopaque,
    addrlen: socklen_t,
) isize;
pub extern fn espz_lwip_recvfrom(
    sock: socket_t,
    buf: ?*anyopaque,
    len: usize,
    flags: u32,
    src_addr: ?*anyopaque,
    addrlen: ?*socklen_t,
) isize;
pub extern fn espz_lwip_setsockopt(
    sock: socket_t,
    level: i32,
    optname: u32,
    opt: ?*const anyopaque,
    optlen: socklen_t,
) c_int;
pub extern fn espz_lwip_getsockopt(
    sock: socket_t,
    level: i32,
    optname: u32,
    opt: ?*anyopaque,
    optlen: *socklen_t,
) c_int;
pub extern fn espz_lwip_shutdown(sock: socket_t, how: i32) c_int;
pub extern fn espz_lwip_getsockname(sock: socket_t, addr: ?*anyopaque, addrlen: *socklen_t) c_int;
pub extern fn espz_lwip_errno() c_int;
