#!/bin/bash
cd ../../../..
cd bionic
patch -p1 < ../device/sony/pine/patches/bionic/if.patch
patch -p1 < ../device/sony/pine/patches/bionic/bionic_libc.patch
cd ..
cd frameworks/av
patch -p1 < ../../device/sony/pine/patches/frameworks/av.patch
cd ../..
cd frameworks/base
patch -p1 < ../../device/sony/pine/patches/frameworks/base.patch
cd ../..
cd frameworks/native
patch -p1 < ../../device/sony/pine/patches/frameworks/native.patch
cd ../..
cd system/netd
patch -p1 < ../../device/sony/pine/patches/system/0004-system_netd.patch
cd ../..
cd system/core
patch -p1 < ../../device/sony/pine/patches/0001-for-pine.patch
cd ../..
