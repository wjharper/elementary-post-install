#!/bin/bash

SCRIPT_DIRECTORTY=${PWD}

function run_setup_program(){
    command=$1
    message=$2
    notify-send  -i /home/nerraw/Pictures/Anchor-01-128.png -t 900000 "${command}" "${message}"  
    eval $command
    killall notify-osd
    
}

function install_java(){
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get remove --purge openjdk*
    sudo apt-get install oracle-java6-installer
    sudo apt-get install oracle-java7-installer
}

function install_assorted_programs(){
    sudo add-apt-repository ppa:upubuntu-com/gtk3
    sudo apt-get install firefox ssh mysql-server terminator python-pip alien dpkg-dev debhelper build-essential libreoffice gnome-tweak-tool unity-tweak-tool
    sudo pip install django

}

function install_fonts(){
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


    mkdir /tmp/sourcesans
    cd /tmp/sourcesans
    wget http://www.fontsquirrel.com/fonts/download/source-code-pro
    mv source-sans-pro source-sans-pro.zip
    unzip -o -j source-sans-pro.zip
    cp *.otf ~/.fonts
    fc-cache -f -v
   
}

function install_emacs(){
    sudo add-apt-repository ppa:cassou/emacs
    sudo apt-get update
    sudo apt-get install emacs24 emacs24-el emacs24-common-non-dfsg
    cd $SCRIPT_DIRECTORY
    mkdir ~/.emacs.d/
    cp ${SCRIPT_DIRECTORY}/files/init.el ~/.emacs.d/
    ./emacs-pkg-install.sh "color-theme-wombat+"
    ./emacs-pkg-install.sh "color-theme-sanityinc"
    ./emacs-pkg-install.sh "color-theme-solarized-light"
    
    
}

function install_git(){
    sudo apt-get install git git-core meld subversion
    git config --global user.name "Warren Harper"
    git config --global user.email warrenjharper@gmail.com
    git config --global core.editor emacs
    git config --global merge.tool meld

}


#Java must be installed before this can be run
function install_owncloud_prereqs(){
    sudo apt-get install lamp-server^
    sudo apt-get install php5-gd php-xml-parser php5-intl smbclient curl libcurl3 php5-curl  
    
}

function terminal_configuration(){
    mkdir -p ~/.config/terminator
    cp ${SCRIPT_DIRECTORY}/files/config ~/.config/terminator
}

function add_icon(){
    cp ${SCRIPT_DIRECTORY}/files/Anchor-01-128.png ~/Pictures
}

function install_sql_developer(){
    run_setup_program "firefox http://www.oracle.com/technetwork/developer-tools/sql-developer/downloads/index.html" "Download Sql Developer" 
    cd ~/Downloads
    sudo alien --scripts *.rpm
    sudo dpkg -i *.deb
    rm *  
}

function install_theme(){
    sudo add-apt-repository ppa:upubuntu-com/nitrux
    sudo apt-get update 
    sudo apt-get install boomerang
    sudo apt-get install zukiwi
    sudo apt-get install elegant-brit-theme
    sudo apt-get install light-greyness-dark-grey
    sudo apt-get install macx-lion
    sudo apt-get install nitruxos
    
    gsettings set org.gnome.desktop.interface gtk-theme 'Boomerang'
    gconftool-2 --set --type string /apps/metacity/general/theme 'Boomerang'
    gsettings set org.gnome.desktop.interface icon-theme 'NITRUX'

}


function elementary_specific_install(){
    sudo add-apt-repository ppa:versable/elementary-update
    sudo apt-get update
    sudo apt-get install elementary-tweaks wingpanel-slim indicator-synapse  elementary-blue-theme elementary-champagne-theme elementary-colors-theme elementary-dark-theme elementary-harvey-theme elementary-lion-theme elementary-milk-theme elementary-plastico-theme elementary-whit-e-theme elementary-thirdparty-icons elementary-plank-themes elementary-wallpaper-collection
}



install_assorted_programs
install_java
install_fonts
install_emacs
install_git
install_owncloud_prereqs
terminal_configuration
add_icon
install_sql_developer
os_name=`lsb_release -i | cut -f 2-`
if [ "$os_name" == "elementary OS" ]; then
    elementary_specific_install
else
    install_theme
fi



