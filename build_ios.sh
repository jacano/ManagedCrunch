pushd src/crunch.iOS

xcodebuild -configuration Release -sdk iphonesimulator clean build
xcodebuild -configuration Release -sdk iphoneos clean build

mkdir -p fat
lipo -create -output "fat/libcrunch.a" "build/Release-iphoneos/libcrunch.a" "build/Release-iphonesimulator/libcrunch.a"

popd

rm -rf artifacts/ios
mkdir -p artifacts/ios
mv src/crunch.ios/fat/ artifacts/ios
