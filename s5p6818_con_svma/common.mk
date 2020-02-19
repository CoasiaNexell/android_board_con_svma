#kernel
KERNEL_DIR := device/nexell/kernel/kernel-4.4.x
TARGET_PREBUILT_KERNEL := ${KERNEL_DIR}/arch/arm64/boot/Image
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
PRODUCT_COPY_FILES += $(LOCAL_KERNEL):kernel

#dtb
BOARD_PREBUILT_DTBOIMAGE := device/nexell/con_svma/s5p6818_con_svma/dtbo.img

ifeq ($(QUICKBOOT), 1)
PRODUCT_COPY_FILES += \
    device/nexell/con_svma/s5p6818_con_svma/init.$(PRODUCT_HARDWARE).quickboot.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_HARDWARE).rc
else
PRODUCT_COPY_FILES += \
    device/nexell/con_svma/s5p6818_con_svma/init.$(PRODUCT_HARDWARE).rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.$(PRODUCT_HARDWARE).rc
endif

# fstab
PRODUCT_COPY_FILES += \
    device/nexell/con_svma/common/fstab.con_svma:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.$(PRODUCT_HARDWARE)

# bluetooth
PRODUCT_COPY_FILES += \
    device/nexell/con_svma/s5p6818_con_svma/bluetooth_config/bt_vendor_s5p6818.conf:$(TARGET_COPY_OUT_VENDOR)/etc/bluetooth/bt_vendor.conf

#recovery
TARGET_RECOVERY_FSTAB := device/nexell/con_svma/common/fstab.con_svma
PRODUCT_COPY_FILES += \
    device/nexell/con_svma/s5p6818_con_svma/init.recovery.con_svma.rc:root/init.recovery.$(PRODUCT_HARDWARE).rc