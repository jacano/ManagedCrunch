sh helper.sh

pushd src/crunch.Android

ndk-build NDK_PROJECT_PATH=. NDK_APPLICATION_MK=./Application.mk

popd

ZipAndUploadToDropbox "crunch" "android.zip" "src/crunch.android/build"
