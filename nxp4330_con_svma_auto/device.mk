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

LOCAL_PATH := device/nexell/con_svma/nxp4330_con_svma_auto

########################################################################
# PRODUCT_AAPT_CONFIG
########################################################################

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := mdpi
PRODUCT_AAPT_PREBUILT_DPI := hdpi mdpi ldpi
PRODUCT_CHARACTERISTICS := tablet
PRODUCT_SHIPPING_API_LEVEL := 26


########################################################################
# PRODUCT_PACKAGES
########################################################################

# ion
PRODUCT_PACKAGES += \
    libion \
    iontest

# graphic
PRODUCT_PACKAGES += \
    libdrm

# hidl
PRODUCT_PACKAGES += \
    android.hardware.graphics.mapper@2.0 \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.allocator@2.0 \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.composer@2.1 \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.composer@2.1-service \
    android.hardware.light@2.0-impl \
    android.hardware.light@2.0-service \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.soundtrigger@2.0-impl \
    android.hardware.memtrack@1.0-impl \
    android.hardware.memtrack@1.0-service

# hal
PRODUCT_PACKAGES += \
    gralloc.s5pxx18 \
    libGLES_mali \
    hwcomposer.s5pxx18 \
    lights.s5pxx18 \
    audio.primary.s5pxx18 \
    gatekeeper.s5pxx18 \
    bootctrl.s5pxx18 \
    memtrack.s5pxx18

# audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default

# input
PRODUCT_PACKAGES += \
    libtslib \
    inputraw \
    pthres \
    dejitter \
    linear \
    tscalib

# keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service \
    libsoftkeymasterdevice

# gatekeeper
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.gatekeeper@1.0-service

# usb
PRODUCT_PACKAGES += \
    android.hardware.usb@1.1-service-nexell

# VNDK libraries
PRODUCT_PACKAGES += \
    vndk_package

# neteutils
PRODUCT_PACKAGES += \
    netutils-wrapper-1.0

PRODUCT_PACKAGES += \
	libcurl \
	libusb1.0

# wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0 \
    android.hardware.wifi@1.0-service \
    android.hardware.wifi.hostapd@1.0 \
    wificond \
    wifilogd \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

# bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0 \
    android.hardware.bluetooth@1.0-impl \
    android.hardware.bluetooth@1.0-service \
    android.hardware.bluetooth.a2dp@1.0 \
    android.hardware.bluetooth.a2dp@1.0-impl \
    libbt-vendor

PRODUCT_PACKAGES += \
  cppreopts.sh \
  update_engine \
  update_verifier

PRODUCT_PACKAGES_DEBUG += update_engine_client

# Boot control HAL
PRODUCT_PACKAGES += \
    android.hardware.boot@1.0-impl \
    android.hardware.boot@1.0-service \

# bootctrl HAL
PRODUCT_PACKAGES += \
    bootctrl.default \
    bootctrl.$(TARGET_BOARD_PLATFORM) \
    bootctl

# App compilation in background
PRODUCT_PACKAGES += otapreopt_script

# power
PRODUCT_PACKAGES += \
    android.hardware.power@1.1-service

# For A/B update test
PRODUCT_PACKAGES += \
  updater

# For vold
PRODUCT_PACKAGES += \
  fsck.exfat \
  mkfs.exfat \
  mount.exfat \
  fsck.ntfs \
  mkfs.ntfs \
  mount.ntfs

# libaaudio example
PRODUCT_PACKAGES += \
  input_monitor \
  input_monitor_callback \
  aaudio_loopback \
  write_sine \
  write_sine_callback


PRODUCT_PACKAGES += \
    nx_init

PRODUCT_PACKAGES += \
    NxQuickRearCam

# automotive
PRODUCT_PACKAGES += \
	vhal_v2_0_defaults \
	android.hardware.automotive.vehicle@2.0-manager-lib \
	android.hardware.automotive.vehicle@2.0-default-impl-lib \
	android.hardware.automotive.vehicle@2.0-service \
	android.hardware.automotive.vehicle@2.0-libproto-native \
	android.hardware.automotive.vehicle@2.0


# ffmpeg extractor
EN_FFMPEG_EXTRACTOR := false
EN_FFMPEG_AUDIO_DEC := false

# video only seek
# This patch has been modified to seek only video
#  when using setSurface() (home->app)
EN_VIDEO_ONLY_SEEK := false

# omx
PRODUCT_PACKAGES += \
    libstagefrighthw \
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
PRODUCT_COPY_FILES += \
    hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavcodec.so.55:system/lib/libavcodec.so.55    \
    hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavformat.so.55:system/lib/libavformat.so.55  \
    hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavutil.so.52:system/lib/libavutil.so.52

