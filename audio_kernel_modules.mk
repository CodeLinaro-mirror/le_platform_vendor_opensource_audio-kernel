# Build audio kernel driver

AUDIO_KERNEL_MODULES += $(KERNEL_MODULES_OUT)/native_dlkm.ko \
	$(KERNEL_MODULES_OUT)/apr_dlkm.ko \
	$(KERNEL_MODULES_OUT)/platform_dlkm.ko \
	$(KERNEL_MODULES_OUT)/q6_notifier_dlkm.ko \
	$(KERNEL_MODULES_OUT)/q6_pdr_dlkm.ko \
	$(KERNEL_MODULES_OUT)/q6_dlkm.ko \
	$(KERNEL_MODULES_OUT)/adsp_loader_dlkm.ko \
	$(KERNEL_MODULES_OUT)/snd_event_dlkm.ko \
	$(KERNEL_MODULES_OUT)/stub_dlkm.ko \
	$(KERNEL_MODULES_OUT)/hdmi_dlkm.ko \
	$(KERNEL_MODULES_OUT)/machine_dlkm.ko \
	$(KERNEL_MODULES_OUT)/pinctrl_lpi_dlkm.ko \
	$(KERNEL_MODULES_OUT)/pinctrl_wcd_dlkm.ko \
	$(KERNEL_MODULES_OUT)/bolero_cdc_dlkm.ko \
	$(KERNEL_MODULES_OUT)/va_macro_dlkm.ko \
	$(KERNEL_MODULES_OUT)/tx_macro_dlkm.ko \
	$(KERNEL_MODULES_OUT)/rx_macro_dlkm.ko \
	$(KERNEL_MODULES_OUT)/wsa_macro_dlkm.ko \
	$(KERNEL_MODULES_OUT)/wcd937x_dlkm.ko \
	$(KERNEL_MODULES_OUT)/wcd937x_slave_dlkm.ko \
	$(KERNEL_MODULES_OUT)/wcd938x_dlkm.ko \
	$(KERNEL_MODULES_OUT)/wcd938x_slave_dlkm.ko \
	$(KERNEL_MODULES_OUT)/wsa883x_dlkm.ko \
	$(KERNEL_MODULES_OUT)/swr_dlkm.ko \
	$(KERNEL_MODULES_OUT)/swr_ctrl_dlkm.ko \
	$(KERNEL_MODULES_OUT)/swr_dmic_legacy_dlkm.ko \
	$(KERNEL_MODULES_OUT)/wcd_core_dlkm.ko \
	$(KERNEL_MODULES_OUT)/mbhc_dlkm.ko \
	$(KERNEL_MODULES_OUT)/wcd9xxx_dlkm.ko \
	$(KERNEL_MODULES_OUT)/swr_haptics_dlkm.ko

