$env:PACKAGE_VERSION = Get-Content .\nuget_version.txt -Raw

nuget.exe pack src/ManagedCrunch/ManagedCrunch.Bindings/ManagedCrunch.Bindings.nuspec -Version $env:PACKAGE_VERSION -OutputDirectory nuget
nuget.exe pack src/ManagedCrunch/ManagedCrunch.Native/ManagedCrunch.Native.nuspec -Version $env:PACKAGE_VERSION -OutputDirectory nuget