# Copyright (C) 2009 The CyanogenMod Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# inherit from the proprietary version
-include vendor/samsung/apexqtmo/BoardConfigVendor.mk
# inherit from common d2
-include device/samsung/d2-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := goghvmu

# Insert contents of file near end of updater-script
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./build/tools/releasetools/ota_from_target_files -e ./device/samsung/apexqtmo/installer_extra

# Kernel
TARGET_KERNEL_CONFIG        := cyanogen_goghvmu_defconfig
BOARD_MKBOOTIMG_ARGS        := --base 0x80200000 --cmdline 'console=null androidboot.hardware=qcom user_debug=31 sec_log=0x80000@0x88d00008 sec_dbg=0x40000@0x88d90004 sec_debug.reset_reason=0x1a2b3c00 etb_buf=0x4000@0x8fffb9c0 androidboot.debug_level=0x4f4c sec_debug.enable=0 sec_debug.enable_user=0 androidboot.cp_debug_level=0x55FF sec_debug.enable_cp_debug=0 cordon=0024a9e1c9bb9a2690605f99659f4e01 sysscope=0xee000000 loglevel=4 samsung.hard'
TARGET_KERNEL_SOURCE        := kernel/samsung/goghvmu

# Bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BLUETOOTH_HCI_USE_MCT := true

# Wifi
BOARD_WLAN_DEVICE := qcwcn
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HAS_QCOM_WLAN := true

WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/prima_wlan.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/prima_wlan/parameters/fwpath"
WIFI_DRIVER_MODULE_NAME     := "prima_wlan"

#Audio
BOARD_USES_SEPERATED_VOICE_SPEAKER := true
BOARD_USES_FLUENCE_INCALL := false

#camera hax
COMMON_GLOBAL_CFLAGS += -DCONFIG_MSM8960_NO_CANCEL_AUTOFOCUS

# undefined
WIFI_DRIVER_MODULE_ARG      :=
WIFI_DRIVER_MODULE_AP_ARG   :=
WIFI_DRIVER_FW_PATH_STA     :=
WIFI_DRIVER_FW_PATH_AP      :=
WIFI_DRIVER_FW_PATH_P2P     :=
BOARD_HAVE_SAMSUNG_WIFI :=
BOARD_HAVE_BLUETOOTH_BCM :=
BOARD_HAVE_AUDIENCE_A2220 :=
TARGET_KERNEL_VARIANT_CONFIG :=

ifeq ($(VARIENT_REQUIRE_3.0_KERNEL),true)
## 3.0 kernel defines
# Workaround for missing symbols in camera
BOARD_NEEDS_MEMORYHEAPPMEM := true
# We still have the old ION API
BOARD_HAVE_OLD_ION_API := true
# Use regular media driver variant for 8960
TARGET_QCOM_MEDIA_VARIANT :=
endif
