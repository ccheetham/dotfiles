export ME_XORG_SESSION_LOG=$ME_XORG_LOG_DIR/xsession.$DISPLAY.log

rm -f $ME_XORG_SESSION_LOG
touch $ME_XORG_SESSION_LOG

xlog "starting session"

if [[ $ME_OS != osx ]]; then
  xrandr -s $ME_XORG_RESOLUTION
  setxkbmap -option ctrl:swapcaps
  config_mice >> $ME_XORG_SESSION_LOG
  exec dbus-launch --exit-with-session i3
fi

# vim: ft=sh et sw=4 sts=4
