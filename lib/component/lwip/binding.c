#include <errno.h>
#include <netinet/in.h>
#include <stddef.h>
#include <stdint.h>
#include <sys/socket.h>

int espz_lwip_socket(uint32_t domain, uint32_t socket_type, uint32_t protocol)
{
    return socket((int)domain, (int)socket_type, (int)protocol);
}

int espz_lwip_bind(int sock, const void *addr, uint32_t len)
{
    return bind(sock, (const struct sockaddr *)addr, (socklen_t)len);
}

int espz_lwip_listen(int sock, uint32_t backlog)
{
    return listen(sock, (int)backlog);
}

int espz_lwip_accept(int sock, void *addr, uint32_t *addrlen, uint32_t flags)
{
    if (flags != 0U) {
        errno = EOPNOTSUPP;
        return -1;
    }

    socklen_t local_len = 0;
    socklen_t *local_len_ptr = NULL;
    if (addrlen != NULL) {
        local_len = (socklen_t)(*addrlen);
        local_len_ptr = &local_len;
    }

    const int rc = accept(sock, (struct sockaddr *)addr, local_len_ptr);
    if (addrlen != NULL && local_len_ptr != NULL) {
        *addrlen = (uint32_t)local_len;
    }
    return rc;
}

int espz_lwip_connect(int sock, const void *addr, uint32_t len)
{
    return connect(sock, (const struct sockaddr *)addr, (socklen_t)len);
}

ssize_t espz_lwip_send(int sock, const void *buf, size_t len, uint32_t flags)
{
    return send(sock, buf, len, (int)flags);
}

ssize_t espz_lwip_recv(int sock, void *buf, size_t len, uint32_t flags)
{
    return recv(sock, buf, len, (int)flags);
}

ssize_t espz_lwip_sendto(
    int sock,
    const void *buf,
    size_t len,
    uint32_t flags,
    const void *dest_addr,
    uint32_t addrlen)
{
    return sendto(sock, buf, len, (int)flags, (const struct sockaddr *)dest_addr, (socklen_t)addrlen);
}

ssize_t espz_lwip_recvfrom(
    int sock,
    void *buf,
    size_t len,
    uint32_t flags,
    void *src_addr,
    uint32_t *addrlen)
{
    socklen_t local_len = 0;
    socklen_t *local_len_ptr = NULL;
    if (addrlen != NULL) {
        local_len = (socklen_t)(*addrlen);
        local_len_ptr = &local_len;
    }

    const ssize_t rc = recvfrom(sock, buf, len, (int)flags, (struct sockaddr *)src_addr, local_len_ptr);
    if (addrlen != NULL && local_len_ptr != NULL) {
        *addrlen = (uint32_t)local_len;
    }
    return rc;
}

int espz_lwip_setsockopt(int sock, int32_t level, uint32_t optname, const void *opt, uint32_t optlen)
{
    return setsockopt(sock, level, (int)optname, opt, (socklen_t)optlen);
}

int espz_lwip_getsockopt(int sock, int32_t level, uint32_t optname, void *opt, uint32_t *optlen)
{
    socklen_t local_len = (socklen_t)(*optlen);
    const int rc = getsockopt(sock, level, (int)optname, opt, &local_len);
    *optlen = (uint32_t)local_len;
    return rc;
}

int espz_lwip_shutdown(int sock, int32_t how)
{
    return shutdown(sock, how);
}

int espz_lwip_getsockname(int sock, void *addr, uint32_t *addrlen)
{
    socklen_t local_len = (socklen_t)(*addrlen);
    const int rc = getsockname(sock, (struct sockaddr *)addr, &local_len);
    *addrlen = (uint32_t)local_len;
    return rc;
}

int espz_lwip_errno(void)
{
    return errno;
}
