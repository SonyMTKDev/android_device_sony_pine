# WiFi
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml 

#wifi
PRODUCT_PACKAGES += \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    lib_driver_cmd_mt66xx \
    wpa_supplicant \
    wpa_supplicant.conf 

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/hostapd/hostapd_default.conf:system/etc/wifi/hostapd_default.conf \
    $(DEVICE_PATH)/configs/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf 

