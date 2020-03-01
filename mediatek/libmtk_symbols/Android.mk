#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    mtk_audio.cpp \
    mtk_audioCompat.c \
    mtk_fence.cpp \
    mtk_gui.cpp \
    mtk_ui.cpp \
    mtk_omx.cpp \
    icu55.c \
    icu53.c \
    net_utils.c \
    program_binary_builder.cpp \
    vtservice.cpp \
    ssl.c \
    mtk_gps.cpp \
    mtk_bionic.cpp

# only for 32bit libraries
LOCAL_SRC_FILES_32 := mtk_string.cpp
# only for 64bit libraries
LOCAL_SRC_FILES_64 := mtk_parcel.cpp

LOCAL_SHARED_LIBRARIES := libbinder libutils liblog libgui libui \
                          libicuuc libicui18n libcrypto libmedia libcutils libstagefright_foundation libssl libc libaudiopolicymanagerdefault libdpframework libbase

LOCAL_STATIC_LIBRARIES := \
    libaudiopolicycomponents
LOCAL_C_INCLUDES += frameworks/av/media/mtp/ system/core/include/ frameworks/rs/server/ frameworks/av/include/ hardware/libhardware/include/
LOCAL_MODULE := libmtk_symbols
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
