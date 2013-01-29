# Camera and Gallery
PRODUCT_PACKAGES := \
        Gallery

# Live Wallpapers
PRODUCT_PACKAGES += \
        LiveWallpapers \
        LiveWallpapersPicker \
        MagicSmokeWallpapers \
        VisualizationWallpapers \
        librs_jni

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/amazon/otter/device.mk)

PRODUCT_NAME := full_otter
PRODUCT_DEVICE := otter
PRODUCT_BRAND := Amazon
PRODUCT_MODEL := Amazon Kindle Fire
