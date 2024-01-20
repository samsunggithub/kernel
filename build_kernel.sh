#!/bin/bash


export PLATFORM_VERSION=11
export ANDROID_MAJOR_VERSION=r
export ARCH=arm64

make ARCH=arm64 exynos9820-d2s_defconfig
make ARCH=arm64 -j64 2>&1 | tee build.log

    rm -f ramdisk/split_img/boot.img-kernel
    cp arch/arm64/boot/Image ramdisk/split_img/boot.img-kernel
    echo SRPSC14B007KU > ramdisk/split_img/boot.img-board
    # This is kinda ugly hack, we could as well touch .placeholder to all of those
    mkdir -p ramdisk/ramdisk/debug_ramdisk
    mkdir -p ramdisk/ramdisk/dev
    mkdir -p ramdisk/ramdisk/mnt
    mkdir -p ramdisk/ramdisk/proc
    mkdir -p ramdisk/ramdisk/sys

    rm -rf ramdisk/ramdisk/fstab.exynos9820
    rm -rf ramdisk/ramdisk/fstab.exynos9825

    cp ramdisk/fstab.exynos9825 ramdisk/ramdisk/fstab.exynos98250

    cd ramdisk/
    ./repackimg.sh --nosudo
