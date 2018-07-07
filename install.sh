RED=`tput setaf 1`
GREEN=`tput setaf 2`
YELLOW=`tput setaf 3`
RESET=`tput sgr0`

if [ "$EUID" -ne 0 ]
  then echo -e  "${RED}Installing packages requires root privileges${RESET}"
  exit
fi

cd /tmp

# EXTERNAL REPOSITORIES
# =====================
echo -e  "${YELLOW}Adding external repositories...${RESET}"
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
echo -e  "${YELLOW}Updating repositories...${RESET}"
apt-get update

echo -e  "${YELLOW}Installing i3wm...${RESET}"
# MINIMAL WORKING DESKTOP ENVIRONMENT
apt install -y lightdm 
apt install -y lightdm-gtk-greeter 
apt install -y lightdm-gtk-greeter-settings 
apt install -y i3 
apt install -y compton 
apt install -y xorg 
apt install -y xserver-xorg

# DRIVERS
echo -e  "${YELLOW}Installing drivers...${RESET}"
apt install -y ubuntu-drivers-common 
apt install -y mesa-utils 
apt install -y mesa-utils-extra 
apt install -y intel-microcode

# SYSTEM TOOLS
echo -e  "${YELLOW}Installing system apps..${RESET}"
apt install -y xbacklight
apt install -y clipit 
apt install -y arandr 
apt install -y light-locker 
apt install -y xfce4-power-manager 
apt install -y ntp 
apt install -y policykit-desktop-privileges 
apt install -y policykit-1-gnome 
apt install -y network-manager-gnome 
apt install -y gnome-disk-tool
apt install -y gparted
apt install -y tlp
apt install -y bluez
apt install -y blueman 
apt install -y gnome-system-monitor 
apt install -y gnome-system-tools
apt install -y software-properties-gtk
apt install -y lxappearance 
apt install -y qt4-qtconfig

# UTILITY
echo -e  "${YELLOW}Installing utility apps...${RESET}"
apt install -y pcmanfm
apt install -y nautilus
apt install -y gnome-terminal 
apt install -y rofi 
apt install -y gedit 
apt install -y file-roller
apt install -y gnome-calculator 
apt install -y gnome-calendar
apt install -y syncthing
apt install -y libreoffice
apt install -y keepassxc
apt install -y firefox
apt install -y google-chrome
apt install -y redshift
apt install -y redshift-gtk
apt install -y gimp
apt install -y transmission
apt install -y mpv

# MULTIMEDIA
echo -e  "${YELLOW}Installing multimedia apps...${RESET}"
apt install -y vlc 
apt install -y nomacs
apt install -y pavucontrol
apt install -y feh

# PRINTING
echo -e  "${YELLOW}Installing packages required for printing...${RESET}"
apt install -y cups 
apt install -y cups-bsd 
apt install -y cups-client 
apt install -y cups-filters 
apt install -y foomatic-db-compressed-ppds 
apt install -y openprinting-ppds 
apt install -y bluez-cups 
apt install -y hplip 
apt install -y printer-driver-brlaser 
apt install -y printer-driver-c2esp 
apt install -y printer-driver-foo2zjs 
apt install -y printer-driver-gutenprint 
apt install -y printer-driver-hpcups 
apt install -y printer-driver-min12xxw 
apt install -y printer-driver-pnm2ppa 
apt install -y printer-driver-postscript-hp 
apt install -y printer-driver-ptouch 
apt install -y printer-driver-pxljr 
apt install -y printer-driver-sag-gdi 
apt install -y printer-driver-splix 
apt install -y system-config-printer-gnome

# SNAPS
echo -e  "${YELLOW}Installing snaps...${RESET}"
snap install spotify
snap install pycharm-professional --classic --edge
snap install intellij-idea-community --classic --edge

# KEYBOARD BACKLIGHT SCRIPT
mv ~/home/$USER/.config/kbdbacklight /usr/local/bin/
chmod +x /usr/local/bin/kbdbacklight

echo -e "${GREEN}All done!${RESET}"
