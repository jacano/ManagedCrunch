Remove-Item src -Force -Recurse
Remove-Item build -Force -Recurse

pushd ..

xcopy /F /R /Y /I src\ManagedCrunch\android\ManagedCrunch.targets nuget\build\MonoAndroid\*
xcopy /F /R /Y /I src\ManagedCrunch\windows\ManagedCrunch.targets nuget\build\net45\*
xcopy /F /R /Y /I src\ManagedCrunch\uwp\ManagedCrunch.targets nuget\build\uap10.0\*
xcopy /F /R /Y /I src\ManagedCrunch\ios\ManagedCrunch.targets nuget\build\XamariniOS\*

xcopy /F /R /Y /I src\ManagedCrunch\ios\ManagedCrunch.dll.config nuget\build\XamariniOS\*

xcopy /F /R /Y /I src\ManagedCrunch\CrunchPInvoke.cs nuget\src\*

Copy-Item artifacts/windows/* nuget/build/net45 -Force -Recurse
Copy-Item artifacts/uwp/* nuget/build/uap10.0 -Force -Recurse
Copy-Item artifacts/android/* nuget/build/MonoAndroid -Force -Recurse
Copy-Item artifacts/ios/* nuget/build/XamariniOS -Force -Recurse

popd

#set /p PACKAGE_VERSION=<version.txt

#nuget pack ManagedCrunch.nuspec -Version %PACKAGE_VERSION%