$REMOTE_FOLDER="crunch"
$ARTIFACT_NAME="windows.zip"
$BUILD_DIR="src/crunch.Windows/classic/build"

$DROPBOX_KEY = $env:DROPBOX_KEY
if([string]::IsNullOrEmpty($DROPBOX_KEY))
{
	$DROPBOX_KEY = Get-Content ".\secrets\dropboxkey.txt"
}

$DROPBOX_URL="https://content.dropboxapi.com/2/files/upload"
$AUTHORIZATION_TOKEN="Authorization: Bearer $DROPBOX_KEY"
$ARTIFACT_REMOTEPATH="/$REMOTE_FOLDER/$ARTIFACT_NAME"
$DROPBOX_ARGS="Dropbox-API-Arg: {\""path\"":\""$ARTIFACT_REMOTEPATH\"", \""mode\"":\""overwrite\""}"
$CONTENT_TYPE="Content-Type: application/octet-stream"

pushd $BUILD_DIR

Compress-Archive -DestinationPath $ARTIFACT_NAME -Path "*" -Force

curl.exe -f -X POST --header $AUTHORIZATION_TOKEN --header $CONTENT_TYPE --header $DROPBOX_ARGS --data-binary @$ARTIFACT_NAME $DROPBOX_URL

popd