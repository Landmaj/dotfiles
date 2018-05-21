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

### Basic stuff to get a working desktop environment:
```
sudo apt-get install lightdm lightdm-gtk-greeter lightdm-gtk-greeter-settings i3 compton xorg xserver-xorg
```

### Drivers and other stuff:
```
sudo apt-get install ubuntu-drivers-common mesa-utils mesa-utils-extra intel-microcode
```

### Basic tools:
```
sudo apt-get pcmanfm gnome-terminal rofi xbacklight arandr xfce4-power-manager light-locker feh clipit network-manager-gnome bluez blueman pavucontrol tlp
```

### Some apps from Ubuntu repos:
```
sudo apt-get install vlc syncthing libreoffice keepassxc
```

### Other apps:
Micro (curl https://getmic.ro | bash)  
Chromium VAAPI (https://launchpad.net/~saiarcot895/+archive/ubuntu/chromium-beta)  
```
sudo snap install spotify
sudo snap install pycharm-professional --classic
sudo snap install intellij-idea-community --classic --edge
``` 
NBFC (https://github.com/hirschmann/nbfc/wiki/First-steps)  
Keyboad backlight (https://unix.stackexchange.com/a/367508)  


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