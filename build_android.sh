pushd src/crunch.Android

ndk-build NDK_PROJECT_PATH=. NDK_APPLICATION_MK=./Application.mk

popd

rm -rf artifacts/android
mkdir -p artifacts/android
mv src/crunch.android/libs artifacts/android
