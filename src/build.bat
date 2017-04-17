msbuild crunchlib.sln /p:Configuration="Release" /p:Platform="x86"
msbuild crunchlib.sln /p:Configuration="Release" /p:Platform="x64"
msbuild crunchlib.sln /p:Configuration="Release" /p:Platform="ARM"

msbuild ManagedCrunch.sln /p:Configuration="Release" /p:Platform="Any CPU"

nuget pack ManagedCrunch.nuspec