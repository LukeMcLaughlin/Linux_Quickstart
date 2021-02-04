#!/bin/bash

#==============================================
# SOFTWARE INSTALLATION SCRIPT FOR MANJARO: 
#==============================================

# Return to home directory:
cd ~

# System Updates:
sudo apt-get update
sudo apt-get upgrade

# Update mirrors and find fastest:
# apt-get install netselect-apt
# netselect-apt -c europe -t 15 -a amd64 -n testing

#==============================================
# INSTALL SYSTEM UTILITIES: 
#==============================================
# echo 'y' | sudo pacman -S htop
# echo 'y' | sudo pacman -S neofetch

#==============================================
# INSTALL PROGRAMS: 
#==============================================
# Make directory for Installers:
mkdir /home/kubuntu/Downloads/UniversalInstallers

# Lastpass:
wget --output-document=/home/kubuntu/Downloads/Universal_Installers/lplinux.tar.bz2 https://download.cloud.lastpass.com/linux/lplinux.tar.bz2
cd ~Downloads/Universal_Installers
tar xjvf lplinux.tar.bz2
./install_lastpass.sh


#==============================================
# SYSTEM SETTINGS: 
#==============================================
# Get wallpaper
wget --output-document=/home/manjaro/Pictures/background.png https://i.redd.it/nrpos80erff61.jpg

# Set Wallpaper
qdbus org.kde.plasmashell /PlasmaShell org.kde.PlasmaShell.evaluateScript '
    var allDesktops = desktops();
    print (allDesktops);
    for (i=0;i<allDesktops.length;i++) {{
        d = allDesktops[i];
        d.wallpaperPlugin = "org.kde.image";
        d.currentConfigGroup = Array("Wallpaper",
                                     "org.kde.image",
                                     "General");
        d.writeConfig("Image", "file:///home/manjaro/Pictures/background.png")
    }}
'
