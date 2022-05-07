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

## Icons

In order to get icons working with dunst - this is what I did

```
for f in `find  /usr/share/icons/oxygen/base/32x32/  -name '*.png' ` ; do cp $f ~/.config/breeze_icons/`basename $f`; done
```
