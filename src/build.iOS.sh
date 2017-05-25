MONO_DIR="/Library/Frameworks/Mono.framework/Versions/Current/Commands/"
NUGET_BIN=$MONO_DIR"nuget"
MSBUILD_BIN=$MONO_DIR"msbuild"


pushd crunch.xcode
xcodebuild -configuration Release
popd

cp crunch.xcode/build/Release-iphoneos/libcrunch.a ManagedCrunch.iOS/

$NUGET_BIN restore ManagedCrunch.iOS.sln
$MSBUILD_BIN ManagedCrunch.iOS.sln /p:Configuration="Release" /p:Platform="Any CPU"

ARTIFACT_NAME="ManagedCrunch.dll"
ARTIFACT_PATH="ManagedCrunch.iOS/bin/Release/$ARTIFACT_NAME"

AUTHORIZATION_TOKEN="Authorization: Bearer $DROPBOX_KEY"
CONTENT_TYPE="Content-Type: application/octet-stream"
DROPBOX_ARGS="Dropbox-API-Arg: {\"path\":\"/$ARTIFACT_NAME\", \"mode\":\"overwrite\"}"
DROPBOX_URL="https://content.dropboxapi.com/2/files/upload"

curl -X POST --header "$AUTHORIZATION_TOKEN" --header "$CONTENT_TYPE" --header "$DROPBOX_ARGS" --data-binary @"$ARTIFACT_PATH" "$DROPBOX_URL"