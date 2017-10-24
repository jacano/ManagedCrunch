LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libcrunch
LOCAL_SRC_FILES := $(LOCAL_PATH)/../crunch/crn.cpp
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/../crunch/
include $(BUILD_SHARED_LIBRARY)

