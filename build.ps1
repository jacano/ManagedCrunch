. ".\helper.ps1"

PrepareVSEnviroment

pushd src

nuget.exe restore ManagedCrunch.sln
msbuild ManagedCrunch/ManagedCrunch.csproj /p:Configuration="Release" /p:Platform="AnyCPU"

popd