# RIL
PRODUCT_PACKAGES += \
    gsm0710muxd \
    muxreport \
    terservice \
    libprotobuf-cpp-full

PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    ro.telephony.ril_class=MT6735 \
    ro.telephony.ril.config=fakeiccid \
    ro.com.android.mobiledata=false \
    ro.kernel.android.checkjni=0

PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml \
    $(DEVICE_PATH)/configs/ecc_list.xml:system/etc/ecc_list.xml
