#!/bin/bash -e

cwd=$(pwd)

sudo apt install -y cmake libudev-dev libevdev-dev libyaml-cpp-dev

cd /tmp
git clone https://gitlab.com/interception/linux/tools.git
cd tools
mkdir build && cd build
cmake ..
make
sudo make install


cd /tmp
git clone https://github.com/zsugabubus/interception-k2k
cd interception-k2k
make CONFIG_DIR=caps2esc
sudo make install CONFIG_DIR=caps2esc

sudo cp "${cwd}"/miscellaneous/udevmon.yaml /etc/udevmon.yaml
sudo cp "${cwd}"/miscellaneous/udevmon.service /etc/systemd/system/udevmon.service
sudo systemctl enable --now udevmon
