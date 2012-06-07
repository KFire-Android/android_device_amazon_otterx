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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/amazon/otter/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif


PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Hardware HALs
PRODUCT_PACKAGES += \
    lights.otter \
    libinvensense_mpl \
    hwcomposer.default \
    parse_hdmi_edid \
    libedid \
    hwcomposer.otter \
    audio.primary.omap4430 \
    audio_policy.default \
    libaudioutils \


# Wifi
PRODUCT_PACKAGES += \
    lib_driver_cmd_wl12xx \
    wlan_loader \
    wlan_cu \
    dhcpcd.conf \
    wpa_supplicant.conf \

# Misc
PRODUCT_PACKAGES += \
    Superuser \
    su \
    hwprops \
    evtest \
    librs_jni \
    com.android.future.usb.accessory \
    libjni_pinyinime \
    make_ext4fs \
    setup_fs \
    dhcpcd.conf \
    calibrator \
    iontest


# Root
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/amazon/otter/root/default.prop:/root/default.prop \
    device/amazon/otter/root/init.rc:/root/init.rc \
    device/amazon/otter/root/init.omap4430.rc:/root/init.omap4430.rc \
    device/amazon/otter/root/init.omap4430.usb.rc:/root/init.omap4430.usb.rc \
    device/amazon/otter/root/ueventd.omap4430.rc:/root/ueventd.omap4430.rc \
    device/amazon/otter/root/ueventd.rc:/root/ueventd.rc \
    device/amazon/otter/root/omaplfb_sgx540_120.ko:/root/modules/omaplfb_sgx540_120.ko \
    device/amazon/otter/root/pvrsrvkm_sgx540_120.ko:/root/modules/pvrsrvkm_sgx540_120.ko \


# These are the hardware-specific features we actually have
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/tablet_core_hardware.xml:/system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:/system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:/system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:/system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:/system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml

#Permissions for hardware we don't have
#but too many market apps require them even though they have no reason to
#why does Facebook REQUIRE fullblown GPS for example?
#95%+ of that app's functionality has zero need for location services
#and wifi netloc is enough for nearly all of the remainder
PRODUCT_COPY_FILES +=\
    frameworks/base/data/etc/android.hardware.location.gps.xml:/system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:/system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.camera.xml:/system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:/system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:/system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:/system/etc/permissions/android.hardware.camera.flash-autofocus.xml


PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=160 \
    dalvik.vm.heapsize=64m \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=120 \
    ro.sf.hwrotation=270 \
    ro.opengles.version=131072 \
    persist.lab126.chargeprotect=1 \
    com.ti.omap_enhancement=true \
    omap.enhancement=true


PRODUCT_CHARACTERISTICS := tablet,nosdcard

DEVICE_PACKAGE_OVERLAYS := device/amazon/otter/overlay

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


# Kernel Modules are now built dyanamically using the CM build system

# copy all kernel modules under the "modules" directory to system/lib/modules
#PRODUCT_COPY_FILES += $(shell \
#    find device/amazon/otter/modules -name '*.ko' \
#    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
#    | tr '\n' ' ')


$(call inherit-product-if-exists, vendor/amazon/otter/otter-vendor.mk)
#$(call inherit-product, frameworks/base/build/tablet-dalvik-heap.mk)
$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)


