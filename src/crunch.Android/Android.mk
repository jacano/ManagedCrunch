LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libcrunch
LOCAL_C_INCLUDES := $(LOCAL_PATH)/../crunch/
LOCAL_SRC_FILES := $(LOCAL_PATH)/../crunch/crn.cpp
include $(BUILD_SHARED_LIBRARY)

