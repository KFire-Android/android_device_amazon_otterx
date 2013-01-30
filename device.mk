DEVICE_FOLDER := device/amazon/otter

$(call inherit-product, device/amazon/otter-common/common.mk)

# Device overlay
DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay

# Hardware HALs
PRODUCT_PACKAGES += \
    hwcomposer.otter \
    lights.otter \
    power.otter \
    audio.primary.otter \

# Rootfs
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/init.omap4430.rc:/root/init.omap4430.rc

# Prebuilts /system/bin
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/bin/fix-mac.sh:/system/bin/fix-mac.sh \
    $(DEVICE_FOLDER)/prebuilt/bin/idme:system/bin/idme

# Prebuilts /system/etc
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/etc/mixer_paths.xml:/system/etc/mixer_paths.xml \
    $(DEVICE_FOLDER)/prebuilt/etc/mountd.conf:/system/etc/mountd.conf \
    $(DEVICE_FOLDER)/prebuilt/etc/vold.fstab:/system/etc/vold.fstab

# Prebuilt /system/lib
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/lib/libidme.so:system/lib/libidme.so \
    $(DEVICE_FOLDER)/prebuilt/lib/sensors.otter.so:system/lib/hw/sensors.otter.so

# Recovery /sbin/
#PRODUCT_COPY_FILES += \
#    $(DEVICE_FOLDER)/prebuilt/lib/libidme.so:$(TARGET_RECOVERY_OUT)/root/sbin/libidme.so \
#    $(DEVICE_FOLDER)/recovery/idme:$(TARGET_RECOVERY_OUT)/root/sbin/idme \

