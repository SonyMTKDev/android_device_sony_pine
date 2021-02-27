$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# Device is a phone
PRODUCT_CHARACTERISTICS := phone

# Date
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# Local Path
DEVICE_PATH:= device/sony/pine

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal large xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio_policy.stub \
    audio.r_submix.default \
    audio.usb.default \
    libalsautils \
    libaudio-resampler \
    libaudioroute \
    libaudiospdif \
    libeffects \
    libtinyalsa \
    libtinycompress \
    libtinymix \
    libtinyxml \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl

# DRM
PRODUCT_PACKAGES += \
    libdrm \
    libmockdrmcryptoplugin \
    libdrmclearkeyplugin \

# Lights
PRODUCT_PACKAGES += \
    lights.mt6737t \
    android.hardware.light@2.0-impl-mediatek

# Power
PRODUCT_PACKAGES += \
    power.mt6737t \
    android.hardware.power@1.0-impl

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

# Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl

# Local Time
PRODUCT_PACKAGES += \
    local_time.default

# GPS
PRODUCT_PACKAGES += \
    gps.mt6737t \
    libcurl

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/gps/agps_profiles_conf2.xml:system/vendor/etc/agps_profiles_conf2.xml

# SU
PRODUCT_PACKAGES += \
    su 

# Camera
PRODUCT_PACKAGES += \
    Snap \
    camera.device@1.0-impl \
    camera.device@3.2-impl \
    android.hardware.camera.provider@2.4-impl \
    android.hardware.camera.provider@2.4-service

# Network
PRODUCT_PACKAGES += \
    netd

# Sim Management Toolkit
PRODUCT_PACKAGES += \
    Stk

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    ro.telephony.ril_class=MT6735 \
    ro.telephony.ril.config=fakeiccid

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/telephony/spn-conf.xml:system/etc/spn-conf.xml

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

PRODUCT_PROPERTY_OVERRIDES += \
    net.tethering.noprovisioning=true

# Wi-Fi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    lib_driver_cmd_mt66xx \
    android.hardware.wifi@1.0-service \
    wificond

# Wi-Fi Configs
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_COPY_FIES += \
    $(DEVICE_PATH)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(DEVICE_PATH)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(DEVICE_PATH)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/rootdir,root)

# Target Provides its own INIT script
TARGET_PROVIDES_INIT_RC := true

# Custom Init Scripts for Pine
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/etc/init/audioserver.rc:system/etc/init/audioserver.rc \
    $(DEVICE_PATH)/configs/etc/init/mediacodec.rc:system/etc/init/mediacodec.rc \
    $(DEVICE_PATH)/configs/etc/init/cameraserver.rc:system/etc/init/cameraserver.rc \
    $(DEVICE_PATH)/configs/etc/init/rild.rc:system/etc/init/rild.rc \
    $(DEVICE_PATH)/configs/etc/init/atrace.rc:system/etc/init/atrace.rc \
    $(DEVICE_PATH)/configs/etc/init/bootanim.rc:system/etc/init/bootanim.rc \
    $(DEVICE_PATH)/configs/etc/init/bootstat.rc:system/etc/init/bootstat.rc \
    $(DEVICE_PATH)/configs/etc/init/drmserver.rc:system/etc/init/drmserver.rc \
    $(DEVICE_PATH)/configs/etc/init/mediacodec.rc:system/etc/init/mediacodec.rc \
    $(DEVICE_PATH)/configs/etc/init/mediadrmserver.rc:system/etc/init/mediadrmserver.rc \
    $(DEVICE_PATH)/configs/etc/init/mediaserver.rc:system/etc/init/mediaserver.rc \
    $(DEVICE_PATH)/configs/etc/init/surfaceflinger.rc:system/etc/init/surfaceflinger.rc

# Shims
PRODUCT_PACKAGES += \
    libshim_gps \
    libshim_camera \
    libshim_vt \
    libshim_mal \
    libshim_program_binary \
    libshim_xlog \
    libshim_asc \
    libshim_gui \
    libshim_audio

# Sensors
PRODUCT_PACKAGES += \
    libem_sensor_jni

# Media Extractors
BOARD_SECCOMP_POLICY := \
    $(DEVICE_PATH)/seccomp-policy

# USB
PRODUCT_PACKAGES += \
    com.android.future.usb.accessory \
    librs_jni \
    android.hardware.usb@1.0-service

# Override Default Properties
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1 \
    ro.oem_unlock_supported=1 \
    persist.service.acm.enable=0 \
    persist.sys.dun.override=0 \
    sys.usb.ffs.aio_compat=1 \
    ro.mount.fs=EXT4 \
    ro.mtk_key_manager_kb_path=1 

ADDITIONAL_DEFAULT_PROPERTIES += \
    ro.adb.secure=0 \
    ro.debuggable=1 \
    ro.secure=0

# Bluetooth Config
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/configs/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service

# Display
PRODUCT_PACKAGES += \
    libion
 
# Graphics
PRODUCT_PACKAGES += \
    libGLES_android \
    libgui_ext \
    libui_ext \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service

# Charger Mode
PRODUCT_PACKAGES += \
    charger_res_images

# Busybox
PRODUCT_PACKAGES += \
    busybox

# Doze
PRODUCT_PACKAGES += \
    SonyDoze

# FMRadio
MTK_FM_SUPPORT := true

PRODUCT_PACKAGES += \
    libfmjni \
    FMRadio

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    fibmap.f2fs \
    fsck.f2fs \
    mkfs.f2fs \
    make_ext4fs \
    resize2fs \
    setup_fs \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat \
    fsck.ntfs \
    mkfs.ntfs \
    mount.ntfs

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
    frameworks/native/data/etc/android.hardware.camera.manual_sensor.xml:system/etc/permissions/android.hardware.camera.manual_sensor.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.software.device_admin.xml:system/etc/permissions/android.software.device_admin.xml \
    frameworks/native/data/etc/android.software.managed_users.xml:system/etc/permissions/android.software.managed_users.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml 

# Audio Policy
PRODUCT_COPY_FILES += \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:system/etc/a2dp_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/etc/audio_policy_volumes.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/etc/default_volume_tables.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:system/etc/r_submix_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml \
    $(DEVICE_PATH)/configs/audio/AudioParamOptions.xml:system/etc/audio_param/AudioParamOptions.xml \
    $(DEVICE_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf

# Media Codecs
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(DEVICE_PATH)/configs/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml \
    $(DEVICE_PATH)/configs/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
    $(DEVICE_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
    $(DEVICE_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml 

# Misc
PRODUCT_PACKAGES += \
    libnl_2    

# NFC Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# NFC Packages
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    Tag

# NFC Configurations
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/nfc/nfcse.cfg:system/etc/nfcse.cfg \
    $(DEVICE_PATH)/configs/nfc/nfc.cfg:system/etc/nfc.cfg

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
