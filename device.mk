#
# Copyright (C) 2012 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL otter devices, and
# are also specific to otter devices
#
# Everything in this directory will become public

DEVICE_FOLDER := device/amazon/otter

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := $(DEVICE_FOLDER)/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif


PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi


# Hardware HALs
PRODUCT_PACKAGES += \
    lights.otter \
    power.otter \
    hwcomposer.otter \
    audio.primary.otter \
    audio.a2dp.default \
    libedid \
    libinvensense_mpl \

# Wifi
PRODUCT_PACKAGES += \
    ti_wfd_libs \
    lib_driver_cmd_wl12xx \
    dhcpcd.conf \
    hostapd.conf \
    wpa_supplicant.conf \
    calibrator \
    crda \
    regulatory.bin \

# Misc
PRODUCT_PACKAGES += \
    hwprops \
    evtest \
    libjni_pinyinime \
    make_ext4fs \
    setup_fs \
    busybox \

# Audio testing
PRODUCT_PACKAGES += \
    tinymix \
    tinyplay \
    tinycap

# Apps
PRODUCT_PACKAGES += \
    OtterParts \
    FileManager \

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    $(DEVICE_FOLDER)/root/default.prop:/root/default.prop \
    $(DEVICE_FOLDER)/root/init.omap4430.rc:/root/init.omap4430.rc \
    $(DEVICE_FOLDER)/root/init.omap4430.usb.rc:/root/init.omap4430.usb.rc \
    $(DEVICE_FOLDER)/root/ueventd.omap4430.rc:/root/ueventd.omap4430.rc \

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    $(call add-to-product-copy-files-if-exists,packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml)

# Prebuilts /system/bin
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/bin/fix-mac.sh:/system/bin/fix-mac.sh \
    $(DEVICE_FOLDER)/prebuilt/bin/strace:/system/bin/strace \

#    $(DEVICE_FOLDER)/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml \
# Prebuilts /system/etc
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/etc/audio_policy.conf:/system/etc/audio_policy.conf \
    $(DEVICE_FOLDER)/prebuilt/etc/dbus.conf:/system/etc/dbus.conf \
    $(DEVICE_FOLDER)/prebuilt/etc/gps.conf:/system/etc/gps.conf \
    $(DEVICE_FOLDER)/prebuilt/etc/hosts:/system/etc/hosts \
    $(DEVICE_FOLDER)/prebuilt/etc/media_codecs.xml:/system/etc/media_codecs.xml \
    $(DEVICE_FOLDER)/prebuilt/etc/mountd.conf:/system/etc/mountd.conf \
    $(DEVICE_FOLDER)/prebuilt/etc/vold.fstab:/system/etc/vold.fstab \
    $(DEVICE_FOLDER)/prebuilt/etc/wifi/TQS_S_2.6.ini:system/etc/wifi/TQS_S_2.6.ini \

# Prebuilt /system/usr
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/usr/idc/ilitek_i2c.idc:/system/usr/idc/ilitek_i2c.idc \
    $(DEVICE_FOLDER)/prebuilt/usr/idc/twl6030_pwrbutton.idc:/system/usr/idc/twl6030_pwrbutton.idc \
    $(DEVICE_FOLDER)/prebuilt/usr/keylayout/twl6030_pwrbutton.kl:/system/usr/keylayout/twl6030_pwrbutton.kl \
    $(DEVICE_FOLDER)/prebuilt/usr/keylayout/AVRCP.kl:/system/usr/keylayout/AVRCP.kl \

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory \

# AOSP specific
ifndef CM_BUILD

# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
    find $(DEVICE_FOLDER)/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')

# Prebuilt /system/media
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/media/bootanimation.zip:/system/media/bootanimation.zip \

else
PRODUCT_PACKAGES += \
    Superuser \
    su \

endif

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=160 \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=42m \
    dalvik.vm.heapsize=128m \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=120 \
    ro.sf.hwrotation=270 \
    ro.opengles.version=131072 \
    persist.lab126.chargeprotect=1 \
    com.ti.omap_enhancement=true \
    omap.enhancement=true \
    ro.crypto.state=unencrypted \
    persist.sys.usb.config=mass_storage,adb \
    persist.sys.root_access=3 \
    ro.hwc.legacy_api=true

PRODUCT_CHARACTERISTICS := tablet,nosdcard

DEVICE_PACKAGE_OVERLAYS := $(DEVICE_FOLDER)/overlay/aosp

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

#$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, vendor/amazon/otter/proprietary/imgtec/sgx-imgtec-bins.mk)
$(call inherit-product-if-exists, vendor/amazon/otter/otter-vendor.mk)
$(call inherit-product-if-exists, hardware/ti/omap4xxx/omap4.mk)
$(call inherit-product-if-exists, device/ti/proprietary-open/wl12xx/wlan/wl12xx-wlan-fw-products.mk)


