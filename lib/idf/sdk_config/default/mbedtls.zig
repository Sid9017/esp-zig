const std = @import("std");
const sdkconfig = @import("../sdkconfig.zig");

pub const module_name = "mbedtls";

pub const Config = struct {
    /// Kconfig key: `CONFIG_MBEDTLS_AES_C`.
    /// Controls whether mbedtls AES C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_aes_c: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_AES_INTERRUPT_LEVEL`.
    /// Sets the numeric value for mbedtls AES interrupt level in the `mbedtls` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `0`.
    mbedtls_aes_interrupt_level: i64 = 0,
    /// Kconfig key: `CONFIG_MBEDTLS_AES_USE_INTERRUPT`.
    /// Controls whether mbedtls AES USE interrupt is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_aes_use_interrupt: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ASYMMETRIC_CONTENT_LEN`.
    /// Controls whether mbedtls asymmetric content LEN is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_asymmetric_content_len: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ATCA_HW_ECDSA_SIGN`.
    /// Controls whether mbedtls ATCA HW ecdsa SIGN is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_atca_hw_ecdsa_sign: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_ATCA_HW_ECDSA_VERIFY`.
    /// Controls whether mbedtls ATCA HW ecdsa verify is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_atca_hw_ecdsa_verify: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_BLOWFISH_C`.
    /// Controls whether mbedtls blowfish C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_blowfish_c: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_CAMELLIA_C`.
    /// Controls whether mbedtls camellia C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_camellia_c: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_CCM_C`.
    /// Controls whether mbedtls CCM C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ccm_c: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_CERTIFICATE_BUNDLE`.
    /// Controls whether mbedtls certificate bundle is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_certificate_bundle: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_CERTIFICATE_BUNDLE_DEFAULT_CMN`.
    /// Controls whether mbedtls certificate bundle default CMN is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_certificate_bundle_default_cmn: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_CERTIFICATE_BUNDLE_DEFAULT_FULL`.
    /// Controls whether mbedtls certificate bundle default FULL is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_certificate_bundle_default_full: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_CERTIFICATE_BUNDLE_DEFAULT_NONE`.
    /// Controls whether mbedtls certificate bundle default NONE is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_certificate_bundle_default_none: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_CERTIFICATE_BUNDLE_DEPRECATED_LIST`.
    /// Controls whether mbedtls certificate bundle deprecated LIST is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_certificate_bundle_deprecated_list: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_CERTIFICATE_BUNDLE_MAX_CERTS`.
    /// Sets the numeric value for mbedtls certificate bundle MAX certs in the `mbedtls` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `200`.
    mbedtls_certificate_bundle_max_certs: i64 = 200,
    /// Kconfig key: `CONFIG_MBEDTLS_CHACHA20_C`.
    /// Controls whether mbedtls chacha20 C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_chacha20_c: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_CLIENT_SSL_SESSION_TICKETS`.
    /// Controls whether mbedtls client SSL session tickets is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_client_ssl_session_tickets: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_CMAC_C`.
    /// Controls whether mbedtls CMAC C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_cmac_c: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_CUSTOM_CERTIFICATE_BUNDLE`.
    /// Controls whether mbedtls custom certificate bundle is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_custom_certificate_bundle: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_CUSTOM_MEM_ALLOC`.
    /// Controls whether mbedtls custom MEM alloc is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_custom_mem_alloc: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_DEBUG`.
    /// Controls whether mbedtls debug is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_debug: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_DEFAULT_MEM_ALLOC`.
    /// Controls whether mbedtls default MEM alloc is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_default_mem_alloc: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_DES_C`.
    /// Controls whether mbedtls DES C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_des_c: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_DHM_C`.
    /// Controls whether mbedtls DHM C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_dhm_c: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_DYNAMIC_BUFFER`.
    /// Controls whether mbedtls dynamic buffer is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_dynamic_buffer: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_ECDH_C`.
    /// Controls whether mbedtls ECDH C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecdh_c: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECDSA_C`.
    /// Controls whether mbedtls ecdsa C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecdsa_c: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECDSA_DETERMINISTIC`.
    /// Controls whether mbedtls ecdsa deterministic is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecdsa_deterministic: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECJPAKE_C`.
    /// Controls whether mbedtls ecjpake C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_ecjpake_c: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_C`.
    /// Controls whether mbedtls ECP C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecp_c: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_DP_BP256R1_ENABLED`.
    /// Controls whether mbedtls ECP DP bp256r1 enabled is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecp_dp_bp256r1_enabled: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_DP_BP384R1_ENABLED`.
    /// Controls whether mbedtls ECP DP bp384r1 enabled is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecp_dp_bp384r1_enabled: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_DP_BP512R1_ENABLED`.
    /// Controls whether mbedtls ECP DP bp512r1 enabled is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecp_dp_bp512r1_enabled: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_DP_CURVE25519_ENABLED`.
    /// Controls whether mbedtls ECP DP curve25519 enabled is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecp_dp_curve25519_enabled: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_DP_SECP192K1_ENABLED`.
    /// Controls whether mbedtls ECP DP secp192k1 enabled is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecp_dp_secp192k1_enabled: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_DP_SECP192R1_ENABLED`.
    /// Controls whether mbedtls ECP DP secp192r1 enabled is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecp_dp_secp192r1_enabled: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_DP_SECP224K1_ENABLED`.
    /// Controls whether mbedtls ECP DP secp224k1 enabled is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecp_dp_secp224k1_enabled: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_DP_SECP224R1_ENABLED`.
    /// Controls whether mbedtls ECP DP secp224r1 enabled is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecp_dp_secp224r1_enabled: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_DP_SECP256K1_ENABLED`.
    /// Controls whether mbedtls ECP DP secp256k1 enabled is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecp_dp_secp256k1_enabled: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_DP_SECP256R1_ENABLED`.
    /// Controls whether mbedtls ECP DP secp256r1 enabled is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecp_dp_secp256r1_enabled: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_DP_SECP384R1_ENABLED`.
    /// Controls whether mbedtls ECP DP secp384r1 enabled is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecp_dp_secp384r1_enabled: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_DP_SECP521R1_ENABLED`.
    /// Controls whether mbedtls ECP DP secp521r1 enabled is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecp_dp_secp521r1_enabled: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_FIXED_POINT_OPTIM`.
    /// Controls whether mbedtls ECP fixed point optim is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_ecp_fixed_point_optim: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_NIST_OPTIM`.
    /// Controls whether mbedtls ECP NIST optim is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ecp_nist_optim: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_ECP_RESTARTABLE`.
    /// Controls whether mbedtls ECP restartable is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_ecp_restartable: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_ERROR_STRINGS`.
    /// Controls whether mbedtls error strings is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_error_strings: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_FS_IO`.
    /// Controls whether mbedtls FS IO is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_fs_io: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_GCM_C`.
    /// Controls whether mbedtls GCM C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_gcm_c: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_GCM_SUPPORT_NON_AES_CIPHER`.
    /// Controls whether mbedtls GCM support NON AES cipher is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_gcm_support_non_aes_cipher: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_HARDWARE_AES`.
    /// Controls whether mbedtls hardware AES is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_hardware_aes: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_HARDWARE_MPI`.
    /// Controls whether mbedtls hardware MPI is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_hardware_mpi: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_HARDWARE_SHA`.
    /// Controls whether mbedtls hardware SHA is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_hardware_sha: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_HAVE_TIME`.
    /// Controls whether mbedtls HAVE TIME is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_have_time: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_HAVE_TIME_DATE`.
    /// Controls whether mbedtls HAVE TIME DATE is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_have_time_date: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_HKDF_C`.
    /// Controls whether mbedtls HKDF C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_hkdf_c: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_INTERNAL_MEM_ALLOC`.
    /// Controls whether mbedtls internal MEM alloc is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_internal_mem_alloc: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_KEY_EXCHANGE_ECDHE_ECDSA`.
    /// Controls whether mbedtls KEY exchange ecdhe ecdsa is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_key_exchange_ecdhe_ecdsa: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_KEY_EXCHANGE_ECDHE_RSA`.
    /// Controls whether mbedtls KEY exchange ecdhe RSA is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_key_exchange_ecdhe_rsa: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_KEY_EXCHANGE_ECDH_ECDSA`.
    /// Controls whether mbedtls KEY exchange ECDH ecdsa is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_key_exchange_ecdh_ecdsa: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_KEY_EXCHANGE_ECDH_RSA`.
    /// Controls whether mbedtls KEY exchange ECDH RSA is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_key_exchange_ecdh_rsa: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_KEY_EXCHANGE_ELLIPTIC_CURVE`.
    /// Controls whether mbedtls KEY exchange elliptic curve is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_key_exchange_elliptic_curve: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_KEY_EXCHANGE_RSA`.
    /// Controls whether mbedtls KEY exchange RSA is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_key_exchange_rsa: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_LARGE_KEY_SOFTWARE_MPI`.
    /// Controls whether mbedtls large KEY software MPI is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_large_key_software_mpi: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_MPI_INTERRUPT_LEVEL`.
    /// Sets the numeric value for mbedtls MPI interrupt level in the `mbedtls` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `0`.
    mbedtls_mpi_interrupt_level: i64 = 0,
    /// Kconfig key: `CONFIG_MBEDTLS_MPI_USE_INTERRUPT`.
    /// Controls whether mbedtls MPI USE interrupt is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_mpi_use_interrupt: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_NIST_KW_C`.
    /// Controls whether mbedtls NIST KW C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_nist_kw_c: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_PEM_PARSE_C`.
    /// Controls whether mbedtls PEM parse C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_pem_parse_c: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_PEM_WRITE_C`.
    /// Controls whether mbedtls PEM write C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_pem_write_c: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_PKCS7_C`.
    /// Controls whether mbedtls pkcs7 C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_pkcs7_c: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_PK_PARSE_EC_COMPRESSED`.
    /// Controls whether mbedtls PK parse EC compressed is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_pk_parse_ec_compressed: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_PK_PARSE_EC_EXTENDED`.
    /// Controls whether mbedtls PK parse EC extended is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_pk_parse_ec_extended: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_PLATFORM_TIME_ALT`.
    /// Controls whether mbedtls platform TIME ALT is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_platform_time_alt: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_POLY1305_C`.
    /// Controls whether mbedtls poly1305 C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_poly1305_c: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_PSK_MODES`.
    /// Controls whether mbedtls PSK modes is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_psk_modes: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_RIPEMD160_C`.
    /// Controls whether mbedtls ripemd160 C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_ripemd160_c: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_ROM_MD5`.
    /// Controls whether mbedtls ROM MD5 is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_rom_md5: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_SERVER_SSL_SESSION_TICKETS`.
    /// Controls whether mbedtls server SSL session tickets is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_server_ssl_session_tickets: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_SHA3_C`.
    /// Controls whether mbedtls SHA3 C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_sha3_c: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_SHA512_C`.
    /// Controls whether mbedtls sha512 C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_sha512_c: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_SSL_ALPN`.
    /// Controls whether mbedtls SSL ALPN is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ssl_alpn: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_SSL_CONTEXT_SERIALIZATION`.
    /// Controls whether mbedtls SSL context serialization is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_ssl_context_serialization: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_SSL_IN_CONTENT_LEN`.
    /// Sets the numeric value for mbedtls SSL IN content LEN in the `mbedtls` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `16384`.
    mbedtls_ssl_in_content_len: i64 = 16384,
    /// Kconfig key: `CONFIG_MBEDTLS_SSL_KEEP_PEER_CERTIFICATE`.
    /// Controls whether mbedtls SSL KEEP PEER certificate is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ssl_keep_peer_certificate: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_SSL_OUT_CONTENT_LEN`.
    /// Sets the numeric value for mbedtls SSL OUT content LEN in the `mbedtls` module; ESP-IDF consumes this as a size/limit/threshold parameter depending on the component.
    /// Default: `4096`.
    mbedtls_ssl_out_content_len: i64 = 4096,
    /// Kconfig key: `CONFIG_MBEDTLS_SSL_PROTO_DTLS`.
    /// Controls whether mbedtls SSL proto DTLS is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_ssl_proto_dtls: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_SSL_PROTO_GMTSSL1_1`.
    /// Controls whether mbedtls SSL proto gmtssl1 1 is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_ssl_proto_gmtssl1_1: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_SSL_PROTO_TLS1_2`.
    /// Controls whether mbedtls SSL proto TLS1 2 is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ssl_proto_tls1_2: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_SSL_PROTO_TLS1_3`.
    /// Controls whether mbedtls SSL proto TLS1 3 is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_ssl_proto_tls1_3: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_SSL_RENEGOTIATION`.
    /// Controls whether mbedtls SSL renegotiation is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_ssl_renegotiation: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_SSL_VARIABLE_BUFFER_LENGTH`.
    /// Controls whether mbedtls SSL variable buffer length is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_ssl_variable_buffer_length: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_THREADING_C`.
    /// Controls whether mbedtls threading C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_threading_c: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_TLS_CLIENT`.
    /// Controls whether mbedtls TLS client is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_tls_client: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_TLS_CLIENT_ONLY`.
    /// Controls whether mbedtls TLS client ONLY is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_tls_client_only: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_TLS_DISABLED`.
    /// Controls whether mbedtls TLS disabled is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_tls_disabled: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_TLS_ENABLED`.
    /// Controls whether mbedtls TLS enabled is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_tls_enabled: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_TLS_SERVER`.
    /// Controls whether mbedtls TLS server is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_tls_server: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_TLS_SERVER_AND_CLIENT`.
    /// Controls whether mbedtls TLS server AND client is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_tls_server_and_client: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_TLS_SERVER_ONLY`.
    /// Controls whether mbedtls TLS server ONLY is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_tls_server_only: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_X509_CRL_PARSE_C`.
    /// Controls whether mbedtls X509 CRL parse C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_x509_crl_parse_c: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_X509_CSR_PARSE_C`.
    /// Controls whether mbedtls X509 CSR parse C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `true`.
    mbedtls_x509_csr_parse_c: bool = true,
    /// Kconfig key: `CONFIG_MBEDTLS_X509_TRUSTED_CERT_CALLBACK`.
    /// Controls whether mbedtls X509 trusted CERT callback is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_x509_trusted_cert_callback: bool = false,
    /// Kconfig key: `CONFIG_MBEDTLS_XTEA_C`.
    /// Controls whether mbedtls XTEA C is enabled for the `mbedtls` module; this affects conditional compilation and runtime behavior in ESP-IDF.
    /// Default: `false`.
    mbedtls_xtea_c: bool = false,

    pub fn appendModuleDoc(
        allocator: std.mem.Allocator,
        docs: *std.array_list.Managed(sdkconfig.ModuleDoc),
        cfg: Config,
    ) std.mem.Allocator.Error!void {
        const entries = try allocator.alloc(sdkconfig.Entry, 102);
        entries[0] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_AES_C", cfg.mbedtls_aes_c);
        entries[1] = sdkconfig.Entry.int("CONFIG_MBEDTLS_AES_INTERRUPT_LEVEL", cfg.mbedtls_aes_interrupt_level);
        entries[2] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_AES_USE_INTERRUPT", cfg.mbedtls_aes_use_interrupt);
        entries[3] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ASYMMETRIC_CONTENT_LEN", cfg.mbedtls_asymmetric_content_len);
        entries[4] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ATCA_HW_ECDSA_SIGN", cfg.mbedtls_atca_hw_ecdsa_sign);
        entries[5] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ATCA_HW_ECDSA_VERIFY", cfg.mbedtls_atca_hw_ecdsa_verify);
        entries[6] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_BLOWFISH_C", cfg.mbedtls_blowfish_c);
        entries[7] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_CAMELLIA_C", cfg.mbedtls_camellia_c);
        entries[8] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_CCM_C", cfg.mbedtls_ccm_c);
        entries[9] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_CERTIFICATE_BUNDLE", cfg.mbedtls_certificate_bundle);
        entries[10] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_CERTIFICATE_BUNDLE_DEFAULT_CMN", cfg.mbedtls_certificate_bundle_default_cmn);
        entries[11] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_CERTIFICATE_BUNDLE_DEFAULT_FULL", cfg.mbedtls_certificate_bundle_default_full);
        entries[12] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_CERTIFICATE_BUNDLE_DEFAULT_NONE", cfg.mbedtls_certificate_bundle_default_none);
        entries[13] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_CERTIFICATE_BUNDLE_DEPRECATED_LIST", cfg.mbedtls_certificate_bundle_deprecated_list);
        entries[14] = sdkconfig.Entry.int("CONFIG_MBEDTLS_CERTIFICATE_BUNDLE_MAX_CERTS", cfg.mbedtls_certificate_bundle_max_certs);
        entries[15] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_CHACHA20_C", cfg.mbedtls_chacha20_c);
        entries[16] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_CLIENT_SSL_SESSION_TICKETS", cfg.mbedtls_client_ssl_session_tickets);
        entries[17] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_CMAC_C", cfg.mbedtls_cmac_c);
        entries[18] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_CUSTOM_CERTIFICATE_BUNDLE", cfg.mbedtls_custom_certificate_bundle);
        entries[19] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_CUSTOM_MEM_ALLOC", cfg.mbedtls_custom_mem_alloc);
        entries[20] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_DEBUG", cfg.mbedtls_debug);
        entries[21] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_DEFAULT_MEM_ALLOC", cfg.mbedtls_default_mem_alloc);
        entries[22] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_DES_C", cfg.mbedtls_des_c);
        entries[23] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_DHM_C", cfg.mbedtls_dhm_c);
        entries[24] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_DYNAMIC_BUFFER", cfg.mbedtls_dynamic_buffer);
        entries[25] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECDH_C", cfg.mbedtls_ecdh_c);
        entries[26] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECDSA_C", cfg.mbedtls_ecdsa_c);
        entries[27] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECDSA_DETERMINISTIC", cfg.mbedtls_ecdsa_deterministic);
        entries[28] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECJPAKE_C", cfg.mbedtls_ecjpake_c);
        entries[29] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_C", cfg.mbedtls_ecp_c);
        entries[30] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_DP_BP256R1_ENABLED", cfg.mbedtls_ecp_dp_bp256r1_enabled);
        entries[31] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_DP_BP384R1_ENABLED", cfg.mbedtls_ecp_dp_bp384r1_enabled);
        entries[32] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_DP_BP512R1_ENABLED", cfg.mbedtls_ecp_dp_bp512r1_enabled);
        entries[33] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_DP_CURVE25519_ENABLED", cfg.mbedtls_ecp_dp_curve25519_enabled);
        entries[34] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_DP_SECP192K1_ENABLED", cfg.mbedtls_ecp_dp_secp192k1_enabled);
        entries[35] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_DP_SECP192R1_ENABLED", cfg.mbedtls_ecp_dp_secp192r1_enabled);
        entries[36] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_DP_SECP224K1_ENABLED", cfg.mbedtls_ecp_dp_secp224k1_enabled);
        entries[37] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_DP_SECP224R1_ENABLED", cfg.mbedtls_ecp_dp_secp224r1_enabled);
        entries[38] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_DP_SECP256K1_ENABLED", cfg.mbedtls_ecp_dp_secp256k1_enabled);
        entries[39] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_DP_SECP256R1_ENABLED", cfg.mbedtls_ecp_dp_secp256r1_enabled);
        entries[40] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_DP_SECP384R1_ENABLED", cfg.mbedtls_ecp_dp_secp384r1_enabled);
        entries[41] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_DP_SECP521R1_ENABLED", cfg.mbedtls_ecp_dp_secp521r1_enabled);
        entries[42] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_FIXED_POINT_OPTIM", cfg.mbedtls_ecp_fixed_point_optim);
        entries[43] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_NIST_OPTIM", cfg.mbedtls_ecp_nist_optim);
        entries[44] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ECP_RESTARTABLE", cfg.mbedtls_ecp_restartable);
        entries[45] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ERROR_STRINGS", cfg.mbedtls_error_strings);
        entries[46] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_FS_IO", cfg.mbedtls_fs_io);
        entries[47] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_GCM_C", cfg.mbedtls_gcm_c);
        entries[48] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_GCM_SUPPORT_NON_AES_CIPHER", cfg.mbedtls_gcm_support_non_aes_cipher);
        entries[49] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_HARDWARE_AES", cfg.mbedtls_hardware_aes);
        entries[50] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_HARDWARE_MPI", cfg.mbedtls_hardware_mpi);
        entries[51] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_HARDWARE_SHA", cfg.mbedtls_hardware_sha);
        entries[52] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_HAVE_TIME", cfg.mbedtls_have_time);
        entries[53] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_HAVE_TIME_DATE", cfg.mbedtls_have_time_date);
        entries[54] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_HKDF_C", cfg.mbedtls_hkdf_c);
        entries[55] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_INTERNAL_MEM_ALLOC", cfg.mbedtls_internal_mem_alloc);
        entries[56] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_KEY_EXCHANGE_ECDHE_ECDSA", cfg.mbedtls_key_exchange_ecdhe_ecdsa);
        entries[57] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_KEY_EXCHANGE_ECDHE_RSA", cfg.mbedtls_key_exchange_ecdhe_rsa);
        entries[58] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_KEY_EXCHANGE_ECDH_ECDSA", cfg.mbedtls_key_exchange_ecdh_ecdsa);
        entries[59] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_KEY_EXCHANGE_ECDH_RSA", cfg.mbedtls_key_exchange_ecdh_rsa);
        entries[60] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_KEY_EXCHANGE_ELLIPTIC_CURVE", cfg.mbedtls_key_exchange_elliptic_curve);
        entries[61] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_KEY_EXCHANGE_RSA", cfg.mbedtls_key_exchange_rsa);
        entries[62] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_LARGE_KEY_SOFTWARE_MPI", cfg.mbedtls_large_key_software_mpi);
        entries[63] = sdkconfig.Entry.int("CONFIG_MBEDTLS_MPI_INTERRUPT_LEVEL", cfg.mbedtls_mpi_interrupt_level);
        entries[64] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_MPI_USE_INTERRUPT", cfg.mbedtls_mpi_use_interrupt);
        entries[65] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_NIST_KW_C", cfg.mbedtls_nist_kw_c);
        entries[66] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_PEM_PARSE_C", cfg.mbedtls_pem_parse_c);
        entries[67] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_PEM_WRITE_C", cfg.mbedtls_pem_write_c);
        entries[68] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_PKCS7_C", cfg.mbedtls_pkcs7_c);
        entries[69] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_PK_PARSE_EC_COMPRESSED", cfg.mbedtls_pk_parse_ec_compressed);
        entries[70] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_PK_PARSE_EC_EXTENDED", cfg.mbedtls_pk_parse_ec_extended);
        entries[71] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_PLATFORM_TIME_ALT", cfg.mbedtls_platform_time_alt);
        entries[72] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_POLY1305_C", cfg.mbedtls_poly1305_c);
        entries[73] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_PSK_MODES", cfg.mbedtls_psk_modes);
        entries[74] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_RIPEMD160_C", cfg.mbedtls_ripemd160_c);
        entries[75] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_ROM_MD5", cfg.mbedtls_rom_md5);
        entries[76] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_SERVER_SSL_SESSION_TICKETS", cfg.mbedtls_server_ssl_session_tickets);
        entries[77] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_SHA3_C", cfg.mbedtls_sha3_c);
        entries[78] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_SHA512_C", cfg.mbedtls_sha512_c);
        entries[79] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_SSL_ALPN", cfg.mbedtls_ssl_alpn);
        entries[80] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_SSL_CONTEXT_SERIALIZATION", cfg.mbedtls_ssl_context_serialization);
        entries[81] = sdkconfig.Entry.int("CONFIG_MBEDTLS_SSL_IN_CONTENT_LEN", cfg.mbedtls_ssl_in_content_len);
        entries[82] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_SSL_KEEP_PEER_CERTIFICATE", cfg.mbedtls_ssl_keep_peer_certificate);
        entries[83] = sdkconfig.Entry.int("CONFIG_MBEDTLS_SSL_OUT_CONTENT_LEN", cfg.mbedtls_ssl_out_content_len);
        entries[84] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_SSL_PROTO_DTLS", cfg.mbedtls_ssl_proto_dtls);
        entries[85] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_SSL_PROTO_GMTSSL1_1", cfg.mbedtls_ssl_proto_gmtssl1_1);
        entries[86] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_SSL_PROTO_TLS1_2", cfg.mbedtls_ssl_proto_tls1_2);
        entries[87] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_SSL_PROTO_TLS1_3", cfg.mbedtls_ssl_proto_tls1_3);
        entries[88] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_SSL_RENEGOTIATION", cfg.mbedtls_ssl_renegotiation);
        entries[89] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_SSL_VARIABLE_BUFFER_LENGTH", cfg.mbedtls_ssl_variable_buffer_length);
        entries[90] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_THREADING_C", cfg.mbedtls_threading_c);
        entries[91] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_TLS_CLIENT", cfg.mbedtls_tls_client);
        entries[92] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_TLS_CLIENT_ONLY", cfg.mbedtls_tls_client_only);
        entries[93] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_TLS_DISABLED", cfg.mbedtls_tls_disabled);
        entries[94] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_TLS_ENABLED", cfg.mbedtls_tls_enabled);
        entries[95] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_TLS_SERVER", cfg.mbedtls_tls_server);
        entries[96] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_TLS_SERVER_AND_CLIENT", cfg.mbedtls_tls_server_and_client);
        entries[97] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_TLS_SERVER_ONLY", cfg.mbedtls_tls_server_only);
        entries[98] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_X509_CRL_PARSE_C", cfg.mbedtls_x509_crl_parse_c);
        entries[99] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_X509_CSR_PARSE_C", cfg.mbedtls_x509_csr_parse_c);
        entries[100] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_X509_TRUSTED_CERT_CALLBACK", cfg.mbedtls_x509_trusted_cert_callback);
        entries[101] = sdkconfig.Entry.flag("CONFIG_MBEDTLS_XTEA_C", cfg.mbedtls_xtea_c);

        try docs.append(.{
            .name = module_name,
            .entries = entries,
        });
    }
};
