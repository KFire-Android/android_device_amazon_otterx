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
    hwcomposer.otter \
    lights.otter \
    power.otter \
    audio.primary.otter \
    audio.a2dp.default \

# Wifi
PRODUCT_PACKAGES += \
    dhcpcd.conf \
    wpa_supplicant.conf \
    calibrator \
    crda \
    regulatory.bin \
    lib_driver_cmd_wl12xx \

# Misc
PRODUCT_PACKAGES += \
    evtest \
    libjni_pinyinime

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
    $(DEVICE_FOLDER)/prebuilt/bin/bbx:/system/bin/bbx \
    $(DEVICE_FOLDER)/prebuilt/bin/battery_log.sh:system/bin/battery_log.sh \
    $(DEVICE_FOLDER)/prebuilt/bin/idme:system/bin/idme \
    $(DEVICE_FOLDER)/prebuilt/bin/klog.sh:system/bin/klog.sh \
    $(DEVICE_FOLDER)/prebuilt/bin/temperature_log.sh:system/bin/temperature_log.sh \

# Prebuilt /system/etc/firmware
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/firmware/ducati-m3.512MB.bin:system/etc/firmware/ducati-m3.512MB.bin \
    $(DEVICE_FOLDER)/firmware/ti-connectivity/wl127x-fw-4-mr.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-mr.bin \
    $(DEVICE_FOLDER)/firmware/ti-connectivity/wl127x-fw-4-plt.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-plt.bin \
    $(DEVICE_FOLDER)/firmware/ti-connectivity/wl127x-fw-4-sr.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-sr.bin \
    $(DEVICE_FOLDER)/firmware/ti-connectivity/wl1271-nvs_127x.bin:system/etc/firmware/ti-connectivity/wl1271-nvs_127x.bin \

# Prebuilts /system/etc
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/etc/audio_policy.conf:/system/etc/audio_policy.conf \
    $(DEVICE_FOLDER)/prebuilt/etc/media_codecs.xml:/system/etc/media_codecs.xml \
    $(DEVICE_FOLDER)/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml \
    $(DEVICE_FOLDER)/prebuilt/etc/mountd.conf:/system/etc/mountd.conf \
    $(DEVICE_FOLDER)/prebuilt/etc/vold.fstab:/system/etc/vold.fstab \
    $(DEVICE_FOLDER)/prebuilt/etc/wifi/TQS_S_2.6.ini:system/etc/wifi/TQS_S_2.6.ini \

# Prebuilt /system/usr
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/usr/idc/ilitek_i2c.idc:/system/usr/idc/ilitek_i2c.idc \
    $(DEVICE_FOLDER)/prebuilt/usr/idc/twl6030_pwrbutton.idc:/system/usr/idc/twl6030_pwrbutton.idc \
    $(DEVICE_FOLDER)/prebuilt/usr/keylayout/twl6030_pwrbutton.kl:/system/usr/keylayout/twl6030_pwrbutton.kl \
    $(DEVICE_FOLDER)/prebuilt/usr/keylayout/AVRCP.kl:/system/usr/keylayout/AVRCP.kl \

# Prebuilt /system/lib
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/lib/libidme.so:system/lib/libidme.so \
    $(DEVICE_FOLDER)/prebuilt/lib/sensors.otter.so:system/lib/hw/sensors.otter.so \

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory \
    Superuser \
    su

# AOSP specific
ifeq ($(TARGET_PRODUCT),full_otter)
# Prebuilt /system/media
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/media/bootanimation.zip:/system/media/bootanimation.zip
endif

PRODUCT_PROPERTY_OVERRIDES := \
    ro.sf.lcd_density=160 \
    dalvik.vm.heapstartsize=5m \
    dalvik.vm.heapgrowthlimit=42m \
    dalvik.vm.heapsize=128m \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=120 \
    ro.opengles.version=131072 \
    persist.lab126.chargeprotect=1 \
    com.ti.omap_enhancement=true \
    omap.enhancement=true \
    ro.crypto.state=unencrypted \
    persist.sys.usb.config=mtp,adb \
    persist.sys.root_access=3 \
    ro.sf.hwrotation=270 \

PRODUCT_CHARACTERISTICS := tablet,nosdcard

DEVICE_PACKAGE_OVERLAYS := $(DEVICE_FOLDER)/overlay/aosp

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

PRODUCT_PACKAGES += \
	libdomx \
	libOMX_Core \
	libOMX.TI.DUCATI1.VIDEO.H264E \
	libOMX.TI.DUCATI1.VIDEO.MPEG4E \
	libOMX.TI.DUCATI1.VIDEO.DECODER \
	libOMX.TI.DUCATI1.VIDEO.DECODER.secure \
	libOMX.TI.DUCATI1.VIDEO.CAMERA \
	libOMX.TI.DUCATI1.MISC.SAMPLE \
	libstagefrighthw \
        libI420colorconvert \
	libtiutils \
	libcamera \
	libion_ti \
	libomxcameraadapter \
	smc_pa_ctrl \
	tf_daemon \
	libtf_crypto_sst

#	hwcomposer.omap4 \
#	camera.omap4 \

$(call inherit-product-if-exists, device/amazon/otter/imgtec/sgx-imgtec-bins.mk)

