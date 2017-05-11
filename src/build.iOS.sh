MONO_DIR="/Library/Frameworks/Mono.framework/Versions/Current/Commands/"
NUGET_BIN=$MONO_DIR"nuget"
MSBUILD_BIN=$MONO_DIR"msbuild"

$NUGET_BIN restore ManagedCrunch.iOS.sln
$MSBUILD_BIN ManagedCrunch.iOS.sln /p:Configuration="Release" /p:Platform="Any CPU"

ARTIFACT_NAME="ManagedCrunch.dll"

AUTHORIZATION_TOKEN="Authorization: Bearer "$DROPBOX_KEY
CONTENT_TYPE="Content-Type: application/octet-stream"
DROPBOX_ARGS="Dropbox-API-Arg: {\"path\":\"/"$ARTIFACT_NAME"\", \"mode\":\"overwrite\"}"

curl -X POST "https://content.dropboxapi.com/2/files/upload" -H $AUTHORIZATION_TOKEN -H $CONTENT_TYPE -H $DROPBOX_ARGS --data-binary @$ARTIFACT_NAME