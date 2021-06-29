  
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

LIBGATEKEEPERPINE_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.pine.so
$(LIBGATEKEEPERPINE_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/hw/gatekeeper.pine.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(TARGET_OUT_VENDOR)/lib/hw/libMcGatekeeper.so $@

LIBGATEKEEPERPINE64_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.pine.so
$(LIBGATEKEEPERPINE64_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib64/hw/gatekeeper.pine.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(TARGET_OUT_VENDOR)/lib64/hw/libMcGatekeeper.so $@

LIBGATEKEEPERMT6737T_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.mt6737t.so
$(LIBGATEKEEPERMT6737T_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib/hw/gatekeeper.mt6737t.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(TARGET_OUT_VENDOR)/lib/hw/libMcGatekeeper.so $@

LIBGATEKEEPERMT6737T64_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.mt6737t.so
$(LIBGATEKEEPERMT6737T64_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating lib64/hw/gatekeeper.mt6737t.so symlink: $@"
	@mkdir -p $(dir $@)
	$(hide) ln -sf $(TARGET_OUT_VENDOR)/lib64/hw/libMcGatekeeper.so $@

ALL_DEFAULT_INSTALLED_MODULES += \
	$(LIBGATEKEEPERPINE_SYMLINK) \
	$(LIBGATEKEEPERPINE64_SYMLINK) \
	$(LIBGATEKEEPERMT6737T_SYMLINK) \
	$(LIBGATEKEEPERMT6737T64_SYMLINK)