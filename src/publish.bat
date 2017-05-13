set PACKAGE_VERSION=1.0.2
set NUGET_KEY=123
set PACKAGE_NAME=ManagedCrunch

set ARTIFACT_NAME=ManagedCrunch.dll
set ARTIFACT_DIR=ManagedCrunch.iOS\bin\Release\
set ARTIFACT_PATH=%ARTIFACT_DIR%%ARTIFACT_NAME%

mkdir %ARTIFACT_DIR%

set AUTHORIZATION_TOKEN="Authorization: Bearer %DROPBOX_KEY%"
set DROPBOX_ARGS="Dropbox-API-Arg: {\"path\":\"/%ARTIFACT_NAME%\"}"
set DROPBOX_URL="https://content.dropboxapi.com/2/files/download"

curl -X POST --header %AUTHORIZATION_TOKEN% --header %DROPBOX_ARGS% -o %ARTIFACT_PATH% %DROPBOX_URL%

nuget pack %PACKAGE_NAME%.nuspec -Version %PACKAGE_VERSION%
nuget push %PACKAGE_NAME%.%PACKAGE_VERSION%.nupkg %NUGET_KEY% -Source https://www.nuget.org/api/v2/package
