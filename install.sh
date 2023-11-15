#!/bin/bash

# Install neofetch and lolcat
sudo dnf install -y neofetch lolcat btop blender wine krita freecad 
sudo rpmkeys --import https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg
printf "[gitlab.com_paulcarroty_vscodium_repo]\nname=download.vscodium.com\nbaseurl=https://download.vscodium.com/rpms/\nenabled=1\ngpgcheck=1\nrepo_gpgcheck=1\ngpgkey=https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/-/raw/master/pub.gpg\nmetadata_expire=1h" | sudo tee -a /etc/yum.repos.d/vscodium.repo
sudo dnf install codium

sudo dnf copr enable bgstack15/AfterMozilla
sudo dnf install librewolf

sudo dnf install dnf-plugins-core
sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
sudo dnf install brave-browser

dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
dnf install vlc

# Check if neofetch installation was successful
if [ $? -ne 0 ]; then
  echo "Neofetch installation failed !"
fi

sed -i '/# Source global definitions/a\
lol() \
{ \
    if [ -t 1 ]; then \
        "$@" | lolcat \
    else \
        "$@" \
    fi \
} \
\
COMMANDS=( \
    neofetch \
) \
\
for COMMAND in "${COMMANDS[@]}"; do \
    alias "${COMMAND}=lol ${COMMAND}" \
    alias ".${COMMAND}=$(which ${COMMAND})" \
done' ~/.bashrc


exit 0

#for using arduino ide, you have to give the usb port permission
#ls -l /dev/ttyUSB*
#sudo usermod -a -G dialout <username>
