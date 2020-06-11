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

# Inherit the full_base and device configurations
# $(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, device/nexell/quickboot/component.mk)

PRODUCT_NAME := aosp_con_svma
PRODUCT_DEVICE := con_svma
PRODUCT_BRAND := Android
PRODUCT_MODEL := AOSP on con_svma
PRODUCT_MANUFACTURER := NEXELL

PRODUCT_COPY_FILES += \
	device/nexell/con_svma/fstab.con_svma_svm:root/fstab.con_svma

PRODUCT_COPY_FILES += \
    device/nexell/con_svma/init.con_svma_64.rc:root/init.con_svma.rc

PRODUCT_COPY_FILES += \
	device/nexell/kernel/kernel-4.4.x/arch/arm64/boot/Image:kernel

PRODUCT_COPY_FILES += \
	device/nexell/kernel/kernel-4.4.x/arch/arm64/boot/dts/nexell/s5p6818-con_svma-rev01.dtb:2ndbootloader

PRODUCT_COPY_FILES += \
	device/nexell/con_svma/init.recovery.con_svma.rc:root/init.recovery.con_svma.rc

PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.first_api_level=21

# vold check fs
PRODUCT_PROPERTY_OVERRIDES += \
	persist.vold.check_fs=0

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.disable_bluetooth=false

# Disable other feature no needed in con_svma board
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += config.quickboot=true

$(call inherit-product, device/nexell/con_svma/device.mk)

PRODUCT_PACKAGES += \
	Home
