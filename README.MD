i3 on Ubuntu Server from scratch
--------------------------------

### WiFi on Ubuntu doesn't work on my laptop for some reason, so this packages must be installed manually:
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

### Basic stuff to get a working i3:
```
sudo apt-get install lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings i3 compton xorg xserver-xorg
```

### Drivers and other stuff:
```
sudo apt-get install ubuntu-drivers-common mesa-utils mesa-utils-extra intel-microcode
```

### Basic utility tools (file manager, terminal, app launcher, screen locker, clipboard, GUI WiFi config, GUI power settings):
```
sudo apt-get pcmanfm gnome-terminal rofi xbacklight arandr xfce4-power-manager light-locker clipit network-manager-gnome policykit-desktop-privileges policykit-1-gnome ntp gedit
```

### Multimedia apps (video player, image viewer, volume control):
```
sudo apt-get install vlc nomacs tlp pavucontrol feh
```

# Printing
```
sudo apt-get install cups cups-bsd cups-client cups-filters foomatic-db-compressed-ppds openprinting-ppds bluez-cups hplip printer-driver-brlaser printer-driver-c2esp printer-driver-foo2zjs printer-driver-gutenprint printer-driver-hpcups rinter-driver-min12xxw printer-driver-pnm2ppa printer-driver-postscript-hp printer-driver-ptouch printer-driver-pxljr printer-driver-sag-gdi printer-driver-splix system-config-printer-gnome
```

### Some apps from Ubuntu repos (bluetooth, etc):
```
sudo apt-get install syncthing libreoffice keepassxc tlp bluez blueman gnome-system-monitor gnome-system-tools firefox
```

### Other apps:
My favorite text editor:
```
Micro
curl https://getmic.ro | bash
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
Keyboard backlight script. Put it somewhere in PATH, xfce4-power-manager will take care of the rest
```
https://unix.stackexchange.com/a/367508
```  
Snaps:
```
sudo snap install spotify
sudo snap install pycharm-professional --classic
sudo snap install intellij-idea-community --classic --edge
``` 


### Themes
```
sudo apt install lxappearance qt4-qtconfig
```
https://github.com/vinceliuice/vimix-gtk-themes  
https://github.com/vinceliuice/vimix-icon-theme  
~/.Xresources -> Xcursor.theme: Paper-Vimix  

Changing themes is done using lxappearance and qt4-qtconfig

Detailed video on i3 customization:  
https://www.youtube.com/watch?v=ARKIwOlazKI

GTK cursor in Chromium:
```
1. cd ~/.icons
2. ln -s <name of the theme you use> default
```
