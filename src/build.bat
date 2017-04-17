msbuild crunchlib.sln /p:Configuration="Release" /p:Platform="x86"
msbuild crunchlib.sln /p:Configuration="Release" /p:Platform="x64"
msbuild crunchlib.sln /p:Configuration="Release" /p:Platform="ARM"

nuget pack ManagedCrunch.nuspec