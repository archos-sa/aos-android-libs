ifeq (,$(LOCAL_MODULE))
$(error LOCAL_MODULE not defined)
endif

ANDROID_LIBS := $(NDK_ROOT)/../android-libs

COMMON_LIBS := \
	libutils \
	libcutils \
	libui \
	libgui \
	libhardware \
	libmedia \
	libandroid_runtime \
	libbinder \
	liblog \
	libnativehelper \
	libstagefright \
	libskia \
	libssl \
	libcrypto


define gen_lib
$(TARGET_OUT)/$(1).so: $(ANDROID_LIBS)/common/$(1).c
	$(TARGET_CC) $(ANDROID_LIBS)/common/$(1).c -shared -o $(TARGET_OUT)/$(1).so --sysroot=${NDK_ROOT}/platforms/android-9/arch-$(TARGET_ARCH)
endef

$(TARGET_OUT)/$(LOCAL_MODULE).so: $(addsuffix .so, $(addprefix $(TARGET_OUT)/, $(COMMON_LIBS)))

$(foreach LIB,$(COMMON_LIBS),$(eval $(call gen_lib,$(LIB))))
