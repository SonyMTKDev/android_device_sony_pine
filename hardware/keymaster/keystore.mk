  
#
# Copyright (C) 2021 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LIBKEYSTOREPINE_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/keystore.pine.so
$(LIBKEYSTOREPINE_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/hw/keystore.pine.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(TARGET_OUT_VENDOR)/lib/hw/libMcTeeKeymaster.so $@

LIBKEYSTOREPINE64_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/hw/keystore.pine.so
$(LIBKEYSTOREPINE64_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib64/hw/keystore.pine.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(TARGET_OUT_VENDOR)/lib64/hw/libMcTeeKeymaster.so $@

LIBKEYSTOREMT6737T_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/keystore.mt6737t.so
$(LIBKEYSTOREMT6737T_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/hw/keystore.mt6737t.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(TARGET_OUT_VENDOR)/lib/hw/libMcTeeKeymaster.so $@

LIBKEYSTOREMT6737T64_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/hw/keystore.mt6737t.so
$(LIBKEYSTOREMT6737T64_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib64/hw/keystore.mt6737t.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(TARGET_OUT_VENDOR)/lib64/hw/libMcTeeKeymaster.so $@

ALL_DEFAULT_INSTALLED_MODULES += \
	$(LIBKEYSTOREPINE_SYMLINK) \
	$(LIBKEYSTOREPINE64_SYMLINK) \
	$(LIBKEYSTOREMT6737T_SYMLINK) \
	$(LIBKEYSTOREMT6737T64_SYMLINK)