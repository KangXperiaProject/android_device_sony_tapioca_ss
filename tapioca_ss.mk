#
# Copyright (C) 2011 The CyanogenMod Project
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

# Inherit the proprietary counterpart
$(call inherit-product-if-exists, vendor/sony/tapioca_ss/tapioca_ss-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/sony/tapioca_ss/overlay

# Inherit the tamsui-common definitions
$(call inherit-product, device/sony/tamsui-common/tamsui.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal mdpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

# Configuration scripts
PRODUCT_COPY_FILES += \
   device/sony/tamsui-common/prebuilt/logo.rle:root/logo.rle \

# Audio
PRODUCT_COPY_FILE += \
   $(LOCAL_PATH)/config/audio_policy.conf:system/etc/audio_policy.conf \

# Configuration scripts
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/prebuilt/pre_hw_config.sh:system/etc/pre_hw_config.sh \
   $(LOCAL_PATH)/prebuilt/hw_config.sh:system/etc/hw_config.sh

# USB function switching
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/init.semc.usb.rc:root/init.semc.usb.rc

PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/fstab.semc:root/fstab.semc

PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/vold.fstab:system/etc/vold.fstab \
   $(LOCAL_PATH)/config/media_profiles.xml:system/etc/media_profiles.xml

# Recovery bootstrap (device-specific part)
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/recovery/bootrec-device:root/sbin/bootrec-device \
   $(LOCAL_PATH)/recovery.fstab:root/recovery.fstab

# Key layouts and touchscreen
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/atdaemon.kl:system/usr/keylayout/atdaemon.kl \
   $(LOCAL_PATH)/config/clearpad.kl:system/usr/keylayout/clearpad.kl \
   $(LOCAL_PATH)/config/clearpad.idc:system/usr/idc/clearpad.idc \
   $(LOCAL_PATH)/config/tamsui-keypad.kl:system/usr/keylayout/tamsui-keypad.kl \
   $(LOCAL_PATH)/config/gpio-key.kl:system/usr/keylayout/gpio-key.kl \
   $(LOCAL_PATH)/config/keypad-pmic-tamsui.kl:system/usr/keylayout/keypad-pmic-tamsui.kl \
   $(LOCAL_PATH)/config/pmic8058_pwrkey.kl:system/usr/keylayout/pmic8058_pwrkey.kl \
   $(LOCAL_PATH)/config/simple_remote.kl:system/usr/keylayout/simple_remote.kl

# Misc configuration files
PRODUCT_COPY_FILES += \
   $(LOCAL_PATH)/config/thermald-semc.conf:system/etc/thermald-semc.conf \
   $(LOCAL_PATH)/config/thermald.conf:system/etc/thermald.conf

#Offline charging animation
PRODUCT_COPY_FILES += \
    device/sony/tamsui-common/prebuilt/animations/charging_animation_01.png:system/semc/chargemon/data/charging_animation_01.png \
    device/sony/tamsui-common/prebuilt/animations/charging_animation_02.png:system/semc/chargemon/data/charging_animation_02.png \
    device/sony/tamsui-common/prebuilt/animations/charging_animation_03.png:system/semc/chargemon/data/charging_animation_03.png \
    device/sony/tamsui-common/prebuilt/animations/charging_animation_04.png:system/semc/chargemon/data/charging_animation_04.png \
    device/sony/tamsui-common/prebuilt/animations/charging_animation_05.png:system/semc/chargemon/data/charging_animation_05.png \
    device/sony/tamsui-common/prebuilt/animations/charging_animation_06.png:system/semc/chargemon/data/charging_animation_06.png \
    device/sony/tamsui-common/prebuilt/animations/charging_animation_07.png:system/semc/chargemon/data/charging_animation_07.png

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/sony/tapioca_ss/tapioca_ss-vendor.mk)

# Wifi
BOARD_WLAN_DEVICE_REV := bcm4330_b2
WIFI_BAND             := 802_11_ABG
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4330/device-bcm.mk)