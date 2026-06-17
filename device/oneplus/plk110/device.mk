#
# Copyright (C) 2024 The LineageOS Project
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

# Inherit from the common device configuration
$(call inherit-product, device/oneplus/common/common.mk)

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Enable virtual A/B compression
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-6144-dalvik-heap.mk)

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 34

# VNDK
PRODUCT_TARGET_VNDK_VERSION := 34

# AID generation
PRODUCT_PACKAGES += \
    fs_config_files

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio.service \
    android.hardware.audio@7.1-impl \
    android.hardware.audio.effect@7.0-impl \
    android.hardware.soundtrigger@2.3-impl \
    android.hardware.bluetooth.audio@2.1-impl \
    audio.bluetooth.default \
    audio.r_submix.default \
    audio.usb.default

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml

# Bluetooth
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.1.vendor \
    android.hardware.bluetooth.audio@2.1-impl

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.7.vendor

# DRM
PRODUCT_PACKAGES += \
    android.hardware.drm@1.4.vendor

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.composer@2.4.vendor \
    android.hardware.graphics.mapper@4.0.vendor \
    libdisplayconfig.qti \
    libtinyxml

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# HIDL
PRODUCT_PACKAGES += \
    android.hidl.allocator@1.0.vendor \
    libhidltransport.vendor \
    libhwbinder.vendor

# Kernel
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)-kernel/Image.gz:kernel

# Keymaster
PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0.vendor \
    android.hardware.keymaster@4.1.vendor

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light-service.oneplus

# Media
PRODUCT_PACKAGES += \
    android.hardware.media.c2@1.2.vendor \
    libavmediaserviceextensions \
    libcodec2_hidl@1.2.vendor \
    libcodec2_soft_common.vendor \
    libsfplugin_ccodec

# Neural Networks
PRODUCT_PACKAGES += \
    android.hardware.neuralnetworks@1.3.vendor

# NFC
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2.vendor \
    com.android.nfc_extras \
    NfcNci \
    Tag

# OMX
PRODUCT_PACKAGES += \
    libcodec2_hidl@1.0.vendor \
    libcodec2_hidl@1.1.vendor \
    libcodec2_hidl@1.2.vendor \
    libcodec2_soft_common.vendor

# Overlays
PRODUCT_PACKAGES += \
    FrameworksResTarget \
    ApertureTarget \
    SettingsProviderOverlay

# Partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Power
PRODUCT_PACKAGES += \
    android.hardware.power-service.oneplus

# QTI
PRODUCT_PACKAGES += \
    libqti_vndfwk_detect.vendor

# RIL
PRODUCT_PACKAGES += \
    android.hardware.radio@1.6.vendor \
    android.hardware.radio.config@1.3.vendor \
    android.hardware.radio.deprecated@1.0.vendor

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@2.1-service.oneplus \
    android.frameworks.sensorservice@1.0.vendor

# Thermal
PRODUCT_PACKAGES += \
    android.hardware.thermal@2.0.vendor

# USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.3-service-qti

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator-service.oneplus

# WiFi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.5.vendor \
    android.hardware.wifi.hostapd@1.3.vendor \
    android.hardware.wifi.supplicant@1.4.vendor \
    libwifi-hal-qcom \
    WifiOverlay