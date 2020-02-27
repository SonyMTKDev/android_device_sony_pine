# Default.prop
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1 \
    ro.oem_unlock_supported=1 \
    persist.service.acm.enable=0 \
    persist.sys.dun.override=0 \
    sys.usb.ffs.aio_compat=1 \
    ro.mount.fs=EXT4 \
    ro.mtk_key_manager_kb_path=1 
    
ifneq ($(TARGET_BUILD_VARIANT), user)
# ADB Debugging
ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    ro.secure=0
endif

