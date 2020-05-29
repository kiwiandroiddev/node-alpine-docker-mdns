#!/usr/bin/env sh

dbus-daemon --system
avahi-daemon --no-chroot &
node index.js