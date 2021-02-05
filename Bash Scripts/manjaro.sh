#!/bin/bash

#==============================================
# SOFTWARE INSTALLATION SCRIPT FOR MANJARO: 
#==============================================

# Return to home directory:
cd ~

# Force full system refresh ():
# sudo pacman -Syyu

# Update mirrors and find fastest:
# sudo pacman-mirrors -g

# Update System:
# sudo pacman -Syu
sudo pacman -Sy

#==============================================
# INSTALL SYSTEM UTILITIES: 
#==============================================
echo 'y' | sudo pacman -S htop
echo 'y' | sudo pacman -S neofetch

#==============================================
# INSTALL PROGRAMS: 
#==============================================
# Make directory for Installers:
mkdir /home/manjaro/Downloads/UniversalInstallers

# Lastpass:
wget --output-document=/home/manjaro/Downloads/UniversalInstallers/lplinux.tar.bz2 https://download.cloud.lastpass.com/linux/lplinux.tar.bz2

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

# EOF
