#!/usr/bin/env bash

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

apt remove -y plank
apt remove -y atril
apt remove -y onboard onboard-common
apt remove -y orca
apt remove -y xzoom
rm -rf /usr/share/applications/screensavers

# BASIC i3

apt install -y i3-wm
apt install -y rofi

# GSETTINGS

gsettings set org.mate.mate-menu hot-key ''
gsettings set com.solus-project.brisk-menu hot-key ''
gsettings set org.mate.power-manager kbd-backlight-battery-reduce false
gsettings set org.mate.power-manager idle-dim-battery false
gsettings set org.mate.background show-desktop-icons false
gsettings set org.mate.power-manager backlight-battery-reduce false
gsettings set org.mate.session required-components-list "['windowmanager', 'panel']"
gsettings set org.mate.session.required-components windowmanager 'i3'


apt install -y ntp
apt install -y dconf-editor
apt install -y arandr
apt install -y gparted
apt install -y tlp
apt install -y syncthing
apt install -y libreoffice
apt install -y keepassxc
apt install -y redshift redshift-gtk
apt install -y gimp
apt install -y transmission
apt install -y vlc
apt install -y pgcli

# GOOGLE CHROME
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
apt update
apt install -y google-chrome-stable

# PYTHON
add-apt-repository ppa:deadsnakes/ppa
apt update
apt install -y python3.5
apt install -y python3.6
apt install -y python3.7

apt install -y python3-venv
cd /tmp
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python3 - --src=git+https://github.com/mitsuhiko/pipsi.git\#egg=pipsi
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

pipsi install flake8
pipsi install ansible


# SNAPS
snap install spotify
snap install pycharm-professional --classic
snap install intellij-idea-community --classic
snap install vscode --classic
snap install insomnia


# DOCKER
addgroup --system docker
adduser $USER docker
newgrp docker
snap install docker --classic
docker volume create portainer_data
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer


# AUTOSTART
USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)
cp -r ./autostart $USER_HOME/.config/


# ALIASES

echo "\n" >> $USER_HOME/.bashrc
echo "alias venv=\"source $PWD/venv.sh\"" >> $USER_HOME/.bashrc
echo "alias gitlog=\"git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit\"" >> $USER_HOME/.bashrc


# THEFUCK
apt install -y thefuck
echo "eval \$(thefuck --alias)" >> $USER_HOME/.bashrc

# THEMES
cd /tmp
git clone https://github.com/vinceliuice/vimix-gtk-themes.git
git clone https://github.com/vinceliuice/vimix-icon-theme
cd /tmp/vimix-icon-theme
bash ./Installer.sh
cd /tmp/vimix-gtk/theme
bash ./Vimix-installer

# FIX BROKEN BLUETOOTH (bluez 5.48 is bugged)
add-apt-repository ppa:bluetooth/bluez
apt update

apt upgrade -y
