@echo off

call prepare_msbuild.bat

pushd src

msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="x86"
msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="x64"
msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="ARM"
msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="ARM64"

nuget restore ManagedCrunch.sln
msbuild ManagedCrunch.sln /p:Configuration="Release" /p:Platform="Any CPU"

popd
