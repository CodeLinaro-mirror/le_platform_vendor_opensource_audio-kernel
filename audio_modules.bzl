load(":module_mgr.bzl", "create_module_registry")

DSP_PATH = "dsp"
IPC_PATH = "ipc"
SOC_PATH = "soc"
ASOC_PATH = "asoc"
DSP_CODECS_PATH = DSP_PATH + "/codecs"
ASOC_CODECS_PATH = ASOC_PATH + "/codecs"
ASOC_CODECS_WCD9330_PATH = ASOC_CODECS_PATH + "/wcd9330"
ASOC_CODECS_WCD937X_PATH = ASOC_CODECS_PATH + "/wcd937x"
ASOC_CODECS_WCD938X_PATH = ASOC_CODECS_PATH + "/wcd938x"
ASOC_CODECS_WSA883X_PATH = ASOC_CODECS_PATH + "/wsa883x"
ASOC_CODECS_LPASS_CDC_PATH = ASOC_CODECS_PATH + "/lpass-cdc"
ASOC_CODECS_BOLERO_PATH = ASOC_CODECS_PATH + "/bolero"

audio_modules = create_module_registry([":audio_headers"])
# ------------------------------------ AUDIO MODULE DEFINITIONS ---------------------------------
# >>>> DSP MODULES <<<<
audio_modules.register(
    name = "q6_dlkm",
    path = DSP_PATH,
    conditional_srcs = {
        "CONFIG_SND_SOC_MSM_QDSP6V2_INTF": [
            "msm-audio-event-notify.c",
            "q6_init.c",
            "audio_calibration.c",
            "audio_cal_utils.c",
            "q6adm.c",
            "q6afe.c",
            "q6asm.c",
            "q6audio-v2.c",
            "q6voice.c",
            "q6core.c",
            "q6common.c",
            "rtac.c",
            "q6lsm.c",
            "adsp_err.c",
            "msm_audio_ion.c",
        ],
        "CONFIG_SND_SOC_MSM_QDSP6V2_VM": [
            "msm-audio-event-notify.c",
            "msm_audio_ion_vm.c",
            "q6_init.c",
        ],
        "CONFIG_MSM_AVTIMER": [
            "avtimer.c"
        ],
        "CONFIG_XT_LOGGING": [
            "sp_params.c"
        ],
        "CONFIG_DIGITAL_CDC_RSC_MGR": [
            "digital-cdc-rsc-mgr.c"
        ],
        "CONFIG_WCD9XXX_CODEC_CORE": [
            "audio_slimslave.c"
        ]
    },
    deps = [ ":%b_snd_event_dlkm",
             ":%b_apr_dlkm",
    ],
)

audio_modules.register(
    name = "platform_dlkm",
    path = ASOC_PATH,
    conditional_srcs = {
         "CONFIG_SND_SOC_QDSP6V2": [
            "msm-audio-effects-q6-v2.c",
            "msm-compress-q6-v2.c",
            "msm-dai-fe.c",
            "msm-dai-q6-hdmi-v2.c",
            "msm-dai-q6-v2.c",
            "msm-dai-stub-v2.c",
            "msm-lsm-client.c",
            "msm-pcm-afe-v2.c",
            "msm-pcm-dtmf-v2.c",
            "msm-pcm-hostless.c",
            "msm-pcm-loopback-v2.c",
            "msm-pcm-q6-v2.c",
            "msm-pcm-host-voice-v2.c",
            "msm-pcm-q6-noirq.c",
            "msm-pcm-routing-v2.c",
            "msm-pcm-voice-v2.c",
            "msm-pcm-voip-v2.c",
            "platform_init.c",
         ],
         "CONFIG_QTI_PP": [
            "msm-qti-pp-config.c",
         ],
    },
    deps = [ ":%b_q6_dlkm",
             ":%b_apr_dlkm",
    ],
)


