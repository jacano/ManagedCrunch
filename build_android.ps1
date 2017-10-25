. ".\helper.ps1"

pushd src/crunch.Android

ndk-build NDK_PROJECT_PATH=. NDK_APPLICATION_MK=./Application.mk

Rename-Item libs build

popd

ZipAndUploadToDropbox ("crunch") ("android.zip") ("src/crunch.android/build")
