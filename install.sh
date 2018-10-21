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

# USER HOME DIRECTORY
USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

# AUTOSTART
cp -r ./autostart $USER_HOME/.config/

# CONFIG FILES
cp -r ./config $USER_HOME/

# SCRIPTS
cp -r ./bin $USER_HOME/

# FONTS
cp -r .fonts $USER_HOME/

# ALIASES
echo "\n" >> $USER_HOME/.bashrc
echo "alias vifm=\"source $USER_HOME/bin/vf"
echo "alias venv=\"source $USER_HOME/bin/venv.sh\"" >> $USER_HOME/.bashrc

# BASIC APPLICATIONS
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
apt install -y vifm
apt install -y calibre
apt install -y fuse-zip
apt install -y archivemount
apt install -y sshfs
apt install -y chromium-browser

# SUBLIME MERGE
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
apt-get update
apt-get install sublime-merge

# PYTHON
add-apt-repository ppa:deadsnakes/ppa
apt update
apt install -y python3.5
apt install -y python3.6
apt install -y python3.7

# PIPSI
apt install -y python3-venv
cd /tmp
curl https://raw.githubusercontent.com/mitsuhiko/pipsi/master/get-pipsi.py | python3 - --src=git+https://github.com/mitsuhiko/pipsi.git\#egg=pipsi
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc

pipsi install flake8
pipsi install ansible
pipsi install pi3-switch
pipsi install gitup

# SNAPS
snap install spotify
snap install pycharm-professional --classic
snap install intellij-idea-community --classic
snap install clion --classic
snap install insomnia

# DOCKER
addgroup --system docker
adduser $USER docker
newgrp docker
snap install docker --classic
docker volume create portainer_data
docker run -d -p 9000:9000 -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

# THEFUCK
apt install -y thefuck
echo "eval \$(thefuck --alias)" >> $USER_HOME/.bashrc

# VIM
apt install -y vim-gtk
git clone --depth=1 https://github.com/amix/vimrc.git $USER_HOME/.vim_runtime
bash  $USER_HOME/.vim_runtime/install_awesome_vimrc.sh
echo 'augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END' >> $USER_HOME/.vimrc

# FIX BROKEN BLUETOOTH (bluez 5.48 is bugged)
add-apt-repository ppa:bluetooth/bluez
apt update

apt upgrade -y

