$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/generic_no_telephony.mk)

PRODUCT_NAME := s5p6818_con_svma64
PRODUCT_DEVICE := s5p6818_con_svma64
PRODUCT_BRAND := Android
PRODUCT_MODEL := AOSP on con_svma
PRODUCT_MANUFACTURER := Nexell
PRODUCT_HARDWARE := con_svma

# automatically called
$(call inherit-product, device/nexell/con_svma/s5p6818_con_svma64/device.mk)


