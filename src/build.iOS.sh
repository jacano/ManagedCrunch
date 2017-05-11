MONO_DIR="/Library/Frameworks/Mono.framework/Versions/Current/Commands/"
NUGET_BIN=$MONO_DIR"nuget"
MSBUILD_BIN=$MONO_DIR"msbuild"

$NUGET_BIN restore ManagedCrunch.iOS.sln
$MSBUILD_BIN ManagedCrunch.iOS.sln /p:Configuration="Release" /p:Platform="Any CPU"