PRODUCT_COPY_FILES += \
    hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavcodec.so.55:$(TARGET_COPY_OUT_VENDOR)/lib/libavcodec.so.55    \
    hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavformat.so.55:$(TARGET_COPY_OUT_VENDOR)/lib/libavformat.so.55  \
    hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libavutil.so.52:$(TARGET_COPY_OUT_VENDOR)/lib/libavutil.so.52      \
    hardware/nexell/s5pxx18/omx/codec/ffmpeg/32bit/libs/libswresample.so.0:$(TARGET_COPY_OUT_VENDOR)/lib/libswresample.so.0
endif   #EN_FFMPEG_EXTRACTOR


########################################################################
# PRODUCT_COPY_FILES
########################################################################

# init rc
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/init.$(PRODUCT_HARDWARE).rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_HARDWARE).rc \
    $(LOCAL_PATH)/init.$(PRODUCT_HARDWARE).usb.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_HARDWARE).usb.rc

#recovery
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/init.recovery.con_svma.rc:root/init.recovery.$(PRODUCT_HARDWARE).rc

# partmap
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/partmap.txt:partmap.txt

# fstab
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.con_svma:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.$(PRODUCT_HARDWARE)

# uevent
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/ueventd.$(PRODUCT_HARDWARE).rc:$(TARGET_COPY_OUT_VENDOR)/ueventd.rc

# default feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.app_widgets.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.app_widgets.xml \
    frameworks/native/data/etc/android.hardware.screen.landscape.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.screen.landscape.xml \
    frameworks/native/data/etc/android.software.webview.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.webview.xml

# input
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/input/gpio_keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio_keys.kl \
    $(LOCAL_PATH)/input/gpio_keys.kcm:$(TARGET_COPY_OUT_VENDOR)/usr/keychars/gpio_keys.kcm

# audio
USE_XML_AUDIO_POLICY_CONF := 1
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.output.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.output.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.audio.low_latency.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/audio_policy_volumes.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_volumes.xml \
    $(LOCAL_PATH)/audio/a2dp_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/a2dp_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/usb_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/usb_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/r_submix_audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/r_submix_audio_policy_configuration.xml \
    $(LOCAL_PATH)/audio/default_volume_tables.xml:$(TARGET_COPY_OUT_VENDOR)/etc/default_volume_tables.xml \

PRODUCT_COPY_FILES += \
	frameworks/base/data/sounds/effects/Effect_Tick.ogg:system/media/audio/ui/Effect_Tick.ogg \
	frameworks/base/data/sounds/effects/KeypressStandard.ogg:system/media/audio/ui/KeypressStandard.ogg \
	frameworks/base/data/sounds/effects/KeypressSpacebar.ogg:system/media/audio/ui/KeypressSpacebar.ogg \
	frameworks/base/data/sounds/effects/KeypressDelete.ogg:system/media/audio/ui/KeypressDelete.ogg \
	frameworks/base/data/sounds/effects/KeypressReturn.ogg:system/media/audio/ui/KeypressReturn.ogg \
	frameworks/base/data/sounds/effects/KeypressInvalid.ogg:system/media/audio/ui/KeypressInvalid.ogg \
	frameworks/base/data/sounds/effects/Lock.ogg:system/media/audio/ui/Lock.ogg \
	frameworks/base/data/sounds/effects/Unlock.ogg:system/media/audio/ui/Unlock.ogg \
	frameworks/base/data/sounds/effects/ogg/Trusted.ogg:system/media/audio/ui/Trusted.ogg

# usb
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.usb.host.xml \

# wifi
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    $(LOCAL_PATH)/wifi/dhd:$(TARGET_COPY_OUT_VENDOR)/bin/dhd \
    $(LOCAL_PATH)/wifi/wl:$(TARGET_COPY_OUT_VENDOR)/bin/wl \
    $(LOCAL_PATH)/wifi/bcmdhd.cal:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/bcmdhd.cal \
    $(LOCAL_PATH)/wifi/fw_bcmdhd.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/fw_bcmdhd.bin \
    $(LOCAL_PATH)/wifi/fw_bcmdhd_apsta.bin:$(TARGET_COPY_OUT_VENDOR)/firmware/fw_bcmdhd_apsta.bin \
    $(LOCAL_PATH)/wifi/config/wpa_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/config/p2p_supplicant_overlay.conf:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/p2p_supplicant_overlay.conf

# media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_video.xml \
    $(LOCAL_PATH)/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles.xml
