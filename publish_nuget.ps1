$env:PACKAGE_VERSION = Get-Content .\nuget_version.txt -Raw
if (-not (Test-Path env:NUGET_KEY)) { $env:NUGET_KEY = Get-Content .\secrets\nuget_key.txt -Raw }

nuget.exe push ManagedCrunch.Bindings.$env:PACKAGE_VERSION.nupkg $env:NUGET_KEY -Source https://www.nuget.org/api/v2/package
nuget.exe push ManagedCrunch.Native.$env:PACKAGE_VERSION.nupkg $env:NUGET_KEY -Source https://www.nuget.org/api/v2/package