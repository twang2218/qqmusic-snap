# Unofficial Snap package of QQ Music for Linux

<h1 align="center">
  <img src="./snap/gui/qqmusic.png" alt="QQ Music">
  <br />
  QQ Music
</h1>

<p align="center"><b>This is the snap for QQ Music</b>, <i>“QQ Music provides massive high-quality music for you.”</i>. It works on Ubuntu, Fedora, Debian, and other major Linux
distributions.</p>

<!-- Uncomment and modify this when you are provided a build status badge
<p align="center">
<a href="https://snapcraft.io/qqmusic">
  <img alt="enpass" src="https://snapcraft.io/qqmusic/badge.svg" />
</a>
<a href="https://snapcraft.io/qqmusic">
  <img alt="enpass" src="https://snapcraft.io/qqmusic/trending.svg?name=0" />
</a>
</p>
-->

![qqmusic main screen](doc/screenshot-main.png?raw=true "qqmusic main screen")
![qqmusic song lyrics](doc/screenshot-lyrics.png?raw=true "qqmusic song lyrics")
![qqmusic login](doc/screenshot-login.png?raw=true "qqmusic login")


<p align="center">Published for <img src="https://raw.githubusercontent.com/anythingcodes/slack-emoji-for-techies/gh-pages/emoji/tux.png" align="top" width="24" /> with 💝 by Snapcrafters</p>

## Install

    sudo snap install qqmusic-snap

