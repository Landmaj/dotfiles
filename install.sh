apt remove -y plank
apt remove -y atril
apt remove -y onboard onboard-common
apt remove -y orca
apt remove -y xzoom
rm -rf /usr/share/applications/screensavers

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

# GOOGLE CHROME
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
apt install -y google-chrome-stable

# PYTHON
add-apt-repository ppa:deadsnakes/ppa
apt install -y python3.5
apt install -y python3.6
apt install -y python3.7


# SNAPS
snap install spotify
snap install pycharm-professional --classic
snap install intellij-idea-community --classic
snap install sublime-text --classic
snap install insomnia
