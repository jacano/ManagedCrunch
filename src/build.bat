set VS2017="%ProgramFiles(x86)%\Microsoft Visual Studio\2017\Enterprise\Common7\Tools\VsMSBuildCmd.bat"
if exist %VS2017% (call %VS2017%)

msbuild crunchlib.sln /p:Configuration="Release" /p:Platform="x86"
msbuild crunchlib.sln /p:Configuration="Release" /p:Platform="x64"
msbuild crunchlib.sln /p:Configuration="Release" /p:Platform="ARM"
msbuild crunchlib.sln /p:Configuration="Release" /p:Platform="ARM64"

nuget restore ManagedCrunch.sln
msbuild ManagedCrunch.sln /p:Configuration="Release" /p:Platform="Any CPU"