audio_modules.register(
    name = "native_dlkm",
    path = DSP_CODECS_PATH,
    config_option = "CONFIG_MSM_QDSP6V2_CODECS",
    srcs = [
        "q6audio_v2.c",
        "q6audio_v2_aio.c",
        "audio_utils_aio.c",
        "audio_utils.c",
        "audio_native.c",
        "aac_in.c",
        "amrnb_in.c",
        "amrwb_in.c",
        "audio_aac.c",
        "audio_alac.c",
        "audio_amrnb.c",
        "audio_amrwb.c",
        "audio_amrwbplus.c",
        "audio_ape.c",
        "audio_evrc.c",
        "audio_g711alaw.c",
        "audio_g711mlaw.c",
        "audio_hwacc_effects.c",
        "audio_mp3.c",
        "audio_multi_aac.c",
        "audio_qcelp.c",
        "audio_wma.c",
        "audio_wmapro.c",
        "evrc_in.c",
        "g711alaw_in.c",
        "g711mlaw_in.c",
        "qcelp_in.c"
    ],
    deps = [":%b_q6_pdr_dlkm",
            ":%b_q6_dlkm",
            ":%b_platform_dlkm",
    ],
)

audio_modules.register(
    name = "q6_notifier_dlkm",
    path = DSP_PATH,
    config_option = "CONFIG_MSM_QDSP6_NOTIFIER",
    srcs = [
        "audio_notifier.c",
        "audio_ssr.c"
    ],
    deps = [":%b_q6_pdr_dlkm"],
)
audio_modules.register(
    name = "apr_dlkm",
    path = IPC_PATH,
    conditional_srcs = {
        "CONFIG_MSM_QDSP6_APRV2_RPMSG": [
            "apr.c",
            "apr_v2.c",
            "apr_tal_rpmsg.c",
        ],
        "CONFIG_MSM_QDSP6_APRV3_RPMSG": [
            "apr.c",
            "apr_v3.c",
            "apr_tal_rpmsg.c"
        ],
        "CONFIG_MSM_QDSP6_APRV2_VM": [
            "apr_vm.c",
            "apr_v2.c"
        ]
    },
    deps = [":%b_q6_notifier_dlkm",
            ":%b_snd_event_dlkm",
    ],
)

audio_modules.register(
    name = "q6_pdr_dlkm",
    path = DSP_PATH,
    config_option = "CONFIG_MSM_QDSP6_PDR",
    srcs = ["audio_pdr.c"]
)

audio_modules.register(
    name = "adsp_loader_dlkm",
    path = DSP_PATH,
    config_option = "CONFIG_MSM_ADSP_LOADER",
    srcs = ["adsp-loader.c"],
    deps = [":%b_apr_dlkm"],
)

# >>>> SOC MODULES <<<<
audio_modules.register(
    name = "swr_dlkm",
    path = SOC_PATH,
    config_option = "CONFIG_SOUNDWIRE",
    srcs = [
        "regmap-swr.c",
        "soundwire.c"
    ]
)
audio_modules.register(
    name = "swr_ctrl_dlkm",
    path = SOC_PATH,
    conditional_srcs = {
        "CONFIG_SOUNDWIRE_WCD_CTRL": [
            "swr-wcd-ctrl.c"
        ],
        "CONFIG_SOUNDWIRE_MSTR_CTRL": [
            "swr-mstr-ctrl.c"
        ]
    },
    deps = [":%b_swr_dlkm",
            ":%b_q6_dlkm",
    ],
)
audio_modules.register(
    name = "snd_event_dlkm",
    path = SOC_PATH,
    config_option = "CONFIG_SND_EVENT",
    srcs = ["snd_event.c"]
)

# >>>> SOC MODULES <<<<
audio_modules.register(
    name = "pinctrl_wcd_dlkm",
    path = SOC_PATH,
    config_option = "CONFIG_PINCTRL_WCD",
    srcs = ["pinctrl-wcd.c"]
)

audio_modules.register(
    name = "pinctrl_lpi_dlkm",
    path = SOC_PATH,
    config_option = "CONFIG_PINCTRL_LPI",
    srcs = ["pinctrl-lpi.c"],
    deps = [":%b_q6_notifier_dlkm",
            ":%b_snd_event_dlkm",
            ":%b_q6_dlkm",  
    ],
)

# >>>> ASOC MODULES <<<<
audio_modules.register(
    name = "machine_dlkm",
    path = ASOC_PATH,
    srcs = [
        "msm-common.c",
    ],
    conditional_srcs = {
        "CONFIG_SND_SOC_LAHAINA": [
            "lahaina.c"
        ],
    },
    deps = [":%b_wcd938x_dlkm",
            ":%b_wcd_core_dlkm",
            ":%b_wsa883x_dlkm",
            ":%b_wcd937x_dlkm",
            ":%b_snd_event_dlkm",
            ":%b_bolero_cdc_dlkm",
            ":%b_platform_dlkm",
            ":%b_q6_dlkm",
    ],
)
# >>>> ASOC/CODEC MODULES <<<<
audio_modules.register(
    name = "wcd_core_dlkm",
    path = ASOC_CODECS_PATH,
    conditional_srcs = {
        "CONFIG_WCD9XXX_CODEC_CORE": [
            "wcd9xxx-rst.c",
            "wcd9xxx-core-init.c",
            "wcd9xxx-core.c",
            "wcd9xxx-irq.c",
            "wcd9xxx-slimslave.c",
            "wcd9xxx-utils.c",
            "wcd9335-regmap.c",
            "wcd9335-tables.c",
            "msm-cdc-pinctrl.c",
            "msm-cdc-supply.c",
            "wcd934x/wcd934x-regmap.c",
            "wcd934x/wcd934x-tables.c",
            "wcd9330/wcd9330-regmap.c",
            "wcd9330/wcd9330-tables.c",
        ],
        "CONFIG_WCD9XXX_CODEC_CORE_V2": [
            "wcd9xxx-core-init.c",
            "msm-cdc-pinctrl.c",
            "msm-cdc-supply.c",
        ],
        "CONFIG_SND_SOC_WCD_IRQ": [
            "wcd-irq.c"
        ]
    }
)

audio_modules.register(
    name = "mbhc_dlkm",
    path = ASOC_CODECS_PATH,
    config_option = "CONFIG_SND_SOC_WCD_MBHC",
    srcs = ["wcd-mbhc-v2.c"],
    deps = [":%b_swr_dlkm"],
    conditional_srcs = {
        "CONFIG_SND_SOC_WCD_MBHC_ADC": [
            "wcd-mbhc-adc.c"
        ],
        "CONFIG_SND_SOC_WCD_MBHC_LEGACY": [
            "wcd-mbhc-legacy.c"
        ]
    },
)
audio_modules.register(
    name = "wcd9xxx_dlkm",
    path = ASOC_CODECS_PATH,
    config_option = "CONFIG_SND_SOC_WCD9XXX_V2",
    srcs = [
        "wcdcal-hwdep.c",
        "wcd9xxx-soc-init.c",
        "audio-ext-clk-up.c"
    ],
    conditional_srcs = {
        "CONFIG_WCD9XXX_CODEC_CORE": {
            True: [
                "wcd9xxx-common-v2.c",
                "wcd9xxx-resmgr-v2.c",
                "wcd-dsp-utils.c",
                "wcd-dsp-mgr.c",
            ],
            False: [
                "wcd-clsh.c"
            ]
        }
    },
    deps = [":%b_q6_dlkm",            
    ],
)
audio_modules.register(
    name = "swr_haptics_dlkm",
    path = ASOC_CODECS_PATH,
    config_option = "CONFIG_SND_SWR_HAPTICS",
    srcs = ["swr-haptics.c"],
    deps = [":%b_swr_dlkm"],
)
audio_modules.register(
    name = "stub_dlkm",
    path = ASOC_CODECS_PATH,
    config_option = "CONFIG_SND_SOC_MSM_STUB",
    srcs = ["msm_stub.c"]
)
audio_modules.register(
    name = "hdmi_dlkm",
    path = ASOC_CODECS_PATH,
    config_option = "CONFIG_SND_SOC_MSM_HDMI_CODEC_RX",
    srcs = ["msm_hdmi_codec_rx.c"],
    deps = ["//vendor/qcom/opensource/mm-drivers/msm_ext_display:%b_msm_ext_display",
            "//vendor/qcom/opensource/mm-drivers/msm_ext_display:msm_ext_display_headers",
           ],
)

