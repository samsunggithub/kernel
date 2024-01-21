#!/bin/bash

export PLATFORM_VERSION=11
export ANDROID_MAJOR_VERSION=r
export ARCH=arm64
make ARCH=arm64 exynos9820-d2s_defconfig
make CONFIG_DEBUG_SECTION_MISMATCH=y ARCH=arm64 -j64 2>&1 | tee build.log
