#!/bin/bash
RED='\033[0;31m'
GREEN='\033[0;32m'
BROWN='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
cd ../../../..
echo -e "${RED}We are gonna patch bionic${NC}"
cd bionic
patch -p1 < ../device/sony/pine/patches/bionic/if.patch
patch -p1 < ../device/sony/pine/patches/bionic/libc.patch
cd ..
echo -e "${GREEN}We are gonna patch frameworks/av${NC}"
cd frameworks/av
patch -p1 < ../../device/sony/pine/patches/frameworks/av/av.patch
patch -p1 < ../../device/sony/pine/patches/frameworks/av/0006-fix-access-wvm-to-ReadOptions.patch
patch -p1 < ../../device/sony/pine/patches/frameworks/av/0008-Partial-Revert-Camera1-API-Support-SW-encoders-for-n.patch
patch -p1 < ../../device/sony/pine/patches/frameworks/av/frameworks-av_016-fix-cannot-locate-symbol.patch
patch -p1 < ../../device/sony/pine/patches/frameworks/av/0009-add-mtk-color-format-support.patch
cd ../..
echo -e "${BROWN}We are gonna patch frameworks/base${NC}"
cd frameworks/base
patch -p1 < ../../device/sony/pine/patches/frameworks/base/base.patch
patch -p1 < ../../device/sony/pine/patches/frameworks/base/0001-fix-bootanimation-for-pine.patch
cd ../..
echo -e "${BLUE}We are gonna patch frameworks/native${NC}"
cd frameworks/native
patch -p1 < ../../device/sony/pine/patches/frameworks/native/native.patch
cd ../..
echo -e "${PURPLE}We are gonna patch frameworks/opt/telephony${NC}"
cd frameworks/opt/telephony
patch -p1 < ../../../device/sony/pine/patches/frameworks/opt/telephony/telephony.patch
cd ../../..
echo -e "${CYAN}We are gonna patch system/netd${NC}"
cd system/netd
patch -p1 < ../../device/sony/pine/patches/system/netd/0004-system_netd.patch
cd ../..
echo -e "${YELLOW}We are gonna patch system/core${NC}"
cd system/core
patch -p1 < ../../device/sony/pine/patches/system/core/0001-for-pine.patch
cd ../..
