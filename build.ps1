. ".\helper.ps1"

PrepareVSEnviroment

pushd src

nuget.exe restore ManagedCrunch.sln
msbuild ManagedCrunch/ManagedCrunch.csproj /p:Configuration="Release" /p:Platform="AnyCPU"

popd

Copy-Item artifacts/windows/* src/ManagedCrunch/windows -Force -Recurse
Copy-Item artifacts/uwp/* src/ManagedCrunch/uwp -Force -Recurse
Copy-Item artifacts/android/* src/ManagedCrunch/android -Force -Recurse
Copy-Item artifacts/ios/* src/ManagedCrunch/ios -Force -Recurse