$env:PACKAGE_VERSION = Get-Content .\nuget_version.txt -Raw

nuget.exe pack src/ManagedCrunch/ManagedCrunch.nuspec -Version $env:PACKAGE_VERSION