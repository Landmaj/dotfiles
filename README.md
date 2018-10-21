i3 on Ubuntu Mate
--------------------------------
Tested on 18.04 (23 July 2018).
It will mostly work on Ubuntu 16.04 but some modifications are necessary. For example Rofi is not in default repositories and has to be added manually.

Install git, clone this repository and run `install.sh`.
This will install i3, configure Mate and also install 
some other useful applications.

i3bar is disabled in the configuration file and I use Mate panel instead,
so install this applet to get workspace indicator:
[mate-i3-applet](https://github.com/city41/mate-i3-applet)


Fan speed control:
```
NBFC
Run nbfc.sh from this repo
https://github.com/hirschmann/nbfc/wiki/First-steps
```

Mainline kernel:
```
https://github.com/GM-Script-Writer-62850/Ubuntu-Mainline-Kernel-Updater
```