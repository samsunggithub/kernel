#!/bin/bash
#
# ThundeRStorms cleaning script v1.0

make clean
make mrproper
make distclean
rm -f build.log
rm -f build/*.img
rm -f build/*.zip
rm -f ramdisk/*.img
rm -f build/*.gz
rm -rf ramdisk/ramdisk/debug_ramdisk
rm -rf ramdisk/ramdisk/split_img/boot.img-kernel
rm -f ramdisk/ramdisk/fstab.exynos9825
rm -rf ramdisk/ramdisk/dev
rm -rf ramdisk/ramdisk/mnt
rm -rf ramdisk/ramdisk/proc
rm -rf ramdisk/ramdisk/sys
rm -f *.config
rm -f arch/arm64/boot/Image
rm -f arch/arm64/boot/Image.gz
rm -f arch/arm64/boot/dts/exynos/*.dtb
rm -f arch/arm64/boot/dts/exynos/*.dtbo
rm -f arch/arm64/boot/dts/samsung/*.dtbo
rm -f arch/arm64/boot/dts/samsung/*.dtbo.reverse.dts
rm -f arch/arm64/boot/dts/exynos/*.dtb.reverse.dts
rm -f arch/arm64/boot/dts/exynos/*.img
rm -f arch/arm64/boot/dts/samsung/*.img
rm -rf toolchain
cp -rf /home/phihung/toolchain /home/phihung/c
