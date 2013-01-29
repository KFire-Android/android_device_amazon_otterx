# Inherit device configuration for Kindle Fire
$(call inherit-product, device/amazon/otter/full_otter.mk)
$(call inherit-product, device/amazon/otter-common/cm.mk)

PRODUCT_NAME := cm_otter
PRODUCT_DEVICE := otter
PRODUCT_MODEL := Amazon Kindle Fire
PRODUCT_RELEASE_NAME := KFire

