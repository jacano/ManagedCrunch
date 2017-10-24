del /s /f /q lib
del /s /f /q build

pushd ..

call copy_native_libs.ps1 nuget\build\MonoAndroid nuget\build\uap10.0 nuget\build\net45 nuget\build\XamariniOS

xcopy /F /R /Y /I src\ManagedCrunch\android\ManagedCrunch.targets nuget\build\MonoAndroid\*
xcopy /F /R /Y /I src\ManagedCrunch\windows\ManagedCrunch.targets nuget\build\net45\*
xcopy /F /R /Y /I src\ManagedCrunch\uwp\ManagedCrunch.targets nuget\build\uap10.0\*
xcopy /F /R /Y /I src\ManagedCrunch\ios\ManagedCrunch.targets nuget\build\XamariniOS\*

xcopy /F /R /Y /I src\ManagedCrunch\ios\ManagedCrunch.dll.config nuget\build\XamariniOS\*

xcopy /F /R /Y /I output\ManagedCrunch\ManagedCrunch.dll nuget\lib\netstandard1.1\*

popd

set /p PACKAGE_VERSION=<version.txt

nuget pack ManagedCrunch.nuspec -Version %PACKAGE_VERSION%