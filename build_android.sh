pushd src/crunch.Android

ndk-build NDK_PROJECT_PATH=. NDK_APPLICATION_MK=./Application.mk

popd

sh upload_android_build.sh