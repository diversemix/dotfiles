# Configuration with i3

Example config file in this folder copy to: ~/.config/i3/config

## dunst

See config file in this folder to replace /etc/xdg/dunst/dunstrc

More info: https://wiki.archlinux.org/index.php/Dunst


## Unlocking the key ring
Add to ~/.profile 

```
  export $(gnome-keyring-daemon -s)
```

## Natural mouse scrolling

The final line in the config does it for touchpads. However for mice, add the following line to the right section in `/usr/share/X11/xorg.conf.d/40-libinput.conf`
```
Option "NaturalScrolling" "True"
```
