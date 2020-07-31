#!/bin/sh

. "$HOME/_install_toSource.sh" || exit 0
cd "$INSTALL_PATH"

if test ! -f offline
then
	echo "Downloading freenet-stable-latest.jar"
	java $JOPTS -jar bin/sha1test.jar freenet-stable-latest.jar "$INSTALL_PATH" "$CAFILE" >/dev/null 2>&1 || exit 1 
fi

rm -f freenet.jar
ln -sf freenet-stable-latest.jar freenet.jar

