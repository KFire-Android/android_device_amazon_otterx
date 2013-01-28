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

DEVICE_FOLDER := device/amazon/otter
COMMON_FOLDER := device/amazon/omap4-common

$(call inherit-product, $(COMMON_FOLDER)/common.mk)

PRODUCT_AAPT_CONFIG := normal mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi


# Hardware HALs
PRODUCT_PACKAGES += \
    hwcomposer.otter \
    lights.otter \
    power.otter \
    audio.primary.otter \

# Wifi
PRODUCT_PACKAGES += \
    calibrator \
    crda \
    regulatory.bin \
    lib_driver_cmd_wl12xx \

# Rootfs
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/root/init.omap4430.rc:/root/init.omap4430.rc \
    $(DEVICE_FOLDER)/root/init.omap4430.usb.rc:/root/init.omap4430.usb.rc \
    $(DEVICE_FOLDER)/root/ueventd.omap4430.rc:/root/ueventd.omap4430.rc \

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \

# Prebuilts /system/bin
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/bin/fix-mac.sh:/system/bin/fix-mac.sh \
    $(DEVICE_FOLDER)/prebuilt/bin/bbx:/system/bin/bbx \
    $(DEVICE_FOLDER)/prebuilt/bin/battery_log.sh:system/bin/battery_log.sh \
    $(DEVICE_FOLDER)/prebuilt/bin/idme:system/bin/idme \
    $(DEVICE_FOLDER)/prebuilt/bin/klog.sh:system/bin/klog.sh \
    $(DEVICE_FOLDER)/prebuilt/bin/temperature_log.sh:system/bin/temperature_log.sh \

# Prebuilt /system/etc/firmware
PRODUCT_COPY_FILES += \
    $(COMMON_FOLDER)/firmware/ducati-m3.512MB.bin:system/etc/firmware/ducati-m3.512MB.bin \
    $(COMMON_FOLDER)/firmware/ti-connectivity/wl127x-fw-4-mr.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-mr.bin \
    $(COMMON_FOLDER)/firmware/ti-connectivity/wl127x-fw-4-plt.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-plt.bin \
    $(COMMON_FOLDER)/firmware/ti-connectivity/wl127x-fw-4-sr.bin:system/etc/firmware/ti-connectivity/wl127x-fw-4-sr.bin \
    $(COMMON_FOLDER)/firmware/ti-connectivity/wl1271-nvs_127x.bin:system/etc/firmware/ti-connectivity/wl1271-nvs_127x.bin \

# Prebuilts /system/etc
PRODUCT_COPY_FILES += \
    $(DEVICE_FOLDER)/prebuilt/etc/audio_policy.conf:/system/etc/audio_policy.conf \
    $(DEVICE_FOLDER)/prebuilt/etc/media_codecs.xml:/system/etc/media_codecs.xml \
    $(DEVICE_FOLDER)/prebuilt/etc/media_profiles.xml:/system/etc/media_profiles.xml \
    $(DEVICE_FOLDER)/prebuilt/etc/mountd.conf:/system/etc/mountd.conf \
    $(DEVICE_FOLDER)/prebuilt/etc/vold.fstab:/system/etc/vold.fstab \
    $(DEVICE_FOLDER)/prebuilt/etc/wifi/TQS_S_2.6.ini:/system/etc/wifi/TQS_S_2.6.ini \
    $(DEVICE_FOLDER)/mixer_paths.xml:/system/etc/mixer_paths.xml \

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
# Make sure "Email" package gets into the build.
PRODUCT_PACKAGES += Email
endif

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=160 \
    persist.lab126.chargeprotect=1 \
    ro.sf.hwrotation=270 \

$(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
$(call inherit-product-if-exists, $(COMMON_FOLDER)/imgtec/sgx-imgtec-bins-540.mk)
