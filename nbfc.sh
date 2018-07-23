cd /tmp/
git clone --depth 1 https://github.com/hirschmann/nbfc.git
cd nbfc/
sudo apt-get install mono-complete
./build.sh 
sudo mkdir -p /opt/nbfc/
sudo cp -r ./Linux/bin/Release/* /opt/nbfc/
sudo cp ./Linux/*.service /etc/systemd/system/
sudo systemctl enable nbfc --now

echo "Recommended config:
/opt/nbfc/nbfc.exe config -r"

echo "Use: /opt/nbfc/nbfc.exe config --set \"Asus Zenbook UX310UA\""
echo "/opt/nbfc/nbfc.exe start -e"