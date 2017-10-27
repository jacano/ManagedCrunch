. ".\helper.ps1"

pushd src/crunch.Android

ndk-build NDK_PROJECT_PATH=. NDK_APPLICATION_MK=./Application.mk

popd

New-Item "artifacts" -type directory -force
Move-Item "src/crunch.android/libs" "artifacts/android" -Force
