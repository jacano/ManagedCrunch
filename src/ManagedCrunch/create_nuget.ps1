pushd ../..

Copy-Item artifacts/windows/* src/ManagedCrunch/build/net45 -Force -Recurse
Copy-Item artifacts/uwp/* src/ManagedCrunch/build/uap10.0 -Force -Recurse
Copy-Item artifacts/android/* src/ManagedCrunch/build/MonoAndroid -Force -Recurse
Copy-Item artifacts/ios/* src/ManagedCrunch/build/XamariniOS -Force -Recurse

popd

#set /p PACKAGE_VERSION=<version.txt

#nuget pack ManagedCrunch.nuspec -Version %PACKAGE_VERSION%