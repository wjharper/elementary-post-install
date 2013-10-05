#!/bin/bash

function run_setup_program(){
    command=$1
    message=$2
    notify-send  -i /home/nerraw/Pictures/Anchor-01-128.png -t 900000 "${command}" "${message}"  
    eval $command
    killall notify-osd
    
}



FONT_NAME="SourceCodePro"
URL="http://sourceforge.net/projects/sourcecodepro.adobe/files/latest/download"


sudo add-apt-repository ppa:versable/elementary-update
sudo add-apt-repository ppa:cassou/emacs

sudo apt-get update
sudo apt-get upgrade

sudo apt-get update
sudo apt-get install emacs24 emacs24-el emacs24-common-non-dfsg firefox elementary-tweaks wingpanel-slim indicator-synapse  elementary-blue-theme elementary-champagne-theme elementary-colors-theme elementary-dark-theme elementary-harvey-theme elementary-lion-theme elementary-milk-theme elementary-plastico-theme elementary-whit-e-theme elementary-thirdparty-icons elementary-plank-themes elementary-wallpaper-collection ssh mysql-server terminator

sudo apt-get install lamp-server^
sudo apt-get install php5-gd php-xml-parser php5-intl smbclient curl libcurl3 php5-curl openjdk-6-jre openjdk-6-jdk
sudo apt-get install alien dpkg-dev debhelper build-essential


mkdir ~/.emacs.d/
mkdir -p ~/.config/terminator
cp init.el ~/.emacs.d/
cp config ~/.config/terminator
cp Anchor-01-128.png ~/Pictures


mkdir /tmp/adodefont
cd /tmp/adodefont
wget ${URL} -O ${FONT_NAME}.zip
unzip -o -j ${FONT_NAME}.zip
mkdir -p ~/.fonts
cp *.otf ~/.fonts
fc-cache -f -v

mkdir /tmp/quicksandfont
cd /tmp/quicksandfont
wget http://www.fontsquirrel.com/fonts/download/Quicksand
mv Quicksand Quicksand.zip
unzip -o -j Quicksand.zip
cp *.otf ~/.fonts
fc-cache -f -v

mkdir /tmp/sourcesans
cd /tmp/sourcesans
wget http://www.fontsquirrel.com/fonts/download/source-sans-pro
mv source-sans-pro source-sans-pro.zip
unzip -o -j source-sans-pro.zip
cp *.otf ~/.fonts
fc-cache -f -v

run_setup_program emacs "Download the following \ncolor-theme-wombat+ \ncolor-theme-sanityinc \ncolor-theme-solarized-light"
run_setup_program "firefox http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html" "Download Sql Developer" 
cd ~/Downloads
sudo alien --scripts *.rpm
sudo dpkg -i *.deb
rm *
run_setup_program switchboard "Change Caps Lock \nTiling shortcut \nMouse \nPlank\nAccount Icon"
