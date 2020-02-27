#Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/rootdir,root)

#RC
TARGET_PROVIDES_INIT_RC := true

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/etc/init/audioserver.rc:system/etc/init/audioserver.rc \
    $(DEVICE_PATH)/etc/init/mediacodec.rc:system/etc/init/mediacodec.rc \
    $(DEVICE_PATH)/etc/init/cameraserver.rc:system/etc/init/cameraserver.rc \
    $(DEVICE_PATH)/etc/init/rild.rc:system/etc/init/rild.rc 

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/sony/pine/prebuilts/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif
