set PACKAGE_VERSION=1.0.2
set NUGET_KEY=123
set PACKAGE_NAME=ManagedCrunch

nuget pack %PACKAGE_NAME%.nuspec -Version %PACKAGE_VERSION%
nuget push %PACKAGE_NAME%.%PACKAGE_VERSION%.nupkg %NUGET_KEY% -Source https://www.nuget.org/api/v2/package
