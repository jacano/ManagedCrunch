pushd crunch.xcode
xcodebuild -configuration Release
popd

sh upload_ios_build.sh