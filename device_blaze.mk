$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/amazon/blaze/blaze-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/amazon/blaze/overlay

PRODUCT_COPY_FILES += \
    device/amazon/blaze/root/init.omap4430.rc:root/init.omap4430.rc \
    device/amazon/blaze/root/ueventd.omap4430.rc:root/ueventd.omap4430.rc \
    device/amazon/blaze/root/ueventd.rc:root/ueventd.rc \
    device/amazon/blaze/root/init.rc:root/init.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/misc/vold.fstab:system/etc/vold.fstab

# Media Profile
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/misc/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_LOCALES += mdpi

# Place permission files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    device/amazon/blaze/misc/TICameraCameraProperties.xml:system/etc/TICameraCameraProperties.xml \


# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
    librs_jni \
    hwcomposer.omap4 \
    ti_omap4_ducati_bins \
    libtimemmgr \
    CameraOMAP4 \
    Camera \
    camera_test \
    tiwlan.ini \
    wlan_cu \
    wlan_loader \
    libCustomWifi \
    alsa.omap4 \
    wpa_supplicant.conf \
    dhcpcd.conf \
    hwcomposer.default \
    hwcomposer.omap4 \
    Usb \
    boardidentity \
    libboardidentity \
    libboard_idJNI \
    Board_id \

PRODUCT_PACKAGES := \
    ti_omap4_ducati_bins \
    libOMX_Core \
    libOMX.TI.DUCATI1.VIDEO.DECODER \

PRODUCT_PROPERTY_OVERRIDES += \
	ro.opengles.version=131072

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/amazon/blaze/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

# Set property overrides
PRODUCT_PROPERTY_OVERRIDES += \
keyguard.no_require_sim=true \
ro.com.android.dateformat=MM-dd-yyyy \
ro.com.android.dataroaming=true \
ro.ril.hsxpa=1 \
ro.ril.gprsclass=10 \
ro.config.notification_sound=ro.config.alarm_alert=Alarm_Classic.ogg \
net.bt.name=Android \
dalvik.vm.stack-trace-file=/data/anr/traces.txt \
ro.opengles.version=131072 \
net.dns1=8.8.8.8 \
net.dns2=8.8.4.4 \
hwui.render_dirty_regions=false \

$(call inherit-product, build/target/product/full_base.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := cm_blaze
PRODUCT_DEVICE := blaze

$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
$(call inherit-product-if-exists, vendor/cm/config/common_full_tablet_wifionly.mk)