sh helper.sh

pushd src/crunch.iOS

xcodebuild -configuration Release -sdk iphonesimulator clean build
xcodebuild -configuration Release -sdk iphoneos clean build
lipo -create -output "build/fat/libcrunch.a" "build/Release-iphoneos/libcrunch.a" "build/Release-iphonesimulator/libcrunch.a"

popd

ZipAndUploadToDropbox "crunch" "ios.zip" "src/crunch.ios/build"