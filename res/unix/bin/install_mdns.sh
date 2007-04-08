#!/bin/sh

INSTALL_PATH="${INSTALL_PATH:-$PWD}"

cd "$INSTALL_PATH"

if test -e mdns
then
	echo "Enabling the MDNSDiscovery plugin"
	mkdir plugins &>/dev/null
	PLUGINS=`cat plug`
	echo "plugins.MDNSDiscovery.MDNSDiscovery@file://$INSTALL_PATH/plugins/MDNSDiscovery.jar;$PLUGINS" > plug2
	mv -f plug2 plug
	java -jar bin/sha1test.jar plugins/MDNSDiscovery.jar.url plugins &>/dev/null
	mv plugins/MDNSDiscovery.jar.url plugins/MDNSDiscovery.jar
	rm -f plugins/MDNSDiscovery.jar.url
	rm -f mdns
fi