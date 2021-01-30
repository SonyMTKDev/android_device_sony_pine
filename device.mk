$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

PRODUCT_CHARACTERISTICS := phone

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

DEVICE_PATH:= device/sony/pine

# Overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal large xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# Shim symbols
PRODUCT_PACKAGES += \
    libmtk_symbols

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
    libtinyxml 

# DRM
PRODUCT_PACKAGES += \
    libdrm \
    libmockdrmcryptoplugin \
    libdrmclearkeyplugin \

#vendor_libs
PRODUCT_PACKAGES += \
 lights.mt6737t \
 power.mt6737t \
 local_time.default \
 audio.primary.default \
 vibrator.default \
 power.default \
 gralloc.default \
 librs_jni \
 gps.mt6737t

#su
PRODUCT_PACKAGES += \
	su 
#camera
PRODUCT_PACKAGES += \
    Snap

# network
PRODUCT_PACKAGES += \
    netd

# Radio
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml

# IPv6 tethering
PRODUCT_PACKAGES += \
    ebtables \
    ethertypes

#wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf 
	
#Ramdisk
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,$(DEVICE_PATH)/rootdir,root)

# Media Extractors
BOARD_SECCOMP_POLICY := \
    $(DEVICE_PATH)/seccomp-policy

#USB
PRODUCT_PACKAGES += \
 com.android.future.usb.accessory 

# Default.prop
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1 \
    sys.usb.ffs.aio_compat=1 \
    ro.mount.fs=EXT4 \
    ro.mtk_key_manager_kb_path=1 

# Bluetooth
PRODUCT_PACKAGES += \
	bluetooth.default

#Display
PRODUCT_PACKAGES += \
    libion
 
# Graphic
PRODUCT_PACKAGES += \
    libGLES_android \
    libgralloc_extra \
    libgui_ext \
    libui_ext

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# wifi
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(DEVICE_PATH)/configs/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

# Audio Policy
PRODUCT_COPY_FILES += \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:system/etc/etc/a2dp_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/etc/etc/audio_policy_volumes.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/etc/etc/default_volume_tables.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:system/etc/etc/r_submix_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/etc/usb_audio_policy_configuration.xml \
    $(DEVICE_PATH)/configs/AudioParamOptions.xml:system/etc/audio_param/AudioParamOptions.xml \
    $(DEVICE_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf

# CODECS
PRODUCT_COPY_FILES += \
  $(DEVICE_PATH)/configs/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml \
  $(DEVICE_PATH)/configs/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \
  $(DEVICE_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
  $(DEVICE_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
  frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
  frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
  frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
  frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml 

# call dalvik heap config
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)
