#
# Copyright (C) 2022 The LineageOS Project
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

LOCAL_PATH := device/samsung/gtaxllte

# Overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Ramdisk
PRODUCT_PACKAGES += \
    init.baseband.rc \
    init.gps.rc \
    init.vendor.rilchip.rc \
    init.vendor.rilcommon.rc

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.4:64 \
    android.hardware.radio.config@1.2:64 \
    android.hardware.radio.deprecated@1.0:64

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/gps/gps.cfg:$(TARGET_COPY_OUT_VENDOR)/etc/gnss/gps.cfg \
    $(LOCAL_PATH)/configs/gps/gps.conf:$(TARGET_COPY_OUT_SYSTEM)/etc/gps.conf

PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    android.hardware.gnss@1.0-service

# libsecnativefeature
PRODUCT_PACKAGES += \
    libsecnativefeature

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Vibration
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl \
    android.hardware.vibrator@1.0-service

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.connectionservice.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.connectionservice.xml \
    frameworks/native/data/etc/android.software.sip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.gsm.xml

# Inherit from gtaxl-common
$(call inherit-product, device/samsung/gtaxl-common/common.mk)

# Call the proprietary setup
$(call inherit-product, vendor/samsung/gtaxllte/gtaxllte-vendor.mk)
