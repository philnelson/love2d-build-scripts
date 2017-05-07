#!/bin/bash

# the root folder that contains all your love assets, main.lua, etc.
LOVE_FOLDER=""
# The macOS output name, e.g. YourGame.app
APP_NAME=""
# The name of the .zip file you downloaded from love2d.org. Such as: love-0.10.2-macosx-x64.zip
LOVE_MACOS_ZIP=""
# The name you want to use for the final, zipped, output, suitable for distribution on itch.io via butler. Such as: YourGame.zip
DIST_NAME=""

cd $LOVE_FOLDER
echo "Zipping .love folder"
zip -q -r -9 appzipped.love .
mv appzipped.love ../Bin
cd ../Bin

echo "Removing Old Rassler.app"
rm -rf Release/$APP_NAME
rm -rf Release/rassler_macos.zip

echo "Copying New app"
cp -rf love.app $APP_NAME
mv appzipped.love Rassler.app/Contents/Resources/SuperGame.love
mv $APP_NAME Release/
cd Release
echo "Zipping up the app"
zip -q -r -9 $DIST_NAME $APP_NAME
