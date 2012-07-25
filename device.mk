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
    audio.primary.omap4430 \
    audio_policy.default \
    audio.usb.default \
    libaudioutils \
    libwvm \

# Wifi
PRODUCT_PACKAGES += \
    lib_driver_cmd_wl12xx \
    dhcpcd.conf \
    wpa_supplicant.conf \

# Sound
PRODUCT_PACKAGES += \
    tinyplay \
    tinymix \
    tinycap \

# Misc
PRODUCT_PACKAGES += \
    hwprops \
    evtest \
    librs_jni \
    com.android.future.usb.accessory \
    libjni_pinyinime \
    make_ext4fs \
    setup_fs \
    dhcpcd.conf \
    calibrator \
    busybox \
    su \
    parse_hdmi_edid \

# Apps
PRODUCT_PACKAGES += \
    OtterParts \
    Superuser \
    Term \
    FileManager \


# Root
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/amazon/otter/root/default.prop:/root/default.prop \
    device/amazon/otter/root/init.rc:/root/init.rc \
    device/amazon/otter/root/init.usb.rc:/root/init.usb.rc \
    device/amazon/otter/root/init.omap4430.rc:/root/init.omap4430.rc \
    device/amazon/otter/root/ueventd.rc:/root/ueventd.rc \
    device/amazon/otter/root/ueventd.omap4430.rc:/root/ueventd.omap4430.rc \
    device/amazon/otter/root/omaplfb_sgx540_120.ko:/root/modules/omaplfb_sgx540_120.ko \
    device/amazon/otter/root/pvrsrvkm_sgx540_120.ko:/root/modules/pvrsrvkm_sgx540_120.ko \

# Permissions
#    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
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
    device/amazon/otter/prebuilt/bin/fix-mac.sh:/system/bin/fix-mac.sh \
    device/amazon/otter/prebuilt/bin/strace:/system/bin/strace \
    device/amazon/otter/prebuilt/bin/su:/system/xbin/su \

# Prebuilts /system/etc
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/etc/audio_policy.conf:/system/etc/audio_policy.conf \
    device/amazon/otter/prebuilt/etc/dbus.conf:/system/etc/dbus.conf \
    device/amazon/otter/prebuilt/etc/gps.conf:/system/etc/gps.conf \
    device/amazon/otter/prebuilt/etc/hosts:/system/etc/hosts \
    device/amazon/otter/prebuilt/etc/media_codecs.xml:/system/etc/media_codecs.xml \
    device/amazon/otter/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml \
    device/amazon/otter/prebuilt/etc/mountd.conf:/system/etc/mountd.conf \
    device/amazon/otter/prebuilt/etc/vold.fstab:/system/etc/vold.fstab \
    device/amazon/otter/prebuilt/etc/firmware/ducati-m3.512MB.bin:/system/etc/firmware/ducati-m3.512MB.bin \
    device/amazon/otter/prebuilt/etc/firmware/ti-connectivity/wl127x-fw-4-mr.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-mr.bin \
    device/amazon/otter/prebuilt/etc/firmware/ti-connectivity/wl127x-fw-4-plt.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-plt.bin \
    device/amazon/otter/prebuilt/etc/firmware/ti-connectivity/wl127x-fw-4-sr.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-sr.bin \
    device/amazon/otter/prebuilt/etc/firmware/ti-connectivity/wl1271-nvs_127x.bin:system/etc/firmware/ti-connectivity/wl1271-nvs.bin.orig \
    device/amazon/otter/prebuilt/etc/wifi/TQS_S_2.6.ini:system/etc/wifi/TQS_S_2.6.ini \

# Prebuilts /system/lib
#    device/amazon/otter/prebuilt/lib/libion.so:/system/lib/libion.so \
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/lib/libjackpal-androidterm4.so:/system/lib/libjackpal-androidterm4.so \

# Prebuilt /system/media
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/media/bootanimation.zip:/system/media/bootanimation.zip \

# Prebuilt /system/usr
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/usr/idc/ilitek_i2c.idc:/system/usr/idc/ilitek_i2c.idc \
    device/amazon/otter/prebuilt/usr/idc/twl6030_pwrbutton.idc:/system/usr/idc/twl6030_pwrbutton.idc \
    device/amazon/otter/prebuilt/usr/keylayout/twl6030_pwrbutton.kl:/system/usr/keylayout/twl6030_pwrbutton.kl \
    device/amazon/otter/prebuilt/usr/keylayout/AVRCP.kl:/system/usr/keylayout/AVRCP.kl \


PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=160 \
    dalvik.vm.heapsize=64m \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=120 \
    ro.sf.hwrotation=270 \
    ro.opengles.version=131072 \
    persist.lab126.chargeprotect=1 \
    com.ti.omap_enhancement=true \
    omap.enhancement=true \
    persist.sys.usb.config=mass_storage,adb


PRODUCT_CHARACTERISTICS := tablet,nosdcard

DEVICE_PACKAGE_OVERLAYS := device/amazon/otter/overlay/aosp

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise


# Kernel Modules are now built dyanamically using the CM build system

# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
    find device/amazon/otter/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')


$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/amazon/otter/otter-vendor.mk)
$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)