audio_modules.register(
    name = "wcd9330_dlkm",
    path = ASOC_CODECS_WCD9330_PATH,
    config_option = "CONFIG_SND_SOC_WCD9330",
    srcs = ["wcd9330.c"]
)
# >>>> SWR-DMIC LEGACY WCD938X <<<<
audio_modules.register(
    name = "swr_dmic_legacy_dlkm",
    path = ASOC_CODECS_PATH,
    config_option = "CONFIG_SND_SOC_SWR_DMIC",
    srcs = ["swr-dmic.c"],
    deps = [":%b_wcd938x_dlkm",
            ":%b_swr_dlkm",
           ],

)
# >>>> ASOC/CODECS/BOLERO MODULES <<<<
audio_modules.register(
    name = "bolero_cdc_dlkm",
    path = ASOC_CODECS_BOLERO_PATH,
    config_option = "CONFIG_SND_SOC_BOLERO",
    srcs = [
        "bolero-cdc.c",
        "bolero-cdc-utils.c",
        "bolero-cdc-regmap.c",
        "bolero-cdc-tables.c",
        "bolero-clk-rsc.c",
    ],
    deps = [":%b_snd_event_dlkm",
            ":%b_q6_dlkm",
    ],
)
audio_modules.register(
    name = "va_macro_dlkm",
    path = ASOC_CODECS_BOLERO_PATH,
    config_option = "CONFIG_VA_MACRO",
    srcs = ["va-macro.c"],
    deps = [":%b_bolero_cdc_dlkm",
            ":%b_swr_ctrl_dlkm",
            ":%b_wcd_core_dlkm",
            ":%b_q6_dlkm",
           ],
)
audio_modules.register(
    name = "rx_macro_dlkm",
    path = ASOC_CODECS_BOLERO_PATH,
    config_option = "CONFIG_RX_MACRO",
    srcs = ["rx-macro.c"],
    deps = [":%b_bolero_cdc_dlkm",
            ":%b_swr_ctrl_dlkm",
            ":%b_wcd_core_dlkm",
           ],

)
audio_modules.register(
    name = "tx_macro_dlkm",
    path = ASOC_CODECS_BOLERO_PATH,
    config_option = "CONFIG_TX_MACRO",
    srcs = ["tx-macro.c"],
    deps = [":%b_bolero_cdc_dlkm",
            ":%b_swr_ctrl_dlkm",
            ":%b_wcd_core_dlkm",
           ],
)

audio_modules.register(
    name = "wsa_macro_dlkm",
    path = ASOC_CODECS_BOLERO_PATH,
    config_option = "CONFIG_WSA_MACRO",
    srcs = ["wsa-macro.c"],
    deps = [":%b_bolero_cdc_dlkm",
            ":%b_swr_ctrl_dlkm",
            ":%b_wcd_core_dlkm",
           ],
)

