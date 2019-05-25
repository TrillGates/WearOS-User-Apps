rm -r **/Android.mk

for d in */; do
    cd $d
    echo "LOCAL_PATH := \$(call my-dir)" >> Android.mk
    echo "include \$(CLEAR_VARS)" >> Android.mk
    echo "LOCAL_MODULE_TAGS := optional" >> Android.mk
    echo "LOCAL_MODULE := ${d::-1}" >> Android.mk
    echo "LOCAL_CERTIFICATE := PRESIGNED" >> Android.mk
    # echo "LOCAL_PRIVILEGED_MODULE := true" >> Android.mk # For system apps
    echo "LOCAL_SRC_FILES := ${d::-1}.apk" >> Android.mk
    echo "LOCAL_MODULE_CLASS := APPS" >> Android.mk
    echo "LOCAL_MODULE_SUFFIX := \$(COMMON_ANDROID_PACKAGE_SUFFIX)" >> Android.mk
    echo "include \$(BUILD_PREBUILT)" >> Android.mk
    cd ..
done
