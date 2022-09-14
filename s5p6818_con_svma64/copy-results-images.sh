#!/bin/bash
# Copyright 2011 The Android Open Source Project
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

# Use the default values if they weren't explicitly set

set -e

TARGET_SOC=slsiap
RESULT_DIR=results

function usage()
{
	echo "Usage: copy-results-images.sh -s <chip-name>  [-d <result-dir>] "
	echo "ex) ./copy-results-images.sh -s nxp4330 -d results_nxp4330_con_svma "
	echo "ex) ./copy-results-images.sh -s s5p6818 -d results_s5p6818_con_svma "
	exit 1
}

function parse_args()
{
	while getopts "s:d:h" opt
	do
		case "$opt" in
			s ) TARGET_SOC=$OPTARG; ;;
			d ) RESULT_DIR=$OPTARG; ;;
			h ) echo h; usage;;
			? ) echo ?; usage;;
		esac
	done

    export TARGET_SOC RESULT_DIR
}

function print_args()
{
    echo "===================================================="
    echo "generate image"
    echo "===================================================="
    echo "TARGET_SOC ==> ${TARGET_SOC}"
    echo "RESULT_DIR ==> ${RESULT_DIR}"
}

parse_args $@
print_args
if [ ! -d ${RESULT_DIR}  ]; then
	mkdir -p ${RESULT_DIR}
fi
cp -af ${OUT}/partmap.txt ${RESULT_DIR}
cp -af ${OUT}/bl1-emmcboot.bin ${RESULT_DIR}
cp -af ${OUT}/bootloader.img ${RESULT_DIR}
cp -af ${OUT}/boot.img ${RESULT_DIR}
cp -af ${OUT}/dtbo.img ${RESULT_DIR}
cp -af ${OUT}/system.img ${RESULT_DIR}
cp -af ${OUT}/vendor.img ${RESULT_DIR}
cp -af vendor/nexell/tools/misc.img ${RESULT_DIR}
cp -af ${OUT}/product.img ${RESULT_DIR}
cp -af ${OUT}/userdata.img ${RESULT_DIR}
cp -af ${OUT}/bl1-usbboot.bin ${RESULT_DIR}
cp -af ${OUT}/fip-loader-usb.img ${RESULT_DIR}
cp -af vendor/nexell/tools/usb-downloader ${RESULT_DIR}

#copy boot_by_usb
if [ "${TARGET_SOC}" == "nxp4330" ]; then
	cp -af vendor/nexell/tools/boot_by_usb_nxp4330.sh ${RESULT_DIR}/boot_by_usb.sh
else
	cp -af vendor/nexell/tools/boot_by_usb_slsiap.sh ${RESULT_DIR}/boot_by_usb.sh
fi



# Write flash-all.sh
cat > ${RESULT_DIR}/flash-all.sh << EOF
#!/bin/sh
sudo fastboot flash partmap partmap.txt
sudo fastboot flash bl1 bl1-emmcboot.bin
sudo fastboot flash bootloader_a bootloader.img
sudo fastboot flash boot_a boot.img
sudo fastboot flash dtbo_a dtbo.img
sudo fastboot flash system_a system.img
sudo fastboot flash vendor_a vendor.img
sudo fastboot flash misc misc.img
sudo fastboot flash product product.img
sudo fastboot flash userdata userdata.img
sudo fastboot reboot
EOF
chmod a+x ${RESULT_DIR}/flash-all.sh

cat > ${RESULT_DIR}/flash-all.bat << EOF
PATH=%PATH%;"%SYSTEMROOT%\System32"
fastboot flash partmap partmap.txt
fastboot flash bl1 bl1-emmcboot.bin
fastboot flash bootloader_a bootloader.img
fastboot flash boot_a boot.img
fastboot flash dtbo_a dtbo.img
fastboot flash system_a system.img
fastboot flash vendor_a vendor.img
fastboot flash misc misc.img
fastboot flash product product.img
fastboot flash userdata userdata.img
fastboot reboot

echo Press any key to exit...
pause >nul
exit
EOF
chmod a+x ${RESULT_DIR}/flash-all.bat

