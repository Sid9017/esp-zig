#include <errno.h>
#include <fcntl.h>
#include <stdint.h>
#include <sys/poll.h>
#include <sys/stat.h>
#include <time.h>
#include <unistd.h>

int espz_newlib_errno(void)
{
    return errno;
}

int espz_newlib_poll(struct pollfd *fds, uint32_t nfds, int32_t timeout)
{
    return poll(fds, (nfds_t)nfds, timeout);
}

void espz_newlib_close(int fd)
{
    (void)close(fd);
}

int espz_newlib_open(const char *path, int flags, uint32_t mode)
{
    return open(path, flags, (mode_t)mode);
}

int espz_newlib_fcntl(int fd, int cmd, uintptr_t arg)
{
    switch (cmd) {
        case F_GETFL:
            return fcntl(fd, cmd);
        case F_SETFL:
            return fcntl(fd, cmd, (int)arg);
        default:
            errno = EINVAL;
            return -1;
    }
}

ssize_t espz_newlib_read(int fd, void *buf, size_t len)
{
    return read(fd, buf, len);
}

ssize_t espz_newlib_write(int fd, const void *buf, size_t len)
{
    return write(fd, buf, len);
}

int64_t espz_newlib_lseek_set(int fd, uint64_t offset)
{
    return (int64_t)lseek(fd, (off_t)offset, SEEK_SET);
}

int64_t espz_newlib_lseek_cur(int fd, int64_t offset)
{
    return (int64_t)lseek(fd, (off_t)offset, SEEK_CUR);
}

int64_t espz_newlib_lseek_cur_get(int fd)
{
    return (int64_t)lseek(fd, (off_t)0, SEEK_CUR);
}

int64_t espz_newlib_lseek_end(int fd, int64_t offset)
{
    return (int64_t)lseek(fd, (off_t)offset, SEEK_END);
}

int espz_newlib_mkdir(const char *path, uint32_t mode)
{
    return mkdir(path, (mode_t)mode);
}

int espz_newlib_unlink(const char *path)
{
    return unlink(path);
}

int espz_newlib_clock_gettime_monotonic(struct timespec *ts)
{
    return clock_gettime(CLOCK_MONOTONIC, ts);
}
