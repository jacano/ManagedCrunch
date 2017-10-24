ARTIFACT_PATH="ios.zip"
ARTIFACT_NAME="/crunch/$ARTIFACT_PATH"

if [ -z "$DROPBOX_KEY" ] 
	then
	DROPBOX_KEY=$(<secrets/dropboxkey.txt)
fi

DROPBOX_ARGS="Dropbox-API-Arg: {\"path\":\"$ARTIFACT_NAME\", \"mode\":\"overwrite\"}"
DROPBOX_URL="https://content.dropboxapi.com/2/files/upload"
AUTHORIZATION_TOKEN="Authorization: Bearer $DROPBOX_KEY"
CONTENT_TYPE="Content-Type: application/octet-stream"

pushd src/crunch.iOS

zip -r $ARTIFACT_PATH build/libcrunch.a

curl -f -X POST --header "$AUTHORIZATION_TOKEN" --header "$CONTENT_TYPE" --header "$DROPBOX_ARGS" --data-binary @"$ARTIFACT_PATH" "$DROPBOX_URL"

popd