<!-- Uncomment and modify this when your snap is available on the store -->
[![Get it from the Snap Store](https://snapcraft.io/static/images/badges/en/snap-store-white.svg)](https://snapcraft.io/qqmusic-snap)


([Don't have snapd installed?](https://snapcraft.io/docs/core/install))

## Remaining tasks
<!-- Uncomment and modify this when you have a screenshot
![qqmusic](screenshot.png?raw=true "qqmusic")
-->

Snapcrafters ([join us](https://forum.snapcraft.io/t/join-snapcrafters/1325)) 
are working to land snap install documentation and
the [snapcraft.yaml](https://github.com/snapcrafters/fork-and-rename-me/blob/master/snap/snapcraft.yaml)
upstream so [QQ Music](https://y.qq.com/download/download.html) can authoritatively publish future releases.

  - [x] Click the green "Use this template" button above to create a new repository based on this template
  - [x] Give the newly created repository a sensible name, like `godzilla-snap` if you're snapping the Godzilla software
  - [x] Update the description of the repository
  - [x] Update logos and references to `[QQ Music]` and `[qqmusic]`
  - [x] Create a snap that runs in `devmode`
  - [x] Register the snap in the store, **using the preferred upstream name**
  - [x] Add a screenshot to this `README.md`
  - [ ] Publish the `devmode` snap in the Snap store edge channel
  - [x] Add install instructions to this `README.md`
  - [x] Update snap store metadata, icons and screenshots
  - [x] Convert the snap to `strict` confinement, or `classic` confinement if it qualifies
  - [ ] Publish the confined snap in the Snap store beta channel
  - [x] Update the install instructions in this `README.md`
  - [ ] Post a call for testing on the [Snapcraft Forum](https://forum.snapcraft.io) - [link]()
  - [ ] Make a post in the [Snapcraft Forum](https://forum.snapcraft.io) asking for a transfer of the snap name from you to snapcrafters - [link]()
  - [ ] Ask a [Snapcrafters admin](https://github.com/orgs/snapcrafters/people?query=%20role%3Aowner) to fork your repo into github.com/snapcrafters, and configure the repo for automatic publishing into edge on commit
  - [ ] Add the provided Snapcraft build badge to this `README.md`
  - [ ] Publish the snap in the Snap store stable channel
  - [ ] Update the install instructions in this `README.md`
  - [ ] Post an announcement in the [Snapcraft Forum](https://forum.snapcraft.io) - [link]()
  - [ ] Submit a pull request or patch upstream that adds snap install documentation - [link]()
  - [ ] Submit a pull request or patch upstream that adds the `snapcraft.yaml` and any required assets/launchers - [link]()
  - [ ] Add upstream contact information to the `README.md`  
  - If upstream accept the PR:
    - [ ] Request upstream create a Snap store account
    - [ ] Contact the Snap Advocacy team to request the snap be transferred to upstream
  - [ ] Ask the Snap Advocacy team to celebrate the snap - [link]()

If you have any questions, [post in the Snapcraft forum](https://forum.snapcraft.io).

<!--
## The Snapcrafters

| [![Your Name](https://gravatar.com/avatar/bc0bced65e963eb5c3a16cab8b004431/?s=128)](https://github.com/yourname/) |
| :---: |
| [Your Name](https://github.com/yourname/) |
--> 

<!-- Uncomment and modify this when you have upstream contacts
## Upstream

| [![Upstream Name](https://gravatar.com/avatar/bc0bced65e963eb5c3a16cab8b004431?s=128)](https://github.com/upstreamname) |
| :---: |
| [Upstream Name](https://github.com/upstreamname) |
-->

# Development

## Build the package

```shell
snapcraft snap
```

The result `*.snap` will be put in the current directory.

```shell
➜ ls -hl *.snap
-rw-r--r-- 1 tao tao 106M Sep 16 19:51 qqmusic-snap_1.1.1_amd64.snap
```

### Retrieve app icon

Update the link variable `DEB_LINK` in the `Makefile` if it's necessary, then run:

```shel
make icon
```

The icon will be `snap/gui/qqmusic.png`.

## Install the package from local

```shell
sudo snap install --dangerous ./qqmusic-snap_1.1.1_amd64.snap
```

## Known Issues

### Tray icon not working properly

As `unity7` is missing the path `com/canonical/dbusmenu` in the profile, so the tray icon is not working at the moment. To fix the problem, the profile can be modified manually.

> The profile will be overwritten by reinstall/update the snap, so if the tray icon is not working anymore, you can check whether is the profile problem, and repeat the above again if it's necessary.
>Those operation should not be necessary after the snap team fix the problem.

#### Fix by provided `fix-tray.sh` script

This snap provided a script to help the AppArmor profile modification.

```shell
$ sudo /snap/qqmusic-snap/current/fix-tray.sh
Fix AppArmor profile of qqmusic-snap...
patching file /var/lib/snapd/apparmor/profiles/snap.qqmusic-snap.qqmusic-snap
--- /var/lib/snapd/apparmor/profiles/snap.qqmusic-snap.qqmusic-snap.bak	2021-09-24 21:40:15.083746116 +1000
+++ /var/lib/snapd/apparmor/profiles/snap.qqmusic-snap.qqmusic-snap	2021-09-24 21:40:15.083746116 +1000
@@ -973,21 +973,21 @@
 # dbusmenu
 dbus (send)
     bus=session
-    path=/{MenuBar{,/[0-9A-F]*},com/canonical/menu/[0-9A-F]*}
+    path=/{MenuBar{,/[0-9A-F]*},com/canonical/menu/[0-9A-F]*,com/canonical/dbusmenu}
     interface=com.canonical.dbusmenu
     member="{LayoutUpdated,ItemsPropertiesUpdated}"
     peer=(name=org.freedesktop.DBus, label=unconfined),
 
 dbus (receive)
     bus=session
-    path=/{MenuBar{,/[0-9A-F]*},com/canonical/menu/[0-9A-F]*}
+    path=/{MenuBar{,/[0-9A-F]*},com/canonical/menu/[0-9A-F]*,com/canonical/dbusmenu}
     interface="{com.canonical.dbusmenu,org.freedesktop.DBus.Properties}"
     member=Get*
     peer=(label=unconfined),
 
 dbus (receive)
     bus=session
-    path=/{MenuBar{,/[0-9A-F]*},com/canonical/menu/[0-9A-F]*}
+    path=/{MenuBar{,/[0-9A-F]*},com/canonical/menu/[0-9A-F]*,com/canonical/dbusmenu}
     interface=com.canonical.dbusmenu
     member="{AboutTo*,Event*}"
     peer=(label=unconfined),
Reloading the AppArmor profile for qqmusic-snap...
Done.
```

Rerun the `qqmusic-snap`, the systray icon should work correctly.


#### Fix by hand


```shell
sudo vi  /var/lib/snapd/apparmor/profiles/snap.qqmusic-snap.qqmusic-snap
```

use `/dbusmenu` find the `# dbusmenu` section, and add the path to the first 3 parts. Don't forget backup the old profile.

```diff
--- snap.qqmusic.qqmusic.bak	2021-09-19 12:47:04.518276613 +1000
+++ snap.qqmusic.qqmusic	2021-09-19 12:44:02.897018611 +1000
@@ -973,21 +973,21 @@
 # dbusmenu
 dbus (send)
     bus=session
-    path=/{MenuBar{,/[0-9A-F]*},com/canonical/menu/[0-9A-F]*}
+    path=/{MenuBar{,/[0-9A-F]*},com/canonical/menu/[0-9A-F]*,com/canonical/dbusmenu}
     interface=com.canonical.dbusmenu
     member="{LayoutUpdated,ItemsPropertiesUpdated}"
     peer=(name=org.freedesktop.DBus, label=unconfined),
 
 dbus (receive)
     bus=session
-    path=/{MenuBar{,/[0-9A-F]*},com/canonical/menu/[0-9A-F]*}
+    path=/{MenuBar{,/[0-9A-F]*},com/canonical/menu/[0-9A-F]*,com/canonical/dbusmenu}
     interface="{com.canonical.dbusmenu,org.freedesktop.DBus.Properties}"
     member=Get*
     peer=(label=unconfined),
 
 dbus (receive)
     bus=session
-    path=/{MenuBar{,/[0-9A-F]*},com/canonical/menu/[0-9A-F]*}
+    path=/{MenuBar{,/[0-9A-F]*},com/canonical/menu/[0-9A-F]*,com/canonical/dbusmenu}
     interface=com.canonical.dbusmenu
     member="{AboutTo*,Event*}"
     peer=(label=unconfined),
```

Then reload the profile:

```shell
sudo apparmor_parser -r /var/lib/snapd/apparmor/profiles/snap.qqmusic-snap.qqmusic-snap
```

Rerun the `qqmusic-snap`, the systray icon should work correctly.

### Uninstall the snap package

```shell
sudo snap remove qqmusic-snap
```

> Reinstall and update the snap will keep the user's data, however, remove the snap app will remove the user's data, such as login information.

## Reference

* QQMusic Official Website: <https://y.qq.com/download/download.html>
