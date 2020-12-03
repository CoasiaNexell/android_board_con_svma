#
# Copyright 2017 The Android Open-Source Project
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

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9

TARGET_USES_64_BIT_BINDER := true

# misc by-name path
NEXELL_MISC_PARTITION := /dev/block/by-name/misc

# Kernel & DTB Setting
TARGET_KERNEL_DEFCONFIG := s5p6818_con_svma_pie_defconfig
TARGET_KERNEL_SRC := vendor/nexell/kernel/kernel-4.4.x
TARGET_KERNEL_ARCH := arm64
DTB_OUTDIR := out/target/product/s5p6818_con_svma/obj/KERNEL_OBJ
DTB_DIR := ${DTB_OUTDIR}/arch/arm64/boot/dts/nexell
DTIMG_ARG := ${DTB_DIR}/s5p6818-con_svma-rev01.dtb --id=1
BOARD_PREBUILT_DTBOIMAGE := out/target/product/s5p6818_con_svma/dtbo_con_svma.img

BOARD_VENDOR_KERNEL_MODULES += \
    $(KERNEL_OUT)/drivers/usb/gadget/function/usb_f_iap.ko \
    $(KERNEL_OUT)/drivers/usb/gadget/legacy/g_iap_ncm.ko

# BL1 Setting
BL1_BOARD_NAME := con_svma
KERNEL_VER := 4
SYSLOG := n
DEVICE_PORT := 2
TARGET_BL1_SRC := vendor/nexell/bl1/bl1-s5p6818

# UBOOT Setting
SOC_NAME := s5p6818
TARGET_UBOOT_ARCH := arm64
UBOOT_CONFIG := s5p6818_con_svma_config
TARGET_UBOOT_SRC := vendor/nexell/u-boot/u-boot-2016.01
SECURE_BINGEN := vendor/nexell/tools/SECURE_BINGEN


#optee Setting
UBOOT_LOAD_ADDR := 0x4007f000
OFFSET_LOADER := 65536
OFFSET_SECURE := 327680             #0x50000 = 0x60000 - 0x10000
OFFSET_SECURE_HEAD := 393728       #0x60200 : 0x60000 + 0x200(NSIH) = 393728
OFFSET_NONSECURE := 1900544         #0x1D0000 = 0x1E0000 - 0x10000
OFFSET_NONSECURE_HEAD := 1966592   #0x1E0000 : 0x1E0000 + 0x200(NSIH) = 1966592
OFFSET_PARAM := 2949120             #0x2D0000 = 0x2E0000 - 0x10000
OFFSET_BOOTLOGO := 2965504          #0x2D4000 = 0x2E4000 - 0x10000
TARGET_OPTEE_SRC := vendor/nexell/secure
OPTEE_BUILD_OPT := PLAT_DRAM_SIZE=2048 PLAT_UART_BASE=0xc00a1000 SECURE_ON=0 SUPPORT_ANDROID=1
OPTEE_BUILD_OPT += CROSS_COMPILE=aarch64-linux-gnu- CROSS_COMPILE32=arm-linux-gnueabihf-
OPTEE_BUILD_OPT += SUPPORT_OTA_AB_UPDATE=1
OPTEE_BUILD_OPT += UBOOT_DIR=vendor/nexell/u-boot/u-boot-2016.01

#gen_bootloader
BOOTLOADER_PARTITION_SIZE := 4915200
BOOT_LOGO := device/nexell/con_svma/s5p6818_con_svma/logo.bmp

BOOTCMD_A=aboot load_kernel 0x5480 0x4007f000;
BOOTCMD_A+=dtimg load_mmc 0x42480 0x49000000 $$\{board_rev\};
BOOTCMD_A+=if test !-z $$\{change_devicetree\}; then run change_devicetree; fi;
BOOTCMD_A+=bootm 0x4007f000 - 0x49000000

BOOTCMD_B=aboot load_kernel 0x23c80 0x4007f000;
BOOTCMD_B+=dtimg load_mmc 0x44480 0x49000000 $$\{board_rev\};
BOOTCMD_B+=if test !-z $$\{change_devicetree\}; then run change_devicetree; fi;
BOOTCMD_B+=bootm 0x4007f000 - 0x49000000

