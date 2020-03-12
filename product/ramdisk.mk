#If you need complie twrp,please # Ramdisk and enable this
#PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/rootdir/factory_init.project.rc:root/factory_init.project.rc \
    $(DEVICE_PATH)/rootdir/factory_init.rc:root/factory_init.rc \
    $(DEVICE_PATH)/rootdir/fstab.mt6735:root/fstab.mt6735 \
    $(DEVICE_PATH)/rootdir/fstab.fota:root/fstab.fota \
    $(DEVICE_PATH)/rootdir/meta_init.modem.rc:root/meta_init.modem.rc \
    $(DEVICE_PATH)/rootdir/meta_init.project.rc:root/meta_init.project.rc \
    $(DEVICE_PATH)/rootdir/meta_init.rc:root/meta_init.rc \
    $(DEVICE_PATH)/rootdir/ueventd.mt6735.rc:root/ueventd.mt6735.rc \
    $(DEVICE_PATH)/rootdir/init.mt6735.usb.rc:root/init.mt6735.usb.rc \
    $(DEVICE_PATH)/recovery/twrp.fstab:recovery/root/etc/twrp.fstab
#    $(DEVICE_PATH)/rootdir/init.recovery.mt6735.rc:root/init.recovery.mt6735.rc

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

#Rc parts add for pine
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/etc/init/atrace.rc:system/etc/init/atrace.rc \
    $(DEVICE_PATH)/etc/init/bootanim.rc:system/etc/init/bootanim.rc \
    $(DEVICE_PATH)/etc/init/bootstat.rc:system/etc/init/bootstat.rc \
    $(DEVICE_PATH)/etc/init/drmserver.rc:system/etc/init/drmserver.rc \
    $(DEVICE_PATH)/etc/init/mediacodec.rc:system/etc/init/mediacodec.rc \
    $(DEVICE_PATH)/etc/init/mediadrmserver.rc:system/etc/init/mediadrmserver.rc \
    $(DEVICE_PATH)/etc/init/mediaserver.rc:system/etc/init/mediaserver.rc \
    $(DEVICE_PATH)/etc/init/surfaceflinger.rc:system/etc/init/surfaceflinger.rc \

ifeq ($(TARGET_PREBUILT_KERNEL),)
    LOCAL_KERNEL := device/sony/pine/prebuilts/kernel
else
    LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

