# Android makefile for audio kernel modules

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_BOARD_AUTO),true)
KBUILD_OPTIONS += CONFIG_BOARD_AUTO_AUDIO=y
endif

ifeq ($(call is-board-platform, kona),true)
AUDIO_SELECT  := CONFIG_SND_SOC_KONA=m
endif

ifeq ($(call is-board-platform, lahaina),true)
AUDIO_SELECT  := CONFIG_SND_SOC_LAHAINA=m
endif

# Build/Package only in case of supported target
ifeq ($(call is-board-platform-in-list,msmnile kona $(MSMSTEPPE) lahaina), true)

LOCAL_PATH := $(call my-dir)

# This makefile is only for DLKM
ifneq ($(findstring vendor,$(LOCAL_PATH)),)

ifneq ($(findstring opensource,$(LOCAL_PATH)),)
	AUDIO_BLD_DIR := $(abspath .)/vendor/qcom/opensource/audio-kernel/legacy
endif # opensource

include $(AUDIO_BLD_DIR)/EnableBazel.mk
DLKM_DIR := $(TOP)/device/qcom/common/dlkm


###########################################################
# This is set once per LOCAL_PATH, not per (kernel) module
KBUILD_OPTIONS += AUDIO_ROOT=$(AUDIO_BLD_DIR)

# We are actually building audio.ko here, as per the
# requirement we are specifying <chipset>_audio.ko as LOCAL_MODULE.
# This means we need to rename the module to <chipset>_audio.ko
# after audio.ko is built.
KBUILD_OPTIONS += MODNAME=audio_dlkm
KBUILD_OPTIONS += BOARD_PLATFORM=$(TARGET_BOARD_PLATFORM)
KBUILD_OPTIONS += $(AUDIO_SELECT)
ifeq ($(call is-board-platform-in-list, msmnile $(MSMSTEPPE)),true)
KBUILD_OPTIONS += CONFIG_SND_SOC_AUTO=y
ifneq (,$(filter $(TARGET_BOARD_PLATFORM)$(TARGET_BOARD_SUFFIX), msmnile_gvmq))
KBUILD_OPTIONS += CONFIG_SND_SOC_GVM=m
endif
ifneq (,$(filter $(TARGET_BOARD_PLATFORM)$(TARGET_BOARD_SUFFIX), $(MSMSTEPPE)_au))
KBUILD_OPTIONS += CONFIG_SND_SOC_SA6155=m
endif
ifneq (,$(filter $(TARGET_BOARD_PLATFORM)$(TARGET_BOARD_SUFFIX), msmnile_au))
KBUILD_OPTIONS += CONFIG_SND_SOC_SA8155=m
endif
endif

KBUILD_OPTIONS += KBUILD_EXTRA_SYMBOLS=$(PWD)/$(call intermediates-dir-for,DLKM,msm-ext-disp-module-symvers)/Module.symvers

AUDIO_SRC_FILES := \
	$(wildcard $(LOCAL_PATH)/*) \
	$(wildcard $(LOCAL_PATH)/*/*) \
	$(wildcard $(LOCAL_PATH)/*/*/*) \
	$(wildcard $(LOCAL_PATH)/*/*/*/*)

########################### dsp ################################

ifeq ($(call is-board-platform-in-list,msmnile $(MSMSTEPPE)), true)
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := q6_notifier_dlkm_legacy.ko
LOCAL_MODULE_KBUILD_NAME  := dsp/q6_notifier_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
else
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := q6_notifier_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := dsp/q6_notifier_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
endif
###########################################################
ifeq ($(call is-board-platform-in-list,msmnile $(MSMSTEPPE)), true)
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := q6_dlkm_legacy.ko
LOCAL_MODULE_KBUILD_NAME  := dsp/q6_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
else
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := q6_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := dsp/q6_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
endif
###########################################################
ifeq ($(call is-board-platform-in-list,msmnile $(MSMSTEPPE)), true)
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := adsp_loader_dlkm_legacy.ko
LOCAL_MODULE_KBUILD_NAME  := dsp/adsp_loader_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
else
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := adsp_loader_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := dsp/adsp_loader_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
endif
##########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := native_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := dsp/codecs/native_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk

########################### ipc  ################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := apr_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := ipc/apr_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
###########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := q6_pdr_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := dsp/q6_pdr_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
############################ soc ###############################
ifeq ($(call is-board-platform-in-list,msmnile $(MSMSTEPPE)), true)
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := snd_event_dlkm_legacy.ko
LOCAL_MODULE_KBUILD_NAME  := soc/snd_event_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
else
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := snd_event_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := soc/snd_event_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
endif
###########################  ASOC CODEC ################################
ifeq ($(call is-board-platform-in-list,msmnile $(MSMSTEPPE)), true)
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := stub_dlkm_legacy.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/stub_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
else
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := stub_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/stub_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
endif
########################### ASOC ################################
ifeq ($(call is-board-platform-in-list,msmnile $(MSMSTEPPE)), true)
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := machine_dlkm_legacy.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/machine_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
else
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := machine_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/machine_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
endif

###########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := platform_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/platform_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk

###########################################################
ifeq ($(call is-board-platform-in-list,msmnile $(MSMSTEPPE)), true)
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := hdmi_dlkm_legacy.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/hdmi_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
else
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := hdmi_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/hdmi_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
endif

############################ soc ###############################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := pinctrl_lpi_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := soc/pinctrl_lpi_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk

############################ soc ###############################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := pinctrl_wcd_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := soc/pinctrl_wcd_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk

ifeq ($(call is-board-platform-in-list, lahaina),true)
###########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := bolero_cdc_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/bolero/bolero_cdc_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
###########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := va_macro_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/bolero/va_macro_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
###########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := tx_macro_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/bolero/tx_macro_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
###########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := rx_macro_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/bolero/rx_macro_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
###########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := wsa_macro_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/bolero/wsa_macro_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
###########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := wcd937x_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/wcd937x/wcd937x_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
###########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := wcd937x_slave_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/wcd937x/wcd937x_slave_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
########################### WCD938x CODEC  ################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := wcd938x_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/wcd938x/wcd938x_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
###########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := wcd938x_slave_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/wcd938x/wcd938x_slave_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
##########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := wsa883x_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/wsa883x/wsa883x_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
##########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := swr_dmic_legacy_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/swr_dmic_legacy_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
###########################  ASOC CODEC ################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := wcd_core_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/wcd_core_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
###########################################################

include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := swr_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := soc/swr_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
###########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := swr_ctrl_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := soc/swr_ctrl_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
###########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := mbhc_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/mbhc_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
###########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := wcd9xxx_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/wcd9xxx_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk
###########################################################
include $(CLEAR_VARS)
LOCAL_SRC_FILES           := $(AUDIO_SRC_FILES)
LOCAL_MODULE              := swr_haptics_dlkm.ko
LOCAL_MODULE_KBUILD_NAME  := asoc/codecs/swr_haptics_dlkm.ko
LOCAL_MODULE_TAGS         := optional
LOCAL_MODULE_DEBUG_ENABLE := true
LOCAL_MODULE_PATH         := $(KERNEL_MODULES_OUT)
include $(DLKM_DIR)/Build_external_kernelmodule.mk

endif

endif # DLKM check
endif # supported target check
