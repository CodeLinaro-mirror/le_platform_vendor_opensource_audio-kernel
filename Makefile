LE_KERNEL_PATH=src/kernel-5.15

ifeq ($(findstring $(LE_KERNEL_PATH),$(KERNEL_SRC)), $(LE_KERNEL_PATH))
AUDIO_ROOT=$(KERNEL_SRC)/../../../vendor/qcom/opensource/audio-kernel/legacy
else
AUDIO_ROOT=$(KERNEL_SRC)/../../vendor/qcom/opensource/audio-kernel/legacy
endif

KBUILD_OPTIONS+=  AUDIO_ROOT=$(AUDIO_ROOT)

all: modules

clean:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) clean

%:
	$(MAKE) -C $(KERNEL_SRC) M=$(M) $@ $(KBUILD_OPTIONS)
