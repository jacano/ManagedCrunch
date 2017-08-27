@echo off

call prepare_msbuild.bat

pushd src

msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="x86" /p:OutputPath="output"
msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="x64" /p:OutputPath="output"
msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="ARM" /p:OutputPath="output"
msbuild libCrunch.sln /p:Configuration="Release" /p:Platform="ARM64" /p:OutputPath="output"

nuget restore ManagedCrunch.sln
msbuild ManagedCrunch\ManagedCrunch.csproj /p:Configuration="Release" /p:Platform="AnyCPU" /p:OutputPath="..\..\output\ManagedCrunch"
msbuild ManagedCrunch.iOS\ManagedCrunch.iOS.csproj /p:Configuration="Release" /p:Platform="AnyCPU" /p:OutputPath="..\..\output\ManagedCrunch.iOS"

popd
