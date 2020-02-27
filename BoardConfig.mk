DEVICE_PATH := device/sony/pine
VENDOR_PATH := vendor/sony/pine

# inherit from the proprietary version
-include $(VENDOR_PATH)/BoardConfigVendor.mk

# Device board elements
include $(DEVICE_PATH)/board/*.mk

# System Prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop


