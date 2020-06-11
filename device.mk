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

PRODUCT_SHIPPING_API_LEVEL := 25

# Camera App
PRODUCT_PACKAGES += \
	Camera

PRODUCT_COPY_FILES += \
	device/nexell/con_svma/init.con_svma.usb.rc:root/init.con_svma.usb.rc \
	device/nexell/con_svma/ueventd.con_svma.rc:root/ueventd.con_svma.rc \
	device/nexell/con_svma/busybox:system/bin/busybox \
	device/nexell/con_svma/hwreg_cmd:system/bin/hwreg_cmd \
	device/nexell/con_svma/memtester:system/bin/memtester \
	device/nexell/con_svma/modetest:system/bin/modetest

ifeq ($(QUICKBOOT), 1)
PRODUCT_COPY_FILES += \
	device/nexell/con_svma/media_profiles_quick.xml:system/etc/media_profiles.xml
else
PRODUCT_COPY_FILES += \
	device/nexell/con_svma/media_profiles.xml:system/etc/media_profiles.xml

# tinyalsa
PRODUCT_PACKAGES += \
	libtinyalsa \
	tinyplay \
	tinycap \
	tinymix \
	tinypcminfo
endif


PRODUCT_PACKAGES += \
    nx_init \
    NxQuickRearCam

PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# audio
USE_XML_AUDIO_POLICY_CONF := 1
PRODUCT_COPY_FILES += \
    device/nexell/con_svma/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/nexell/con_svma/audio_policy_configuration.xml:system/etc/audio_policy_configuration.xml \
    device/nexell/con_svma/audio_policy_volumes.xml:system/etc/audio_policy_volumes.xml \
    device/nexell/con_svma/a2dp_audio_policy_configuration.xml:system/etc/a2dp_audio_policy_configuration.xml \
    device/nexell/con_svma/usb_audio_policy_configuration.xml:system/etc/usb_audio_policy_configuration.xml \
    device/nexell/con_svma/r_submix_audio_policy_configuration.xml:system/etc/r_submix_audio_policy_configuration.xml \
    device/nexell/con_svma/default_volume_tables.xml:system/etc/default_volume_tables.xml

PRODUCT_COPY_FILES += \
    device/nexell/con_svma/audio/tiny_hw.con_svma.xml:system/etc/tiny_hw.con_svma.xml \
    device/nexell/con_svma/audio/audio_policy.conf:system/etc/audio_policy.conf

PRODUCT_COPY_FILES += \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	device/nexell/con_svma/media_codecs.xml:system/etc/media_codecs.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml

# nx_vpu, wifi, sdio module
ifeq ($(QUICKBOOT), 1)
PRODUCT_COPY_FILES += \
    device/nexell/kernel/kernel-4.4.x/drivers/net/wireless/bcmdhd_cypress/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
    device/nexell/kernel/kernel-4.4.x/drivers/media/platform/nx-vpu/nx_vpu.ko:system/lib/modules/nx_vpu.ko \
    device/nexell/kernel/kernel-4.4.x/drivers/mmc/host/dw_mmc-nexell_sdio_1.ko:system/lib/modules/dw_mmc-nexell_sdio_1.ko
endif

# bluetooth
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	device/nexell/con_svma/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
	device/nexell/con_svma/bluetooth/BCM434545.hcd:system/vendor/firmware/BCM434545.hcd

# connection service
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.software.connectionservice.xml:system/etc/permissions/android.software.connectionservice.xml

# ffmpeg libraries
EN_FFMPEG_EXTRACTOR := false
EN_FFMPEG_AUDIO_DEC := false

ifeq ($(EN_FFMPEG_EXTRACTOR),true)

PRODUCT_COPY_FILES += \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavcodec.so:system/lib/libavcodec.so    \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavcodec.so.55:system/lib/libavcodec.so.55    \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavcodec.so.55.39.101:system/lib/libavcodec.so.55.39.101    \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavdevice.so:system/lib/libavdevice.so  \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavdevice.so.55:system/lib/libavdevice.so.55  \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavdevice.so.55.5.100:system/lib/libavdevice.so.55.5.100  \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavfilter.so:system/lib/libavfilter.so  \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavfilter.so.3:system/lib/libavfilter.so.3  \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavfilter.so.3.90.100:system/lib/libavfilter.so.3.90.100  \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavformat.so:system/lib/libavformat.so  \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavformat.so.55:system/lib/libavformat.so.55  \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavformat.so.55.19.104:system/lib/libavformat.so.55.19.104  \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavresample.so:system/lib/libavresample.so      \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavresample.so.1:system/lib/libavresample.so.1      \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavresample.so.1.1.0:system/lib/libavresample.so.1.1.0      \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavutil.so:system/lib/libavutil.so      \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavutil.so.52:system/lib/libavutil.so.52      \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavutil.so.52.48.101:system/lib/libavutil.so.52.48.101      \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libswresample.so:system/lib/libswresample.so \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libswresample.so.0:system/lib/libswresample.so.0 \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libswresample.so.0.17.104:system/lib/libswresample.so.0.17.104 \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libswscale.so:system/lib/libswscale.so \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libswscale.so.2:system/lib/libswscale.so.2 \
	hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libswscale.so.2.5.101:system/lib/libswscale.so.2.5.101

endif	#EN_FFMPEG_EXTRACTOR

# input
PRODUCT_COPY_FILES += \
	device/nexell/con_svma/gpio_keys.kl:system/usr/keylayout/gpio_keys.kl \
	device/nexell/con_svma/gpio_keys.kcm:system/usr/keychars/gpio_keys.kcm

# hardware features
PRODUCT_COPY_FILES += \
	device/nexell/con_svma/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
	frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml

# carplay module driver
PRODUCT_COPY_FILES += \
device/nexell/kernel/kernel-4.4.x/drivers/usb/gadget/function/usb_f_iap.ko:system/lib/modules/usb_f_iap.ko \
device/nexell/kernel/kernel-4.4.x/drivers/usb/gadget/legacy/g_iap_ncm.ko:system/lib/modules/g_iap_ncm.ko

# Recovery
PRODUCT_PACKAGES += \
	librecovery_updater_nexell

PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_CONFIG += mdpi xlarge large
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_AAPT_PREBUILT_DPI := hdpi mdpi ldpi
PRODUCT_CHARACTERISTICS := tablet

# OpenGL ES API version: 2.0
PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

# density
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sf.lcd_density=160

# default none for usb
PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=none

# libion needed by gralloc, ogl
PRODUCT_PACKAGES += libion iontest

PRODUCT_PACKAGES += libdrm

# HAL
PRODUCT_PACKAGES += \
	gralloc.con_svma \
	libGLES_mali \
	hwcomposer.con_svma \
	audio.primary.con_svma \
	memtrack.con_svma \
	camera.con_svma \
	lights.con_svma

PRODUCT_PACKAGES += fs_config_files

# omx
PRODUCT_PACKAGES += \
	libstagefrighthw \
	libnx_video_api \
	libNX_OMX_VIDEO_DECODER \
	libNX_OMX_VIDEO_ENCODER \
	libNX_OMX_Base \
	libNX_OMX_Core \
	libNX_OMX_Common

# stagefright FFMPEG compnents
ifeq ($(EN_FFMPEG_AUDIO_DEC),true)
PRODUCT_PACKAGES += libNX_OMX_AUDIO_DECODER_FFMPEG
endif

ifeq ($(EN_FFMPEG_EXTRACTOR),true)
PRODUCT_PACKAGES += libNX_FFMpegExtractor
endif

PRODUCT_PACKAGES += \
	libcurl \
	libusb1.0

# libvcp for alango ecnr
ifeq ($(BOARD_USES_ECNR),true)
PRODUCT_PACKAGES += libvcp
endif

# wifi
PRODUCT_PACKAGES += \
	libwpa_client \
	hostapd \
	wpa_supplicant \
	wpa_supplicant.conf

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0

DEVICE_PACKAGE_OVERLAYS := device/nexell/con_svma/overlay

# increase dex2oat threads to improve booting time
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.boot-dex2oat-threads=4 \
	dalvik.vm.dex2oat-threads=4 \
	dalvik.vm.image-dex2oat-threads=4

#Enabling video for live effects
-include frameworks/base/data/videos/VideoPackage1.mk

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=16m \
    dalvik.vm.heapgrowthlimit=256m \
    dalvik.vm.heapsize=512m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

# skip boot jars check
SKIP_BOOT_JARS_CHECK := true

# wifi
PRODUCT_COPY_FILES += \
	device/nexell/con_svma/wifi/dhd:system/bin/dhd \
	device/nexell/con_svma/wifi/wl:system/bin/wl \
	device/nexell/con_svma/wifi/bcmdhd.cal:system/etc/wifi/bcmdhd.cal \
	device/nexell/con_svma/wifi/fw_bcmdhd.bin:system/etc/firmware/fw_bcmdhd.bin \
	device/nexell/con_svma/wifi/fw_bcmdhd_apsta.bin:system/etc/firmware/fw_bcmdhd_apsta.bin


$(call inherit-product, frameworks/base/data/fonts/fonts.mk)
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/config/config-bcm.mk)

ifeq ($(QUICKBOOT), 1)
$(call inherit-product-if-exists, device/nexell/apps/nx_backgear_service/nxbackgearservice.mk)
$(call inherit-product-if-exists, device/nexell/apps/nx_rearcam_app/nxrearcam.mk)
endif