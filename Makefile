snap:
	snapcraft snap

# Retrieve app icon from the .deb file.
icon:
	$(eval DEB := $(shell curl -fsSL https://y.qq.com/download/download.html | egrep -o 'https://[^"]+amd64.deb' | head -n 1))
	rm -rf snap/gui
	mkdir -p snap/gui
	wget $(DEB) -O /tmp/qqmusic.deb
	dpkg-deb -x /tmp/qqmusic.deb /tmp/qqmusic
	cp /tmp/qqmusic/usr/share/icons/hicolor/256x256/apps/qqmusic.png snap/gui/
	rm -rf /tmp/qqmusic*

update:
	$(eval DEB := $(shell curl -fsSL https://y.qq.com/download/download.html | egrep -o 'https://[^"]+amd64.deb' | head -n 1))
	$(eval VERSION := $(shell echo $(DEB) | sed -n "s/.*qqmusic_\(.*\)_amd64\.deb/\1/p"))
	@echo "DEB = $(DEB)"
	@echo "VERSION = $(VERSION)"
	sed -i \
		-e "s/^version:.*$$/version: '$(VERSION)'/" \
		-e "s#source: http.*.deb#source: $(DEB)#" \
		snap/snapcraft.yaml

clean:
	rm *.snap

.PHONY: snap icon clean
