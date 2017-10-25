. ".\helper.ps1"

DownloadFromDropboxAndUnzip ("crunch") ("output\") ("uwp.zip")
DownloadFromDropboxAndUnzip ("crunch") ("output\") ("windows.zip")
DownloadFromDropboxAndUnzip ("crunch") ("output\") ("android.zip")
DownloadFromDropboxAndUnzip ("crunch") ("output\") ("ios.zip")

PrepareVSEnviroment

pushd src

nuget.exe restore ManagedCrunch.sln
msbuild ManagedCrunch/ManagedCrunch.csproj /p:Configuration="Release" /p:Platform="AnyCPU"

popd