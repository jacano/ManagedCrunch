pushd src/crunch.iOS

xcodebuild -configuration Release -sdk iphonesimulator clean build
xcodebuild -configuration Release -sdk iphoneos clean build

pushd build

mkdir -p fat

lipo -create -output "fat/libcrunch.a" "Release-iphoneos/libcrunch.a" "Release-iphonesimulator/libcrunch.a"

popd

popd


REMOTE_FOLDER="crunch"
ARTIFACT_NAME="ios.zip"
BUILD_DIR="src/crunch.ios/build"

if [ -z "$DROPBOX_KEY" ]
	then
	DROPBOX_KEY=$(<secrets/dropboxkey.txt)
fi

DROPBOX_ARGS="Dropbox-API-Arg: {\"path\":\"$REMOTE_FOLDER/$ARTIFACT_NAME\", \"mode\":\"overwrite\"}"
DROPBOX_URL="https://content.dropboxapi.com/2/files/upload"
AUTHORIZATION_TOKEN="Authorization: Bearer $DROPBOX_KEY"
CONTENT_TYPE="Content-Type: application/octet-stream"

pushd $BUILD_DIR

zip -r $ARTIFACT_NAME .

curl -f -X POST --header "$AUTHORIZATION_TOKEN" --header "$CONTENT_TYPE" --header "$DROPBOX_ARGS" --data-binary @"$ARTIFACT_NAME" "$DROPBOX_URL"

popd
