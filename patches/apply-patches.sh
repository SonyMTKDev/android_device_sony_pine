#!/bin/bash
cd ../../../..
cd frameworks/av
#git apply -v ../../device/sony/pine/patches/0001-frameworks_av.patch
#patch -p1 < ../../device/sony/pine/patches/0001-frameworks_av.patch
git apply -v ../../device/sony/pine/patches/av.patch
cd ../..
cd frameworks/base
#git apply -v ../../device/sony/pine/patches/0002-frameworks_base.patch
git apply -v ../../device/sony/pine/patches/base.patch
#cd ../..
#cd frameworks/native
#git apply -v ../../device/sony/pine/patches/0003-frameworks_native.patch
cd ../..
cd bionic
git apply -v ../device/sony/pine/patches/0001-bionic.patch
cd ..
cd system/netd
git apply -v ../../device/sony/pine/patches/0004-system_netd.patch
cd ../..
cd system/core
#git apply -v ../../device/sony/pine/patches/0005-system_core.patch
patch -p1 <  ../../device/sony/pine/patches/core.patch
cd ../..
