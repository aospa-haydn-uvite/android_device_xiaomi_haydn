#
# Copyright (C) 2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/xiaomi/haydn

# Inherit from sm8350-common
include device/xiaomi/sm8350-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := haydn|haydnin

# Board
TARGET_BOOTLOADER_BOARD_NAME := haydn

# HIDL
DEVICE_MANIFEST_FILE += $(DEVICE_PATH)/hidl/manifest.xml

# Kernel
KERNEL_FRAGMENT_CONFIG := vendor/haydn_QGKI.config

# Kernel modules
BOARD_VENDOR_KERNEL_MODULES += \
    $(KERNEL_MODULES_OUT)/cs35l41_dlkm.ko \
    $(KERNEL_MODULES_OUT)/focaltech_touch.ko \
    $(KERNEL_MODULES_OUT)/fpc1020_tee.ko \
    $(KERNEL_MODULES_OUT)/qcom-hv-haptics.ko \
    $(KERNEL_MODULES_OUT)/xiaomi_touch.ko

# Partitions
BOARD_DTBOIMG_PARTITION_SIZE := 25165824

# Vibrator
SOONG_CONFIG_NAMESPACES += XIAOMI_VIBRATOR
SOONG_CONFIG_XIAOMI_VIBRATOR := USE_EFFECT_STREAM
SOONG_CONFIG_XIAOMI_VIBRATOR_USE_EFFECT_STREAM := true

# Include proprietary files
include vendor/xiaomi/haydn/BoardConfigVendor.mk
