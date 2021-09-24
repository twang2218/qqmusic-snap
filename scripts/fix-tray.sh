#!/bin/sh

SNAP_NAME=qqmusic-snap
SNAP_APPARMOR_PROFILE=/var/lib/snapd/apparmor/profiles/snap.${SNAP_NAME}.${SNAP_NAME}

echo "Fix AppArmor profile of ${SNAP_NAME}..."
cp ${SNAP_APPARMOR_PROFILE} ${SNAP_APPARMOR_PROFILE}.bak
patch ${SNAP_APPARMOR_PROFILE} <<EOF
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
EOF

diff -u ${SNAP_APPARMOR_PROFILE}.bak ${SNAP_APPARMOR_PROFILE}

echo "Reloading the AppArmor profile for ${SNAP_NAME}..."
apparmor_parser -r ${SNAP_APPARMOR_PROFILE}

echo "Done."
