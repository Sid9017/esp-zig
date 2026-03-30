#include <stddef.h>
#include <stdint.h>

#include "esp_random.h"

void espz_esp_hw_support_fill_random(uint8_t *buf, size_t len)
{
    esp_fill_random(buf, len);
}

uint32_t espz_esp_hw_support_random_u32(void)
{
    return esp_random();
}
