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
$(call inherit-product, device/nexell/con_svma/aosp_con_svma_common.mk)

PRODUCT_COPY_FILES += \
	device/nexell/con_svma/init.con_svma_32.rc:root/init.con_svma.rc

PRODUCT_COPY_FILES += \
	device/nexell/kernel/kernel-4.4.x/arch/arm/boot/zImage:kernel

PRODUCT_COPY_FILES += \
	device/nexell/kernel/kernel-4.4.x/arch/arm/boot/dts/s5p4418-con_svma-rev00.dtb:2ndbootloader
