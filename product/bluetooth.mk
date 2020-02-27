# Bluetooth
PRODUCT_PACKAGES += \
	bluetooth.default
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf 
