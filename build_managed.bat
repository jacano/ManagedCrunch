@echo off

call prepare_msbuild.bat

pushd src

nuget restore ManagedCrunch.sln
msbuild ManagedCrunch/ManagedCrunch.csproj /p:Configuration="Release" /p:Platform="AnyCPU" /p:OutDir="../../output/ManagedCrunch/"
msbuild ManagedCrunch.iOS/ManagedCrunch.iOS.csproj /p:Configuration="Release" /p:Platform="AnyCPU" /p:OutDir="../../output/ManagedCrunch.iOS/"

popd