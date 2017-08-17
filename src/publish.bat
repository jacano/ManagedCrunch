set NUGET_KEY=123

set /p PACKAGE_VERSION=<version.txt
nuget push ManagedCrunch.%PACKAGE_VERSION%.nupkg %NUGET_KEY% -Source https://www.nuget.org/api/v2/package
