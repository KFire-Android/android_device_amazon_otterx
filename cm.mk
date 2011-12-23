# Inherit device configuration for Kindle Fire
$(call inherit-product, device/amazon/otter/full_otter.mk)

# Inherit some common cyanogenmod stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit some common CM stuff.
#$(call inherit-product, vendor/cm/config/gsm.mk)

#
# Setup device specific product configuration.
#
PRODUCT_NAME := cm_otter
PRODUCT_BRAND := Android
PRODUCT_DEVICE := otter
PRODUCT_MODEL := otter
PRODUCT_MANUFACTURER := Amazon
PRODUCT_SFX := ics

# Release name and versioning
PRODUCT_RELEASE_NAME := KFire

UTC_DATE := $(shell date +%s)
DATE := $(shell date +%Y%m%d)

PRODUCT_BUILD_PROP_OVERRIDES += \
   BUILD_ID=6.2.1_G1011999 \
   PRODUCT_NAME=${PRODUCT_DEVICE}_${PRODUCT_SFX} \
   BUILD_NUMBER=${DATE} \
   TARGET_DEVICE=amz_otter \
   BUILD_DISPLAY_ID=6.2.1_G1011999 \
   BUILD_FINGERPRINT=amazon/otter_ics/amz_otter:4.0.3/6.2.1_G10111999/${BUILD_NUMBER}:user/release-keys \
   PRIVATE_BUILD_DESC="amz_otter-user 4.0.3 6.2.1_G10111999 "${BUILD_NUMBER}" release-keys" \
   PRODUCT_BRAND=verizon \
   BUILD_UTC_DATE= \
   TARGET_BUILD_TYPE=user \
   BUILD_VERSION_TAGS=release-keys \
   USER=hashcode \
   BUILD_HOST=hashcode-unn \
   PRODUCT_DEFAULT_LANGUAGE=en \
   PRODUCT_DEFAULT_REGION=US \


