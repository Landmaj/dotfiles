cd /tmp

# EXTERNAL REPOSITORIES
# =====================

# GOOGLE CHROME
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - 
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'

# i3wm
/usr/lib/apt/apt-helper download-file http://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2018.01.30_all.deb keyring.deb SHA256:baa43dbbd7232ea2b5444cae238d53bebb9d34601cc000e82f11111b1889078a
dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" >> /etc/apt/sources.list.d/sur5r-i3.list

# rofi
add-apt-repository ppa:jasonpleau/rofi

# UPDATE REPOSITORIES TO APPLY CHANGES
apt-get update

# MINIMAL WORKING DESKTOP ENVIRONMENT
apt install apt install lightdm 
apt installlightdm-gtk-greeter 
apt install lightdm-gtk-greeter-settings 
apt install i3 
apt install compton 
apt install xorg 
apt install xserver-xorg

# DRIVERS
apt install ubuntu-drivers-common 
apt install mesa-utils 
apt install mesa-utils-extra 
apt install intel-microcode

# SYSTEM TOOLS
apt install xbacklight
apt install clipit 
apt install arandr 
apt install light-locker 
apt install xfce4-power-manager 
apt install ntp 
apt install policykit-desktop-privileges 
apt install policykit-1-gnome 
apt install network-manager-gnome 
apt install gnome-disk-tool
apt install gparted
apt install tlp
apt install bluez
apt install blueman 
apt install gnome-system-monitor 
apt install gnome-system-tools
apt install software-properties-gtk
apt install lxappearance 
apt install qt4-qtconfig

# UTILITY
apt install pcmanfm 
apt install gnome-terminal 
apt install rofi 
apt install gedit 
apt install file-roller
apt install gnome-calculator 
apt install gnome-calendar
apt install syncthing
apt install libreoffice
apt install keepassxc
apt install firefox
apt install google-chrome
apt install redshift
apt install redshift-gtk
apt install gimp
apt install transmission
apt install mpv

# MULTIMEDIA
apt install vlc 
apt install nomacs
apt install pavucontrol
apt install feh

# PRINTING
apt install cups 
apt install cups-bsd 
apt install cups-client 
apt install cups-filters 
apt install foomatic-db-compressed-ppds 
apt install openprinting-ppds 
apt install bluez-cups 
apt install hplip 
apt install printer-driver-brlaser printer-driver-c2esp 
apt install printer-driver-foo2zjs 
apt install printer-driver-gutenprint 
apt install printer-driver-hpcups 
apt install printer-driver-min12xxw 
apt install printer-driver-pnm2ppa printer-driver-postscript-hp 
apt install printer-driver-ptouch 
apt install printer-driver-pxljr 
apt install printer-driver-sag-gdi 
apt install printer-driver-splix 
apt install system-config-printer-gnome

# SNAPS
snap install spotify
snap install pycharm-professional --classic --edge
snap install intellij-idea-community --classic --edge

# KEYBOARD BACKLIGHT SCRIPT
mv kbdbacklight /usr/local/bin/
chmod +x /usr/local/bin/kbdbacklight

