# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.r_submix.default \
    audio_policy.default \
    libaudiopolicymanagerdefault \
    audio.usb.default \
    libaudio-resampler \
    libtinyalsa \
    libtinycompress \
    libtinymix \
    libtinyxml 

# Configurations
PRODUCT_COPY_FILES += \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/a2dp_audio_policy_configuration.xml:system/etc/etc/a2dp_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/audio_policy_volumes.xml:system/etc/etc/audio_policy_volumes.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/default_volume_tables.xml:system/etc/etc/default_volume_tables.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/r_submix_audio_policy_configuration.xml:system/etc/etc/r_submix_audio_policy_configuration.xml \
    $(TOPDIR)frameworks/av/services/audiopolicy/config/usb_audio_policy_configuration.xml:system/etc/etc/usb_audio_policy_configuration.xml \
    $(DEVICE_PATH)/configs/AudioParamOptions.xml:system/etc/audio_param/AudioParamOptions.xml \
    $(DEVICE_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(DEVICE_PATH)/configs/audio_device.xml:system/etc/audio_device.xml
