@echo off

set ARTIFACT_FOLDER=lib\ios\Release\

rmdir /s /q %ARTIFACT_FOLDER%
mkdir %ARTIFACT_FOLDER%

set ARTIFACT_NAME=libcrunch.a
if not defined DROPBOX_KEY ( set /p DROPBOX_KEY=<secrets\dropboxkey.txt )
set AUTHORIZATION_TOKEN="Authorization: Bearer %DROPBOX_KEY%"
set DROPBOX_ARGS="Dropbox-API-Arg: {\"path\":\"/%ARTIFACT_NAME%\"}"
set DROPBOX_URL="https://content.dropboxapi.com/2/files/download"
curl -X POST --header %AUTHORIZATION_TOKEN% --header %DROPBOX_ARGS% -o %ARTIFACT_FOLDER%%ARTIFACT_NAME% %DROPBOX_URL%