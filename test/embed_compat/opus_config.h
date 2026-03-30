#ifndef ESP_ZIG_TEST_EMBED_COMPAT_OPUS_CONFIG_H
#define ESP_ZIG_TEST_EMBED_COMPAT_OPUS_CONFIG_H

/* Custom headers replace the package defaults, so restate the full config. */
#define FIXED_POINT 1
#define OPUS_BUILD 1
#define USE_ALLOCA 1

/* Xtensa newlib exposes lrint/lrintf in math.h and libm. */
#define HAVE_LRINT 1
#define HAVE_LRINTF 1

/* Keep the float API enabled so host opus tests can link. */

#endif
