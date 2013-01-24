LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

# This is the target being built.
LOCAL_MODULE:= libnativehelper

LOCAL_ARM_MODE := arm

# All of the source files that we will compile.
LOCAL_SRC_FILES:= \
    common/libnativehelper.c

include $(BUILD_SHARED_LIBRARY)