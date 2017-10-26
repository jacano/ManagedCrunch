sh helper.sh

pushd src/crunch.iOS

xcodebuild -configuration Release -sdk iphonesimulator clean build
xcodebuild -configuration Release -sdk iphoneos clean build

pushd build

mkdir -p fat

lipo -create -output "fat/libcrunch.a" "Release-iphoneos/libcrunch.a" "Release-iphonesimulator/libcrunch.a"

popd

popd

ZipAndUploadToDropbox "crunch" "ios.zip" "src/crunch.ios/build"