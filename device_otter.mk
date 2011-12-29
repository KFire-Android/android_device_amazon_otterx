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
PRODUCT_AAPT_CONFIG := normal mdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

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
#    sensors.omap4 \

PRODUCT_PACKAGES += \
    lights.omap4 \
    libinvensense_mpl \


# Audio
PRODUCT_PACKAGES += \
    audio.primary.omap4430 \
    audio_policy.omap4430 \
    libaudioutils \
    hwcomposer.default

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
    device/amazon/otter/root/init.rc:root/init.rc \
    device/amazon/otter/root/init.omap4430.rc:root/init.omap4430.rc \
    device/amazon/otter/root/init.omap4430.usb.rc:root/init.omap4430.usb.rc \
    device/amazon/otter/root/ueventd.omap4430.rc:root/ueventd.omap4430.rc

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    packages/wallpapers/LivePicker/android.software.live_wallpaper.xml:system/etc/permissions/android.software.live_wallpaper.xml 


# Prebuilts /bin
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/bin/320x240.nv12:system/bin/320x240.nv12 \
    device/amazon/otter/prebuilt/bin/battery_log.sh:system/bin/battery_log.sh \
    device/amazon/otter/prebuilt/bin/idme:system/bin/idme \
    device/amazon/otter/prebuilt/bin/rild:system/bin/rild \
    device/amazon/otter/prebuilt/bin/strace:system/bin/strace \
    device/amazon/otter/prebuilt/bin/touch_firmware.sh:system/bin/touch_firmware.sh \


# Prebuilts /system/etc
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/etc/wifi/softap/firmware_ap.bin:system/etc/wifi/softap/firmware_ap.bin \
    device/amazon/otter/prebuilt/etc/wifi/softap/tiwlan_ap.ini:system/etc/wifi/softap/tiwlan_ap.ini \
    device/amazon/otter/prebuilt/etc/wifi/firmware.bin:system/etc/wifi/firmware.bin \
    device/amazon/otter/prebuilt/etc/wifi/tiwlan.ini:system/etc/wifi/tiwlan.ini \
    device/amazon/otter/prebuilt/etc/wifi/tiwlan.ini.activemode:system/etc/wifi/tiwlan.ini.activemode \
    device/amazon/otter/prebuilt/etc/asound.conf:system/etc/asound.conf \
    device/amazon/otter/prebuilt/etc/audio_effects.conf:system/etc/audio_effects.conf \
    device/amazon/otter/prebuilt/etc/Audible.param:system/etc/Audible.param \
    device/amazon/otter/prebuilt/etc/gps.conf:system/etc/gps.conf \
    device/amazon/otter/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/amazon/otter/prebuilt/etc/vold.conf:system/etc/vold.conf \
    device/amazon/otter/prebuilt/etc/vold.fstab:system/etc/vold.fstab \


# Prebuilts /system/lib
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/lib/ducati/base_image_app_m3.xem3:system/lib/ducati/base_image_app_m3.xem3 \
    device/amazon/otter/prebuilt/lib/ducati/base_image_sys_m3.xem3:system/lib/ducati/base_image_sys_m3.xem3 \
    device/amazon/otter/prebuilt/lib/hw/sensors.omap4sdp.so:system/lib/hw/sensors.omap4sdp.so \
    device/amazon/otter/prebuilt/lib/libaudiomodemgeneric.so:system/lib/libaudiomodemgeneric.so \


# Prebuilt /system/usr
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/usr/idc/ilitek_i2c.idc:system/usr/idc/ilitek_i2c.idc \
    device/amazon/otter/prebuilt/usr/idc/omap-keypad.idc:system/usr/idc/omap-keypad.idc \
    device/amazon/otter/prebuilt/usr/keychars/qtouch-touchscreen.kcm:system/usr/keychars/qtouch-touchscreen.kcm \
    device/amazon/otter/prebuilt/usr/keychars/omap-keypad.kcm:system/usr/keychars/omap-keypad.kcm \
    device/amazon/otter/prebuilt/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/amazon/otter/prebuilt/usr/keylayout/qtouch-touchscreen.kl:system/usr/keylayout/qtouch-touchscreen.kl \
    device/amazon/otter/prebuilt/usr/keylayout/twl4030_pwrbutton.kl:system/usr/keylayout/twl4030_pwrbutton.kl \
    device/amazon/otter/prebuilt/usr/keylayout/omap-keypad.kl:system/usr/keylayout/omap-keypad.kl \

# Prebuilt /system/usr/share/alsa
PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/usr/share/alsa/alsa.conf:system/usr/share/alsa/alsa.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
    device/amazon/otter/prebuilt/usr/share/alsa/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf \

