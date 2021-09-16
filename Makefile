DEB_LINK := https://dldir1.qq.com/music/clntupate/linux/deb/qqmusic_1.1.1_amd64.deb

snap:
	snapcraft snap

# Retrieve app icon from the .deb file.
icon:
	rm -rf snap/gui
	mkdir -p snap/gui
	wget $(DEB_LINK) -O /tmp/qqmusic.deb
	dpkg-deb -x /tmp/qqmusic.deb /tmp/qqmusic
	cp /tmp/qqmusic/usr/share/icons/hicolor/256x256/apps/qqmusic.png snap/gui/
	rm -rf /tmp/qqmusic*

clean:
	rm *.snap

.PHONY: snap icon clean
