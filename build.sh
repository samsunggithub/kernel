#!/bin/bash

export PLATFORM_VERSION=11
export ANDROID_MAJOR_VERSION=r
export ARCH=arm64
export BOARD=SRPSC14B007KU
make ARCH=arm64 exynos9820-d2s_defconfig
make ARCH=arm64 -j64 2>&1 | tee build.log

toolchain/mkdtimg cfg_create build/dtb_9825.img toolchain/configs/exynos9825.cfg -d arch/arm64/boot/dts/exynos

toolchain/mkdtimg cfg_create build/dtbo_d2s.img toolchain/configs/d2s.cfg -d arch/arm64/boot/dts/samsung

rm -f ramdisk/split_img/boot.img-kernel
cp arch/arm64/boot/Image ramdisk/split_img/boot.img-kernel
echo $BOARD > ramdisk/split_img/boot.img-board
    # This is kinda ugly hack, we could as well touch .placeholder to all of those
mkdir -p ramdisk/ramdisk/debug_ramdisk
mkdir -p ramdisk/ramdisk/dev
mkdir -p ramdisk/ramdisk/mnt
mkdir -p ramdisk/ramdisk/proc
mkdir -p ramdisk/ramdisk/sys
rm -rf ramdisk/ramdisk/fstab.exynos9820
rm -rf ramdisk/ramdisk/fstab.exynos9825
cp ramdisk/fstab.exynos9825 ramdisk/ramdisk/fstab.exynos9825
cd /home/phihung/c/ramdisk
./repackimg.sh --nosudo

cd /home/phihung/c/build
rm -rf d2s-boot-ramdisk.img
mv /home/phihung/c/ramdisk/image-new.img /home/phihung/c/build/d2s-boot-ramdisk.img
rm -rf /home/phihung/c/build/zip
mkdir -p /home/phihung/c/build/zip
cp /home/phihung/c/build/d2s-boot-ramdisk.img /home/phihung/c/build/zip/boot.img
cp /home/phihung/c/build/dtb_9825.img /home/phihung/c/build/zip/dtb.img
cp /home/phihung/c/build/dtbo_d2s.img /home/phihung/c/build/zip/dtbo.img
mkdir -p /home/phihung/c/build/zip/META-INF/com/google/android/
cp /home/phihung/c/toolchain/updater-script /home/phihung/c/build/zip/META-INF/com/google/android/
cp /home/phihung/c/toolchain/update-binary /home/phihung/c/build/zip/META-INF/com/google/android/
cd /home/phihung/c/build/zip
zip -r ../kernel_d2s.zip .
rm -rf /home/phihung/c/build/zip
cd /home/phihung/c/build
