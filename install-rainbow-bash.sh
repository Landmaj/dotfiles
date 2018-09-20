#!/usr/bin/env bash

FONTAWESOME_DOWNLOAD_URL="https://github.com/FortAwesome/Font-Awesome/archive/v4.7.0.zip"
POWERLINE_DOWNLOAD_URL="https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf"


TMP=`mktemp -d`
cd $TMP

mkdir -p ~/.fonts

# Get the latest Source Code Pro font
SCP_TAG_LOCATION=`curl --silent -I https://github.com/adobe-fonts/source-code-pro/releases/latest|awk '/Location:/ { print $2 }'`
SCP_PATH=`curl --silent ${SCP_TAG_LOCATION%$'\r'} | awk '/\/archive\//' | grep -oP '\/(.*\.zip)'`
SCP_FONT_URL="https://github.com/"$SCP_PATH
wget $SCP_FONT_URL -O sourcecodepro.zip
unzip sourcecodepro.zip
cp source-code-pro-*/OTF/*.otf ~/.fonts/

# Get the latest FontAwesome font
wget $FONTAWESOME_DOWNLOAD_URL -O fontawesome.zip
unzip fontawesome.zip
cp Font-Awesome-*/fonts/FontAwesome.otf ~/.fonts/

# Get the latest PowerlineSymbols
wget $POWERLINE_DOWNLOAD_URL -O ~/.fonts/PowerlineSymbols.otf

# Setup the fontconfig fallbacks
mkdir -p ~/.fontconfig/conf.d
tee ~/.fontconfig/conf.d/10-rainbow-bash-fallback.conf << EOF
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<!-- fallback fonts when a glyph is not found in the current font-->

<fontconfig>
  <alias>
    <family>Source Code Pro</family>
    <prefer>
      <family>FontAwesome</family>
      <family>PowerlineSymbols</family>
    </prefer>
  </alias>
</fontconfig>
EOF

# Download the rainbox bash
if ! [ -d "~/.rainbow-bash" ]; then
    git clone https://github.com/slok/rainbow-bash.git ~/.rainbow-bash
fi

if [ "`which rbw_load_theme`" = "" ]; then
    tee -a ~/.bashrc << EOF

# Rainbow bash prompt
RBW_PATH=~/.rainbow-bash
source \$RBW_PATH/init.sh
rbw_load_theme simple
EOF
fi
# Update font cache
fc-cache -f -v
# Remove temp files
cd
rm -rf $TMP

echo ""
echo ""
echo "FILES DOWNLOADED"
echo ""
echo "Instructions:"
echo "- Set your terminal emulator to use Source Code Pro Regular (11)"
echo "- (optional) change ~/.bashrc to load a different theme (rbw_load_theme THEME)"
echo "- Restart your terminal emulator"