# Graphics
#    device/amazon/otter/prebuilt/imgtec/gralloc.omap4.so:system/vendor/lib/hw/gralloc.omap4.so \
#    device/amazon/otter/prebuilt/imgtec/libEGL_POWERVR_SGX540_120.so:system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so \
#    device/amazon/otter/prebuilt/imgtec/libGLESv1_CM_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
#    device/amazon/otter/prebuilt/imgtec/libGLESv2_POWERVR_SGX540_120.so:system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so \
#    device/amazon/otter/prebuilt/imgtec/libglslcompiler.so:system/vendor/lib/libglslcompiler.so \
#    device/amazon/otter/prebuilt/imgtec/libIMGegl.so:system/vendor/lib/libIMGegl.so \
#    device/amazon/otter/prebuilt/imgtec/libpvr2d.so:system/vendor/lib/libpvr2d.so \
#    device/amazon/otter/prebuilt/imgtec/libpvrANDROID_WSEGL.so:system/vendor/lib/libpvrANDROID_WSEGL.so \
#    device/amazon/otter/prebuilt/imgtec/libPVRScopeServices.so:system/vendor/lib/libPVRScopeServices.so \
#    device/amazon/otter/prebuilt/imgtec/libsrv_init.so:system/vendor/lib/libsrv_init.so \
#    device/amazon/otter/prebuilt/imgtec/libsrv_um.so:system/vendor/lib/libsrv_um.so \
#    device/amazon/otter/prebuilt/imgtec/libusc.so:system/vendor/lib/libusc.so \
#    device/amazon/otter/prebuilt/imgtec/pvrsrvinit:system/vendor/bin/pvrsrvinit \
#    device/amazon/otter/prebuilt/imgtec/pvrsrvctl:system/vendor/bin/pvrsrvctl \
#    device/amazon/otter/prebuilt/imgtec/framebuffer_test:system/vendor/bin/framebuffer_test \
#    device/amazon/otter/prebuilt/imgtec/hal_client_test:system/vendor/bin/hal_client_test \
#    device/amazon/otter/prebuilt/imgtec/services_test:system/vendor/bin/services_test \
#    device/amazon/otter/prebuilt/imgtec/sgx_flip_test:system/vendor/bin/sgx_flip_test \
#    device/amazon/otter/prebuilt/imgtec/sgx_init_test:system/vendor/bin/sgx_init_test \
#    device/amazon/otter/prebuilt/imgtec/sgx_render_flip_test:system/vendor/bin/sgx_render_flip_test \
#    device/amazon/otter/prebuilt/imgtec/testwrap:system/vendor/bin/testwrap \
#    device/amazon/otter/prebuilt/imgtec/texture_benchmark:system/vendor/bin/texture_benchmark \

PRODUCT_COPY_FILES += \
    device/amazon/otter/prebuilt/imgtec/gralloc.omap4.so.1.1.17.4403:system/vendor/lib/hw/gralloc.omap4.so \
    device/amazon/otter/prebuilt/imgtec/libEGL_POWERVR_SGX540_120.so.1.1.17.4403:system/vendor/lib/egl/libEGL_POWERVR_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libGLESv1_CM_POWERVR_SGX540_120.so.1.1.17.4403:system/vendor/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libGLESv2_POWERVR_SGX540_120.so.1.1.17.4403:system/vendor/lib/egl/libGLESv2_POWERVR_SGX540_120.so \
    device/amazon/otter/prebuilt/imgtec/libglslcompiler.so.1.1.17.4403:system/vendor/lib/libglslcompiler.so \
    device/amazon/otter/prebuilt/imgtec/libIMGegl.so.1.1.17.4403:system/vendor/lib/libIMGegl.so \
    device/amazon/otter/prebuilt/imgtec/libpvr2d.so.1.1.17.4403:system/vendor/lib/libpvr2d.so \
    device/amazon/otter/prebuilt/imgtec/libpvrANDROID_WSEGL.so.1.1.17.4403:system/vendor/lib/libpvrANDROID_WSEGL.so \
    device/amazon/otter/prebuilt/imgtec/libPVRScopeServices.so.1.1.17.4403:system/vendor/lib/libPVRScopeServices.so \
    device/amazon/otter/prebuilt/imgtec/libsrv_init.so.1.1.17.4403:system/vendor/lib/libsrv_init.so \
    device/amazon/otter/prebuilt/imgtec/libsrv_um.so.1.1.17.4403:system/vendor/lib/libsrv_um.so \
    device/amazon/otter/prebuilt/imgtec/libusc.so.1.1.17.4403:system/vendor/lib/libusc.so \
    device/amazon/otter/prebuilt/imgtec/pvrsrvinit:system/vendor/bin/pvrsrvinit \

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

