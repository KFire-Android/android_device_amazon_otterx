#
# Copyright (C) 2011 The Android Open-Source Project
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

$(call inherit-product-if-exists, vendor/cm/config/common_full_tablet_wifionly.mk.mk)
$(call inherit-product-if-exists, vendor/amazon/otter/otter-vendor.mk)

DEVICE_PACKAGE_OVERLAYS := device/amazon/otter/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

PRODUCT_PACKAGES := \
    charger \
    charger_res_images

# Hardware HALs
PRODUCT_PACKAGES += \
    lights.omap4 \
    libinvensense_mpl \
    hwcomposer.omap4 \


#    audio_policy.omap4430
# Audio
PRODUCT_PACKAGES += \
    libaudioutils \
    audio.a2dp.default \
    libaudiohw_legacy \
    audio.primary.omap4430 \
    audio_policy.default

# Audio
PRODUCT_COPY_FILES += \
    device/amazon/otter/audio/alsa.omap4.so:/system/lib/hw/alsa.omap4.so \
    device/amazon/otter/audio/libasound.so:/system/lib/libasound.so \
    device/amazon/otter/audio/libaudio.so:/system/lib/libaudio.so \
    device/amazon/otter/audio/libaudiomodemgeneric.so:/system/lib/libaudiomodemgeneric.so \
    device/amazon/otter/audio/libaudiopolicy.so:/system/lib/libaudiopolicy.so \

# Bluetooth configuration
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf

# Wifi
PRODUCT_PACKAGES += \
    libCustomWifi \
    wlan_loader \
    wlan_cu \
    dhcpcd.conf \
    wpa_supplicant.conf


# HotSpot
PRODUCT_PACKAGES += \
    tiap_loader \
    tiap_cu \
    hostap \
    hostapd.conf


# Tests -- Can remove later
PRODUCT_PACKAGES += \
    d2c_test \
    memmgr_test \
    utils_test \
    tiler_ptest \
    overlay_test \
    omx_tests \
    evtest


PRODUCT_PACKAGES += \
    Superuser \
    su \
    CMSettings \
    CMStats \
    hwprops \


PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory \
    libjni_pinyinime \

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    persist.sys.usb.config=mtp


# Root
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/amazon/otter/root/default.prop:/root/default.prop \
    device/amazon/otter/root/init.rc:/root/init.rc \
    device/amazon/otter/root/init.omap4430.rc:/root/init.omap4430.rc \
    device/amazon/otter/root/init.omap4430.usb.rc:/root/init.omap4430.usb.rc \
    device/amazon/otter/root/ueventd.omap4430.rc:/root/ueventd.omap4430.rc \
    device/amazon/otter/root/ueventd.rc:/root/ueventd.rc


#   frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:/system/etc/permissions/android.hardware.sensor.accelerometer.xml \
# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    device/amazon/otter/root/tablet_core_hardware.xml:/system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:/system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:/system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:/system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:/system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:/system/etc/permissions/android.software.live_wallpaper.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml


# Prebuilts /bin
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/bin/rild:/system/bin/rild \
    device/amazon/otter/prebuilt/bin/strace:/system/bin/strace \


# Prebuilts /system/app
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/app/FileManager.apk:/system/app/FileManager.apk \


# Prebuilts /system/etc
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/etc/gps.conf:/system/etc/gps.conf \
    device/amazon/otter/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml \
    device/amazon/otter/prebuilt/etc/vold.conf:/system/etc/vold.conf \
    device/amazon/otter/prebuilt/etc/vold.fstab:/system/etc/vold.fstab \


# Prebuilt /system/media
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/media/bootanimation.zip:/system/media/bootanimation.zip \


# Prebuilt /system/usr
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/usr/idc/ilitek_i2c.idc:/system/usr/idc/ilitek_i2c.idc \
    device/amazon/otter/prebuilt/usr/keylayout/twl4030_pwrbutton.kl:/system/usr/keylayout/twl4030_pwrbutton.kl \
    device/amazon/otter/prebuilt/usr/idc/omap-keypad.idc:/system/usr/idc/omap-keypad.idc \
    device/amazon/otter/prebuilt/usr/keychars/qtouch-touchscreen.kcm:/system/usr/keychars/qtouch-touchscreen.kcm \
    device/amazon/otter/prebuilt/usr/keychars/omap-keypad.kcm:/system/usr/keychars/omap-keypad.kcm \
    device/amazon/otter/prebuilt/usr/keylayout/AVRCP.kl:/system/usr/keylayout/AVRCP.kl \
    device/amazon/otter/prebuilt/usr/keylayout/qtouch-touchscreen.kl:/system/usr/keylayout/qtouch-touchscreen.kl \
    device/amazon/otter/prebuilt/usr/keylayout/omap-keypad.kl:/system/usr/keylayout/omap-keypad.kl \

#    device/amazon/otter/prebuilt/imgtec/pvrsrvctl:system/bin/pvrsrvctl \
# Graphics
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/imgtec/gralloc.omap4.so:/system/vendor/lib/hw/gralloc.omap4.so \
    device/amazon/otter/prebuilt/imgtec/libEGL_POWERVR_SGX540_120.so:/system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libGLESv1_CM_POWERVR_SGX540_120.so:/system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libGLESv2_POWERVR_SGX540_120.so:/system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libglslcompiler.so:/system/vendor/lib/libglslcompiler.so \
    device/amazon/otter/prebuilt/imgtec/libIMGegl.so:/system/vendor/lib/libIMGegl.so \
    device/amazon/otter/prebuilt/imgtec/libpvr2d.so:/system/vendor/lib/libpvr2d.so \
    device/amazon/otter/prebuilt/imgtec/libpvrANDROID_WSEGL.so:/system/vendor/lib/libpvrANDROID_WSEGL.so \
    device/amazon/otter/prebuilt/imgtec/libPVRScopeServices.so:/system/vendor/lib/libPVRScopeServices.so \
    device/amazon/otter/prebuilt/imgtec/libsrv_init.so:/system/vendor/lib/libsrv_init.so \
    device/amazon/otter/prebuilt/imgtec/libsrv_um.so:/system/vendor/lib/libsrv_um.so \
    device/amazon/otter/prebuilt/imgtec/libusc.so:/system/vendor/lib/libusc.so \
    device/amazon/otter/prebuilt/imgtec/pvrsrvinit:/system/bin/pvrsrvinit \

FRAMEWORKS_BASE_SUBDIRS += \
    $(addsuffix /java, omapmmlib)

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# still need to set english for audio init
PRODUCT_LOCALES += en_US

# copy all kernel modules under the "modules" directory to system/lib/modules
PRODUCT_COPY_FILES += $(shell \
    find device/amazon/otter/modules -name '*.ko' \
    | sed -r 's/^\/?(.*\/)([^/ ]+)$$/\1\2:system\/lib\/modules\/\2/' \
    | tr '\n' ' ')


PRODUCT_CHARACTERISTICS := tablet

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs


PRODUCT_PACKAGES += \
	dhcpcd.conf \
	TQS_D_1.7.ini \
	calibrator


# for bugmailer
ifneq ($(TARGET_BUILD_VARIANT),user)
	PRODUCT_PACKAGES += send_bug
	PRODUCT_COPY_FILES += \
		system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
		system/extras/bugmailer/send_bug:system/bin/send_bug
endif

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product, hardware/ti/omap4xxx/omap4.mk)
$(call inherit-product, hardware/ti/wpan/ti-wpan-products.mk)

$(call inherit-product, build/target/product/full_base.mk)

