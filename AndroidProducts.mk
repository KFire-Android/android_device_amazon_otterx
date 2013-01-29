PRODUCT_MAKEFILES := $(LOCAL_DIR)/full_otter.mk
ifeq ($(TARGET_PRODUCT),aokp_otter)
    PRODUCT_MAKEFILES += $(LOCAL_DIR)/aokp.mk
endif