RECOVERY_BOOTCMD_A=aboot load_mmc 0x5480 0x4007f000 0x48000000;
RECOVERY_BOOTCMD_A+=dtimg load_mmc 0x42480 0x49000000 $$\{board_rev\};
RECOVERY_BOOTCMD_A+=if test !-z $$\{change_devicetree\};then run change_devicetree; fi;
RECOVERY_BOOTCMD_A+=booti 0x4007f000 0x48000000:$$\{ramdisk_size\} 0x49000000

RECOVERY_BOOTCMD_B=aboot load_mmc 0x23c80 0x4007f000 0x48000000;
RECOVERY_BOOTCMD_B+=dtimg load_mmc 0x44480 0x49000000 $$\{board_rev\};
RECOVERY_BOOTCMD_B+=if test !-z $$\{change_devicetree\};then run change_devicetree; fi;
RECOVERY_BOOTCMD_B+=booti 0x4007f000 0x48000000:$$\{ramdisk_size\} 0x49000000

UBOOT_BOOTARGS=console=ttySAC0,115200n8 printk.time=1
UBOOT_BOOTARGS+=androidboot.hardware=con_svma androidboot.console=ttySAC0
UBOOT_BOOTARGS+=androidboot.serialno=0123456789abcdef
UBOOT_BOOTARGS+=root=\/dev\/mmcblk0p2 ro rootwait rootfstype=ext4
UBOOT_BOOTARGS+=init=\/init skip_initramfs vmalloc=384M
UBOOT_BOOTARGS+=androidboot.selinux=permissive
UBOOT_BOOTARGS+=loglevel=7
UBOOT_BOOTARGS+=blkdevparts=mmcblk0:4915200@66048(bootloader_a),4915200@5046784(bootloader_b),62914560@11075584(boot_a),2097152@73990114(extended),62914560@75038720(boot_b),3145728@139001856(dtbo_a),3145728@143196160(dtbo_b),1073741824@147390464(system_a),1073741824@1222180864(system_b),268435456@2296971264(vendor_a),268435456@2566455296(vendor_b),1048576@2835939328(misc),3145728@2838036480(product),4975951872@2842230784(userdata)

UBOOT_RECOVERY_BOOTARGS=console=ttySAC0,115200n8 printk.time=1
UBOOT_RECOVERY_BOOTARGS+=androidboot.hardware=con_svma androidboot.console=ttySAC0
UBOOT_RECOVERY_BOOTARGS+=androidboot.serialno=0123456789abcdef
UBOOT_RECOVERY_BOOTARGS+=blkdevparts=mmcblk0:4915200@66048(bootloader_a),4915200@5046784(bootloader_b),62914560@11075584(boot_a),2097152@73990114(extended),62914560@75038720(boot_b),3145728@139001856(dtbo_a),3145728@143196160(dtbo_b),1073741824@147390464(system_a),1073741824@1222180864(system_b),268435456@2296971264(vendor_a),268435456@2566455296(vendor_b),1048576@2835939328(misc),3145728@2838036480(product),4975951872@2842230784(userdata)

SPLASH_SOURCE="mmc"
SPLASH_OFFSET="0x2e4200"

NEXELL_QUICKBOOT := false
# init rc service
CAMERA_SERVER_QUICKBOOT := false
MEDIA_DRM_SERVER_QUICKBOOT := false
BOOT_ANIMATION_QUICKBOOT := false
INCIDENTD_QUICKBOOT := false
STATSD_QUICKBOOT := false
OTA_PRE_OPT_QUICKBOOT := false
WIFI_SERVICE_QUICKBOOT := false
INIT_RC_QUICKBOOT := false
# CPP frameworks
BATTERY_NOTIFIER_QUICKBOOT := false
GUI_QUICKBOOT := false
OPEN_GL_QUICKBOOT := false
SURFACE_FLINGER_QUICKBOOT := false

