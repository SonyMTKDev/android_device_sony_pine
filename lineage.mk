# Inherit some common Lineage stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration for the Pine
$(call inherit-product, device/sony/pine/lineage_pine.mk)

# Product defines
PRODUCT_NAME := lineage_pine
PRODUCT_RELEASE_NAME := pine
