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

-include device/nexell/con_svma/common/BoardConfigCommon.mk

TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a9

TARGET_USES_64_BIT_BINDER := true

# misc by-name path
NEXELL_MISC_PARTITION := /dev/block/platform/c0000000.soc/c0069000.dw_mmc/by-name/misc

# bluetooth
BOARD_CUSTOM_BT_CONFIG := device/nexell/con_svma/s5p6818_con_svma/bluetooth_config/vnd_con_svma_s5p6818.txt

BOARD_PREBUILT_DTBOIMAGE := device/nexell/con_svma/s5p6818_con_svma/dtbo.img