# define targets
TARGET_BOARD_PLATFORM := s5pxx18
TARGET_BOOTLOADER_BOARD_NAME := con_svma

# do not stop building despite of build warning
BUILD_BROKEN_DUP_RULES := true

# images
TARGET_NO_BOOTLOADER := false
TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RECOVERY := true
BOARD_USES_RECOVERY_AS_BOOT := true

TARGET_RECOVERY_WIPE = device/nexell/con_svma/s5p6818_con_svma/recovery.wipe
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

BOARD_BUILD_SYSTEM_ROOT_IMAGE := true

# boot image layout
BOARD_KERNEL_PAGESIZE := 4096
TARGET_BOOTLOADER_IS_2ND := false

# enable treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
BOARD_VNDK_VERSION := current

# use split vendor partition
TARGET_COPY_OUT_VENDOR := vendor

# filesystem
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_SYSTEMIMAGE_JOURNAL_SIZE := 0
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 4096
BOARD_VENDORIMAGE_PARTITION_SIZE := 268435456
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4975951872
TARGET_COPY_OUT_PRODUCT := product
BOARD_PRODUCTIMAGE_PARTITION_SIZE := 3145728
BOARD_PRODUCTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_DTBOIMG_PARTITION_SIZE := 3145728
BOARD_FLASH_BLOCK_SIZE := 131072

DEVICE_MANIFEST_FILE := device/nexell/con_svma/s5p6818_con_svma/manifest.xml
DEVICE_PACKAGE_OVERLAYS := device/nexell/con_svma/s5p6818_con_svma/overlay

#sepolicy
BOARD_SEPOLICY_DIRS := device/nexell/con_svma/s5p6818_con_svma/sepolicy/vendor
BOARD_PLAT_PUBLIC_SEPOLICY_DIR := device/nexell/con_svma/s5p6818_con_svma/sepolicy/public
BOARD_PLAT_PRIVATE_SEPOLICY_DIR := device/nexell/con_svma/s5p6818_con_svma/sepolicy/private

# graphics
BOARD_EGL_CFG := device/nexell/con_svma/s5p6818_con_svma/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
# see surfaceflinger
MAX_VIRTUAL_DISPLAY_DIMENSION := 2048

# HIDL configstore
VSYNC_EVENT_PHASE_OFFSET_NS := 0
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 0
TARGET_USE_CONTEXT_PRIORITY := false
TARGET_HAS_WIDE_COLOR_DISPLAY := false
TARGET_HAS_HDR_DISPLAY := false
PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 0
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := false
MAX_VIRTUAL_DISPLAY_DIMENSION := 2048
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := false
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
SF_PRIMARY_DISPLAY_ORIENTATION := 0

# audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := false

# camera
BOARD_CAMERA_BACK_DEVICE := "6"
BOARD_CAMERA_BACK_ORIENTATION := "0"
BOARD_CAMERA_NUM := 1
BOARD_CAMERA_USE_ZOOM := false
BOARD_CAMERA_SUPPORT_SCALING := true

# bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/nexell/con_svma/s5p6818_con_svma/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/nexell/con_svma/s5p6818_con_svma/bluetooth/vnd_con_svma_s5p6818.txt

# bluetooth audio paths
SND_BT_CARD_ID := 0
SND_BT_DEVICE_ID := 0
SND_BT_SCO_CARD_ID := 0
SND_BT_SCO_DEVICE_ID := 1

# Wifi releated defines
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P     := ""
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true

#gralloc
#use nx-video-api
BOARD_GRALLOC_ALIGN_FACTOR := 128

#recovery
TARGET_RECOVERY_FSTAB := device/nexell/con_svma/s5p6818_con_svma/fstab.con_svma

# target definitions
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS := \
  bootloader \
  boot \
  dtbo \
  system \
  vendor

# A/B OTA post actions
AB_OTA_POSTINSTALL_CONFIG += \
  RUN_POSTINSTALL_system=true \
  POSTINSTALL_PATH_system=system/bin/otapreopt_script \
  FILESYSTEM_TYPE_system=ext4 \
  POSTINSTALL_OPTIONAL_system=true


