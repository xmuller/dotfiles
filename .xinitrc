#!/bin/sh

userresources=$HOME/.config/xinit/Xresources
usermodmap=$HOME/.config/xinit/Xmodmap

sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

export XCOMPOSEFILE=$HOME/.config/xinit/XCompose
# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

xset r rate 300 50
setxkbmap fr

numlockx &
dwmblocks &

# while :; do
  ssh-agent dwm
# done
