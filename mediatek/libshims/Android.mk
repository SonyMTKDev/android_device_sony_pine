LOCAL_PATH := $(call my-dir)

# GPS Shim
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	gps/icu_shim.cpp

LOCAL_SHARED_LIBRARIES := \
	liblog \
	libicuuc \
	libssl \
	libcrypto

LOCAL_MODULE := libshim_gps
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# Camera Shim
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	camera/sony_camera.cpp

LOCAL_MODULE := libshim_camera
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# Program Binary Service Shim
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    program_binary/program_binary_shim.cpp

LOCAL_SHARED_LIBRARIES := \
    libcutils

LOCAL_MODULE := libshim_program_binary

LOCAL_CFLAGS := -O3 -Wno-unused-variable -Wno-unused-parameter
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# Mal Shim (vt)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    vt/vt_shim.cpp

LOCAL_SHARED_LIBRARIES := \
    libcutils

LOCAL_MODULE := libshim_vt

LOCAL_CFLAGS := -O3 -Wno-unused-variable -Wno-unused-parameter
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# XLOG Shim
include $(CLEAR_VARS)

LOCAL_SRC_FILES := misc/xlog_shim.cpp

LOCAL_SHARED_LIBRARIES := liblog

LOCAL_MODULE := libshim_xlog

LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)

# MAL Shim (vt)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	misc/vtservice_shim.cpp

LOCAL_MODULE := libshim_mal
LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_SHARED_LIBRARY)
