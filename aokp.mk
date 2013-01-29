# Inherit device configuration for AMZ Otter
$(call inherit-product, device/amazon/otter/full_otter.mk)
$(call inherit-product, device/amazon/otter-common/aokp.mk)

# Setup device specific product configuration.
PRODUCT_NAME := aokp_otter
PRODUCT_DEVICE := otter
PRODUCT_BRAND := Android
PRODUCT_MODEL := Amazon Kindle Fire
PRODUCT_MANUFACTURER := Amazon
PRODUCT_RELEASE_NAME := KFire

