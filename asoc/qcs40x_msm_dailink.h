/* SPDX-License-Identifier: GPL-2.0-only */
/*
 * Copyright (c) 2020-2021, The Linux Foundation. All rights reserved.
 * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
 */

#include <sound/soc.h>
#include "msm_dailink.h"

/* FE dai-links */

SND_SOC_DAILINK_DEFS(slimbus0_hostless,
	DAILINK_COMP_ARRAY(COMP_CPU("SLIMBUS0_HOSTLESS")),
	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-hostless")));

SND_SOC_DAILINK_DEFS(slimbus1_hostless,
	DAILINK_COMP_ARRAY(COMP_CPU("SLIMBUS1_HOSTLESS")),
	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-hostless")));

SND_SOC_DAILINK_DEFS(slimbus2_hostless,
	DAILINK_COMP_ARRAY(COMP_CPU("SLIMBUS2_HOSTLESS")),
	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-hostless")));

SND_SOC_DAILINK_DEFS(slimbus3_hostless,
	DAILINK_COMP_ARRAY(COMP_CPU("SLIMBUS3_HOSTLESS")),
	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-hostless")));

SND_SOC_DAILINK_DEFS(slimbus4_hostless,
	DAILINK_COMP_ARRAY(COMP_CPU("SLIMBUS4_HOSTLESS")),
	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-hostless")));

SND_SOC_DAILINK_DEFS(multimedia18,
	DAILINK_COMP_ARRAY(COMP_CPU("MultiMedia18")),
	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-compress-dsp")));

SND_SOC_DAILINK_DEFS(multimedia19,
	DAILINK_COMP_ARRAY(COMP_CPU("MultiMedia19")),
	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-compress-dsp")));

SND_SOC_DAILINK_DEFS(multimedia26,
	DAILINK_COMP_ARRAY(COMP_CPU("MultiMedia26")),
	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-compress-dsp")));

SND_SOC_DAILINK_DEFS(multimedia27,
	DAILINK_COMP_ARRAY(COMP_CPU("MultiMedia27")),
	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-compress-dsp")));

SND_SOC_DAILINK_DEFS(multimedia28,
	DAILINK_COMP_ARRAY(COMP_CPU("MultiMedia28")),
	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-compress-dsp")));

SND_SOC_DAILINK_DEFS(multimedia29,
	DAILINK_COMP_ARRAY(COMP_CPU("MultiMedia29")),
	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-compress-dsp")));

SND_SOC_DAILINK_DEFS(multimedia30,
	DAILINK_COMP_ARRAY(COMP_CPU("MultiMedia30")),
	DAILINK_COMP_ARRAY(COMP_CODEC("snd-soc-dummy", "snd-soc-dummy-dai")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-compress-dsp")));

/* BE dai-links */

SND_SOC_DAILINK_DEFS(slimbus_0_rx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-dev.16384")),
	DAILINK_COMP_ARRAY(COMP_CODEC("tasha_codec", "tasha_mix_rx1")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(slimbus_0_tx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-dev.16385")),
	DAILINK_COMP_ARRAY(COMP_CODEC("tasha_codec", "tasha_tx1")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(slimbus_1_rx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-dev.16386")),
	DAILINK_COMP_ARRAY(COMP_CODEC("tasha_codec", "tasha_mix_rx1")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(slimbus_1_tx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-dev.16387")),
	DAILINK_COMP_ARRAY(COMP_CODEC("tasha_codec", "tasha_tx3")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(slimbus_2_rx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-dev.16388")),
	DAILINK_COMP_ARRAY(COMP_CODEC("tasha_codec", "tasha_rx2")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(slimbus_3_rx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-dev.16390")),
	DAILINK_COMP_ARRAY(COMP_CODEC("tasha_codec", "tasha_mix_rx1")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(slimbus_3_tx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-dev.16391")),
	DAILINK_COMP_ARRAY(COMP_CODEC("tasha_codec", "tasha_tx1")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(slimbus_4_rx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-dev.16392")),
	DAILINK_COMP_ARRAY(COMP_CODEC("tasha_codec", "tasha_mix_rx1")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(slimbus_5_rx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-dev.16394")),
	DAILINK_COMP_ARRAY(COMP_CODEC("tasha_codec", "tasha_rx3")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(slimbus_6_rx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-dev.16396")),
	DAILINK_COMP_ARRAY(COMP_CODEC("tasha_codec", "tasha_rx4")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(slimbus_4_tx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-dev.16393")),
	DAILINK_COMP_ARRAY(COMP_CODEC("tasha_codec", "tasha_vifeedback")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(slimbus_9_tx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-dev.16403")),
	DAILINK_COMP_ARRAY(COMP_CODEC("btfmslim_slave",
			"btfm_bt_split_a2dp_slim_tx")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(pri_meta_mi2s_rx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-meta-mi2s.4864")),
	DAILINK_COMP_ARRAY(COMP_CODEC("msm-stub-codec.1", "msm-stub-tx")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(sec_meta_mi2s_rx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-meta-mi2s.4866")),
	DAILINK_COMP_ARRAY(COMP_CODEC("msm-stub-codec.1", "msm-stub-tx")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(hdmi_ms_rx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-hdmi.24578")),
	DAILINK_COMP_ARRAY(COMP_CODEC("msm-ext-disp-audio-codec-rx", "msm_hdmi_ms_audio_codec_rx_dai")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(pri_spdif_rx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-spdif.20480")),
	DAILINK_COMP_ARRAY(COMP_CODEC("msm-stub-codec.1", "msm-stub-rx")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(pri_spdif_tx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-spdif.20481")),
	DAILINK_COMP_ARRAY(COMP_CODEC("msm-stub-codec.1", "msm-stub-tx")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(sec_spdif_rx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-spdif.20482")),
	DAILINK_COMP_ARRAY(COMP_CODEC("msm-stub-codec.1", "msm-stub-rx")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));

SND_SOC_DAILINK_DEFS(sec_spdif_tx,
	DAILINK_COMP_ARRAY(COMP_CPU("msm-dai-q6-spdif.20483")),
	DAILINK_COMP_ARRAY(COMP_CODEC("msm-stub-codec.1", "msm-stub-tx")),
	DAILINK_COMP_ARRAY(COMP_PLATFORM("msm-pcm-routing")));
