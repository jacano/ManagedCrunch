$ARTIFACT_NAME="android.zip"
$ARTIFACT_FOLDER="output\"


$DROPBOX_KEY = $env:DROPBOX_KEY
if([string]::IsNullOrEmpty($DROPBOX_KEY))
{
	$DROPBOX_KEY =  Get-Content ".\secrets\dropboxkey.txt"
}

$DROPBOX_URL="https://content.dropboxapi.com/2/files/download"
$AUTHORIZATION_TOKEN="Authorization: Bearer $DROPBOX_KEY"
$ARTIFACT_REMOTEPATH="/crunch/$ARTIFACT_NAME"
$DROPBOX_ARGS="Dropbox-API-Arg: {\""path\"":\""$ARTIFACT_REMOTEPATH\""}"

pushd $ARTIFACT_FOLDER

New-Item $ARTIFACT_FOLDER -type directory -force

curl.exe -f -X POST --header $AUTHORIZATION_TOKEN --header "$DROPBOX_ARGS" -o $ARTIFACT_FOLDER$ARTIFACT_NAME $DROPBOX_URL

Expand-Archive -Path $ARTIFACT_NAME -Force

popd