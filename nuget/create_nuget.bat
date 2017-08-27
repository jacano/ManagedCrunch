@echo off

set /p PACKAGE_VERSION=<version.txt

nuget pack ManagedCrunch.nuspec -Version %PACKAGE_VERSION%