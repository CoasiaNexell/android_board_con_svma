#!/bin/bash

set -e

TOP=`pwd`

CHIP_SELECT=$1
CHIP_NAME=$2

if [ "${CHIP_SELECT}" != "-s" ]; then
	echo ""
	echo "ERROR in build_CON_SVMA: Cannot found CHIP_SELECT option"
	usage
	exit 0
else
	if [ "${CHIP_NAME}" != "s5p4418" -a "${CHIP_NAME}" != "s5p6818" ]; then
		echo ""
		echo "ERROR in build_CON_SVMA: Invaild Chip_Name value @$2)"
		usage
		exit 0
	fi
fi
source ${TOP}/device/nexell/con_svma/common.sh
source ${TOP}/device/nexell/tools/dir.sh
source ${TOP}/device/nexell/tools/make_build_info.sh
source ${TOP}/device/nexell/tools/revert_patches.sh

parse_args $@
print_args
setup_toolchain
export_work_dir

DEVICE_DIR=${TOP}/device/nexell/${BOARD_NAME}
OUT_DIR=${TOP}/out/target/product/${BOARD_NAME}

rm -f ${DEVICE_DIR}/BoardConfig.mk
cp ${DEVICE_DIR}/BoardConfig_${TARGET_SOC}.mk ${DEVICE_DIR}/BoardConfig.mk

rm -f ${DEVICE_DIR}/bluetooth/bt_vendor.conf
cp ${DEVICE_DIR}/bluetooth/bt_vendor_${TARGET_SOC}.conf ${DEVICE_DIR}/bluetooth/bt_vendor.conf
rm -f ${DEVICE_DIR}/bluetooth/vnd_con_svma.txt
cp ${DEVICE_DIR}/bluetooth/vnd_con_svma_${TARGET_SOC}.txt ${DEVICE_DIR}/bluetooth/vnd_con_svma.txt

rm -f ${DEVICE_DIR}/aosp_con_svma.mk

if [ "${TARGET_SOC}" == "s5p4418" ]; then
	if [ "${QUICKBOOT}" == "true" ]; then
		cp ${DEVICE_DIR}/aosp_con_svma_quickboot_32.mk ${DEVICE_DIR}/aosp_con_svma.mk
	else
		cp ${DEVICE_DIR}/aosp_con_svma_32.mk ${DEVICE_DIR}/aosp_con_svma.mk
	fi
	
	${DEVICE_DIR}/build_${TARGET_SOC}.sh $@
else
	if [ "${QUICKBOOT}" == "true" ]; then
		cp ${DEVICE_DIR}/aosp_con_svma_quickboot_64.mk ${DEVICE_DIR}/aosp_con_svma.mk
	else
		cp ${DEVICE_DIR}/aosp_con_svma_64.mk ${DEVICE_DIR}/aosp_con_svma.mk
	fi

	source ${DEVICE_DIR}/build_${TARGET_SOC}.sh $@

	run_clean_packages
	run_bl1_build
	run_uboot_build
	run_secure_build
	run_kernel_build
	run_android_build
	run_make_uboot_env
	run_make_bootloader
	run_make_android_bootimg
	run_post_process
	run_make_ext4_recovery_image
	run_dist_build
	run_gen_boot_usb
fi