# >>>> WSA881X-ANALOG MODULE <<<<
audio_modules.register(
    name = "wsa881x_analog_dlkm",
    path = ASOC_CODECS_PATH,
    config_option = "CONFIG_SND_SOC_WSA881X_ANALOG",
    srcs = [
        "wsa881x-analog.c",
        "wsa881x-tables-analog.c",
        "wsa881x-regmap-analog.c",
	],
    conditional_srcs = {
        "CONFIG_WSA881X_TEMP_SENSOR_DISABLE": {
            False: [
                "wsa881x-temp-sensor.c"
            ]
        }
    }
)
# >>>> WSA883X MODULE <<<<
audio_modules.register(
    name = "wsa883x_dlkm",
    path = ASOC_CODECS_PATH + "/wsa883x",
    config_option = "CONFIG_SND_SOC_WSA883X",
    srcs = [
        "wsa883x.c",
        "wsa883x-regmap.c",
        "wsa883x-tables.c",
    ],
    deps = [":%b_wcd_core_dlkm",
            ":%b_swr_dlkm",
	   ],
)
# >>>> WSA884X MODULE <<<<
audio_modules.register(
    name = "wsa884x_dlkm",
    path = ASOC_CODECS_PATH + "/wsa884x",
    config_option = "CONFIG_SND_SOC_WSA884X",
    srcs = [
        "wsa884x.c",
        "wsa884x-regmap.c",
        "wsa884x-tables.c",
    ],
    deps = [":%b_wcd_core_dlkm",
            ":%b_swr_dlkm",
	   ],
)
# >>>> WCD937X MODULES <<<<
audio_modules.register(
    name = "wcd937x_dlkm",
    path = ASOC_CODECS_PATH + "/wcd937x",
    config_option = "CONFIG_SND_SOC_WCD937X",
    srcs = [
        "wcd937x.c",
        "wcd937x-regmap.c",
        "wcd937x-tables.c",
        "wcd937x-mbhc.c",
    ],
    deps = [":%b_wcd9xxx_dlkm",
            ":%b_mbhc_dlkm",
            ":%b_wcd_core_dlkm",
            ":%b_swr_dlkm",
            ":%b_wcd937x_slave_dlkm",
	   ],
)
audio_modules.register(
    name = "wcd937x_slave_dlkm",
    path = ASOC_CODECS_PATH + "/wcd937x",
    config_option = "CONFIG_SND_SOC_WCD937X_SLAVE",
    srcs = ["wcd937x_slave.c"],
    deps = [":%b_swr_dlkm"],
)
# >>>> WCD938X MODULES <<<<
audio_modules.register(
    name = "wcd938x_dlkm",
    path = ASOC_CODECS_PATH + "/wcd938x",
    config_option = "CONFIG_SND_SOC_WCD938X",
    srcs = [
        "wcd938x.c",
        "wcd938x-regmap.c",
        "wcd938x-tables.c",
        "wcd938x-mbhc.c",
    ],
    deps = [":%b_wcd9xxx_dlkm",
            ":%b_mbhc_dlkm",
            ":%b_wcd_core_dlkm",
            ":%b_swr_dlkm",
            ":%b_wcd938x_slave_dlkm",
	   ],
)
audio_modules.register(
    name = "wcd938x_slave_dlkm",
    path = ASOC_CODECS_PATH + "/wcd938x",
    config_option = "CONFIG_SND_SOC_WCD938X_SLAVE",
    srcs = ["wcd938x-slave.c"],
    deps = [":%b_swr_dlkm"],
)
# >>>> WCD938X MODULES <<<<
audio_modules.register(
    name = "wcd938x_dlkm",
    path = ASOC_CODECS_PATH + "/wcd938x",
    config_option = "CONFIG_SND_SOC_WCD938X",
    srcs = [
        "wcd938x.c",
        "wcd938x-regmap.c",
        "wcd938x-tables.c",
        "wcd938x-mbhc.c",
    ],
    deps = [":%b_wcd9xxx_dlkm",
            ":%b_mbhc_dlkm",
            ":%b_wcd_core_dlkm",
            ":%b_swr_dlkm",
            ":%b_wcd938x_slave_dlkm",
           ],
)
audio_modules.register(
    name = "wcd938x_slave_dlkm",
    path = ASOC_CODECS_PATH + "/wcd938x",
    config_option = "CONFIG_SND_SOC_WCD938X_SLAVE",
    srcs = ["wcd938x-slave.c"],
    deps = [":%b_swr_dlkm"],
)
