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

DEVICE_PACKAGE_OVERLAYS := device/amazon/otter/overlay

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_PACKAGES := \
    charger \
    charger_res_images


# Audio
PRODUCT_COPY_FILES += \
    device/amazon/otter/audio/alsa.omap4.so:/system/lib/hw/alsa.omap4.so \
    device/amazon/otter/audio/libasound.so:/system/lib/libasound.so \
    device/amazon/otter/audio/libaudio.so:/system/lib/libaudio.so \
    device/amazon/otter/audio/libaudiopolicy.so:/system/lib/libaudiopolicy.so \


# Hardware HALs
PRODUCT_PACKAGES := \
    lights.otter \
    sensors.otter \
    libinvensense_mpl


# Audio
PRODUCT_PACKAGES += \
    audio.primary.omap4430 \
    audio_policy.omap4430 \
    libaudioutils


# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.le.conf:system/etc/bluetooth/main.conf


# Syslink and Tiler
PRODUCT_PACKAGES += \
    syslink_daemon.out \
    syslink_tilertest.out \
    syslink_trace_daemon.out \
    libipc \
    libipcutils \
    librcm \
    libsysmgr \
    libnotify \
    libd2cmap \
    libtimemmgr


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
    su


PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory \
    libjni_pinyinime \


# Root
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/amazon/otter/root/init.omap4430.rc:root/init.omap4430.rc \
    device/amazon/otter/root/init.omap4430.usb.rc:root/init.omap4430.usb.rc \
    device/amazon/otter/root/ueventd.omap4430.rc:root/ueventd.omap4430.rc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml 


# Prebuilts
#    device/amazon/otter/etc/media_profiles.xml:system/etc/media_profiles.xml \
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/bin/strace:system/bin/strace \
    device/amazon/otter/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    device/amazon/otter/usr/idc/ilitek_i2c.idc:system/usr/idc/ilitek_i2c.idc \
    device/amazon/otter/prebuilt/usr/keychars/qtouch-touchscreen.kcm:system/usr/keychars/qtouch-touchscreen.kcm \
    device/amazon/otter/prebuilt/usr/keylayout/qtouch-touchscreen.kl:system/usr/keylayout/qtouch-touchscreen.kl \
    device/amazon/otter/usr/keylayout/twl4030_pwrbutton.kl:system/usr/keylayout/twl4030_pwrbutton.kl 


# Graphics
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/imgtec/gralloc.omap4.1.1.17.4403.so:system/vendor/lib/hw/gralloc.omap4.so \
    device/amazon/otter/prebuilt/imgtec/pvrsrvinit:system/bin/pvrsrvinit \
    device/amazon/otter/prebuilt/imgtec/libEGL_POWERVR_SGX540_120.1.1.17.4403.so:system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libGLESv1_CM_POWERVR_SGX540_120.1.1.17.4403.so:system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libGLESv2_POWERVR_SGX540_120.1.1.17.4403.so:system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libglslcompiler.1.1.17.4403.so:system/vendor/lib/libglslcompiler.so \
    device/amazon/otter/prebuilt/imgtec/libIMGegl.1.1.17.4403.so:system/vendor/lib/libIMGegl.so \
    device/amazon/otter/prebuilt/imgtec/libpvr2d.1.1.17.4403.so:system/vendor/lib/libpvr2d.so \
    device/amazon/otter/prebuilt/imgtec/libpvrANDROID_WSEGL.1.1.17.4403.so:system/vendor/lib/libpvrANDROID_WSEGL.so \
    device/amazon/otter/prebuilt/imgtec/libPVRScopeServices.1.1.17.4403.so:system/vendor/lib/libPVRScopeServices.so \
    device/amazon/otter/prebuilt/imgtec/libsrv_init.1.1.17.4403.so:system/vendor/lib/libsrv_init.so \
    device/amazon/otter/prebuilt/imgtec/libsrv_um.1.1.17.4403.so:system/vendor/lib/libsrv_um.so \
    device/amazon/otter/prebuilt/imgtec/libusc.so.1.1.17.4403:system/vendor/lib/libusc.so \

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


PRODUCT_CHARACTERISTICS := nosdcard tablet

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
$(call inherit-product-if-exists, vendor/google/google-vendor.mk)

$(call inherit-product-if-exists, vendor/amazon/otter-vendor.mk)
$(call inherit-product-if-exists, vendor/cm/config/common_full_tablet_wifionly.mk.mk)

$(call inherit-product, build/target/product/full_base.mk)

