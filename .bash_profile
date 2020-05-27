# bash profile

XDG_CONFIG_HOME=$HOME/.config
XDG_CACHE_HOME=$HOME/.cache
XDG_DATA_HOME=$HOME/.local/share

[[ -f $HOME/.bashrc ]] && . $HOME/.bashrc
[[ -d "$HOME/.local/bin" ]] && PATH="$HOME/.local/bin:$PATH"

if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi
