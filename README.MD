i3 on Ubuntu Server from scratch
--------------------------------

WiFi on Ubuntu doesn't work on my laptop for some reason, so this packages must be installed manually:
```
sudo dpkg -i *.dpkg  
wireless-tools
wpa-supplicant
network-manager
``` 

Setup WiFi with this command:  
```
nmcli dev wifi connect SSID password PASSWORD
```

Chromium with hardware video decoding enabled:
```
Chromium VAAPI
https://launchpad.net/~saiarcot895/+archive/ubuntu/chromium-beta
```

Fan speed control:
```
NBFC
https://github.com/hirschmann/nbfc/wiki/First-steps
```

Mainline kernel:
```
https://github.com/GM-Script-Writer-62850/Ubuntu-Mainline-Kernel-Updater
```

Themes:
```
https://github.com/vinceliuice/vimix-gtk-themes  
https://github.com/vinceliuice/vimix-icon-theme  
~/.Xresources -> Xcursor.theme: Paper-Vimix  
```
You can change themes using lxappearance and qt4-qtconfig

Detailed video on i3 customization:  
https://www.youtube.com/watch?v=ARKIwOlazKI

GTK cursor in Chromium:
```
1. cd ~/.icons
2. ln -s <name of the theme you use> default
```

Fonts:
```
https://github.com/be5invis/Iosevka
https://github.com/supermarin/YosemiteSanFranciscoFont
```
