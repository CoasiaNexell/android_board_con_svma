#
# Copyright (C) 2015 The Android Open-Source Project
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

TARGET_BOOTLOADER_BOARD_NAME := con_svma
TARGET_BOARD_INFO_FILE := device/nexell/con_svma/board-info.txt

ENABLE_CPUSETS := true
ENABLE_SCHEDBOOST := true

TARGET_NO_BOOTLOADER := false
TARGET_NO_KERNEL := false
TARGET_NO_RADIOIMAGE := true
TARGET_NO_RECOVERY := false

# recovery
TARGET_RELEASETOOLS_EXTENSIONS := device/nexell/con_svma
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_nexell
ifeq ($(QUICKBOOT), 1)
TARGET_RECOVERY_FSTAB := device/nexell/con_svma/recovery.fstab_svm
else
TARGET_RECOVERY_FSTAB := device/nexell/con_svma/recovery.fstab
endif

BOARD_USES_ECNR := true
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := false

BOARD_EGL_CFG := device/nexell/con_svma/egl.cfg
USE_OPENGL_RENDERER := true
TARGET_USES_ION := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# see surfaceflinger
MAX_VIRTUAL_DISPLAY_DIMENSION := 2048

# Enable dex-preoptimization to speed up first boot sequence
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
      WITH_DEXPREOPT_PIC := true
    endif
  endif
endif

# bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/nexell/con_svma/bluetooth
BOARD_CUSTOM_BT_CONFIG := device/nexell/con_svma/bluetooth/vnd_con_svma.txt

# bluetooth audio paths
SND_BT_CARD_ID := 0
SND_BT_DEVICE_ID := 0
SND_BT_SCO_CARD_ID := 0
SND_BT_SCO_DEVICE_ID := 1

BOARD_CHARGER_ENABLE_SUSPEND := false

# ffmpeg libraries
EN_FFMPEG_EXTRACTOR := false
EN_FFMPEG_AUDIO_DEC := false

# sepolicy
BOARD_SEPOLICY_DIRS += \
	device/nexell/con_svma/sepolicy

# filesystems
BOARD_ROOT_EXTRA_FOLDERS := dev_q
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 536870912
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4704960512
BOARD_FLASH_BLOCK_SIZE := 131072

# boot image layout
BOARD_KERNEL_PAGESIZE := 2048
TARGET_BOOTLOADER_IS_2ND := true

TARGET_USES_AOSP := true

USE_CLANG_PLATFORM_BUILD := true

# Wifi releated defines
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WLAN_DEVICE           := bcmdhd
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/system/etc/firmware/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/system/etc/firmware/fw_bcmdhd.bin"

# certificate
PRODUCT_DEFAULT_DEV_CERTIFICATE := device/nexell/con_svma/signing_keys/release

# camera
ifeq ($(QUICKBOOT), 1)
# for TW9900
# camera video device number for back-the orientation of the camera
BOARD_CAMERA_BACK_DEVICE := "7"
BOARD_CAMERA_BACK_ORIENTATION := "0"
BOARD_CAMERA_BACK_INTERLACED := "0"
BOARD_CAMERA_BACK_COPY_MODE := "1"
BOARD_CAMERA_NUM := 1
# default = false or none
BOARD_CAMERA_USE_ZOOM := false
BOARD_CAMERA_SUPPORT_SCALING := false
else
# for TW9900
# camera video device number for back-the orientation of the camera
BOARD_CAMERA_BACK_DEVICE := "7"
BOARD_CAMERA_BACK_ORIENTATION := "0"
BOARD_CAMERA_BACK_INTERLACED := "0"
BOARD_CAMERA_BACK_COPY_MODE := "1"
# for TP2825
# camera video device number for front-the orientation of the camera
BOARD_CAMERA_FRONT_DEVICE := "8"
BOARD_CAMERA_FRONT_ORIENTATION := "0"
BOARD_CAMERA_FRONT_INTERLACED := "0"
BOARD_CAMERA_FRONT_COPY_MODE := "0"
BOARD_CAMERA_NUM := 2
# default = false or none
BOARD_CAMERA_USE_ZOOM := false
BOARD_CAMERA_SUPPORT_SCALING := false
# default = none
#BOARD_CAMERA_SKIP_FRAME := 10
endif

#gralloc
BOARD_GRALLOC_ALIGN_FACTOR := 128

TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888

TARGET_NO_DTIMAGE = false

