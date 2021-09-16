# Unofficial Snap package of QQ Music for Linux

## Build the package

```shell
make snap
```

or

```shell
snapcraft snap
```

The result `*.snap` will be put in the current directory.

```shell
➜ ls -hl *.snap
-rw-r--r-- 1 tao tao 106M Sep 16 19:51 qqmusic_1.1.1_amd64.snap
```

### Retrieve app icon

Update the link variable `DEB_LINK` in the `Makefile` if it's necessary, then run:

```shel
make icon
```

The icon will be `snap/gui/qqmusic.png`.

## Install the package

```shell
sudo snap install --devmode ./qqmusic_1.1.1_amd64.snap
```

### Uninstall the snap package

```shell
sudo snap remove qqmusic
```

> Reinstall and update the snap will keep the user's data, however, remove the snap app will remove the user's data, such as login information.

## Reference

* QQMusic Official Website: <https://y.qq.com/download/download.html>
