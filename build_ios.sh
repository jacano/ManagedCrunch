pushd src/crunch.iOS

xcodebuild -configuration Release -sdk iphonesimulator clean build
xcodebuild -configuration Release -sdk iphoneos clean build
lipo -create -output "build/libcrunch.a" "build/Release-iphoneos/libcrunch.a" "build/Release-iphonesimulator/libcrunch.a"

popd

