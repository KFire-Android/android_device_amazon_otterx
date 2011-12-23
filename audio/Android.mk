ifeq ($(BOARD_USES_AUDIO_LEGACY),true)

LOCAL_PATH := $(call my-dir)

# output for libaudio intermediates
LIBAUDIO_INTERMEDIATES_PREREQS := $(PRODUCT_OUT)/obj/lib

# prerequisites for building audio
file := $(LIBAUDIO_INTERMEDIATES_PREREQS)/libaudio.so
$(file) : device/amazon/otter/audio/libaudio.so
	@echo "Copy libaudio.so -> $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) cp -a device/amazon/otter/audio/libaudio.so $@

file := $(LIBAUDIO_INTERMEDIATES_PREREQS)/libasound.so
$(file) : device/amazon/otter/audio/libasound.so
	@echo "Copy libasound.so -> $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) cp -a device/amazon/otter/audio/libasound.so $@

file := $(LIBAUDIO_INTERMEDIATES_PREREQS)/libaudiopolicy.so
$(file) : device/amazon/otter/audio/libaudiopolicy.so
	@echo "Copy libaudiopolicy.so -> $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) cp -a device/amazon/otter/audio/libaudiopolicy.so $@

include $(all-subdir-makefiles)

endif # BOARD_USES_AUDIO_LEGACY