# media ffmpeg extractor
ifeq ($(EN_FFMPEG_AUDIO_DEC),true)
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media_codecs_ffmpeg/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/media_codecs_ffmpeg/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
else
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_google_audio.xml \
    $(LOCAL_PATH)/media_codecs/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml
endif

# bluetooth
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    $(LOCAL_PATH)/bluetooth/BCM434545.hcd:$(TARGET_COPY_OUT_VENDOR)/firmware/BCM434545.hcd

# connection service
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.connectionservice.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.connectionservice.xml

# bluetooth
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/bluetooth/bt_vendor_s5p4418.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bt_vendor.conf

#one_cam topview config
PRODUCT_COPY_FILES += \
    vendor/nexell/app/svm_daemon/data/avm_onecam/avm_config_onecam_m1.txt:$(TARGET_COPY_OUT_PRODUCT)/avm_onecam/avm_config_onecam.txt

########################################################################
# PRODUCT_PROPERTY_OVERRIDES
########################################################################

PRODUCT_PROPERTY_OVERRIDES += ro.hardware.power=nexell

#JAVA frameworks
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.power_manager=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.kernel_cpu_speed_reader=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.kernel_uid_cpu_freq_time_reader=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.kernel_wake_lock_reader=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.audio_manager=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.keyguard_display_manager=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.keyguard_update_monitor=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.keyguard_slice_provider=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.keyguard_view_mediator=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.cellular_tile=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.system_services_proxy=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.notification_media_manager=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.auto_tile_manager=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.phone_status_bar_policy=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.status_bar=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.access_point_controller_impl=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.network_controller_impl=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.wifi_signal_controller=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.notification_channels=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.activity_manager_service=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.device_idle_controller=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.input_method_manager_service=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.job_scheduler_service=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.lock_settings_service=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.lock_settings_storage=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.notification_manager_service=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.phone_window_manager=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.power_manager_service=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.storage_manager_service=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.system_service_manager=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.window_manager_service=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.device_policy_manager_service=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.system_server=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.usage_stats_service=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.usb_service=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.telephony_manager=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.inbound_sms_handler=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.radio_config=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.ril=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.wake_lock_state_machine=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.wifi_thread=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.bluetooth_delay=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.art_verify=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.zygote_thread=1
PRODUCT_PROPERTY_OVERRIDES += ro.quickboot.system_server_thread=1
PRODUCT_PROPERTY_OVERRIDES += persist.quickboot.firstboot=1
PRODUCT_PROPERTY_OVERRIDES += config.disable_cameraservice=1
# OpenGL ES API version: 2.0
PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=131072

# density
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 \
	ro.sf.disable_triple_buffer=0

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=96m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=2m

# media_profiles
PRODUCT_PROPERTY_OVERRIDES += \
    media.settings.xml=/vendor/etc/media_profiles.xml

# Enable AAudio MMAP/NOIRQ data path.
# 1 is AAUDIO_POLICY_NEVER  means only use Legacy path.
# 2 is AAUDIO_POLICY_AUTO   means try MMAP then fallback to Legacy path.
# 3 is AAUDIO_POLICY_ALWAYS means only use MMAP path.
PRODUCT_PROPERTY_OVERRIDES += aaudio.mmap_policy=2
# 1 is AAUDIO_POLICY_NEVER  means only use SHARED mode
# 2 is AAUDIO_POLICY_AUTO   means try EXCLUSIVE then fallback to SHARED mode.
# 3 is AAUDIO_POLICY_ALWAYS means only use EXCLUSIVE mode.
PRODUCT_PROPERTY_OVERRIDES += aaudio.mmap_exclusive_policy=2

PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.ota_update_verifier=true

$(call add-product-sanitizer-module-config,wpa_supplicant,never)
$(call add-product-sanitizer-module-config,hostapd,never)
$(call inherit-product-if-exists, vendor/nexell/app/automotive/nexell_connectivity.mk)
$(call inherit-product-if-exists, vendor/nexell/app/svm_daemon/svm-daemon.mk)
$(call inherit-product-if-exists, vendor/nexell/app/nx_backgear_service/nxbackgearservice.mk)
$(call inherit-product-if-exists, vendor/nexell/app/nx_rearcam_app/nxrearcam.mk)
$(call inherit-product-if-exists, vendor/nexell/app/nx_svm_app/nxsvm.mk)
$(call inherit-product-if-exists, vendor/nexell/app/nx_svm_autocalibration/nxsvmautocalibration.mk)
$(call inherit-product-if-exists, vendor/nexell/app/nx_svm_demo/nxsvmdemo.mk)
$(call inherit-product-if-exists, vendor/nexell/app/nx_svm_viewmode_editor/nxsvmviewmodeeditor.mk)


