#!/bin/bash
#set -e
echo "##########################################"
echo "Be Careful this will override your Rice!! "
echo "##########################################"
sleep 5
echo "Creating Backups of ~/.config folder"
echo "#####################################"
mv ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
sleep 2
echo "Removing old Latte-Dock"
echo "#################################"
sudo pacman -R --noconfirm latte-dock latte-dock-git
sleep 2
echo
echo "Installing Lightly For best look"
echo "###################################"
sudo pacman -S --needed --noconfirm lightly-git
sleep 2
echo "Installing Dracula Theme"
echo "#################################"
sudo pacman -S --needed --noconfirm ant-dracula-theme-git ant-dracula-kde-theme-git ant-dracula-kvantum-theme-git kvantum dracula-cursors-git dracula-icons-git dracula-xresources-git
sleep 2
echo "Installing Fonts"
echo "#################################"
sudo pacman -S --needed --noconfirm nerd-fonts-hack nerd-fonts-fira-code nerd-fonts-meslo nerd-fonts-terminus noto-fonts-emoji
sleep 2
echo "Applying new Rice, hold on..."
echo "#################################"
cp -Rf Configs/Home/. ~
sudo cp -Rf Configs/System/. /
sleep 2
echo "Applying Grub Theme...."
echo "#################################"
chmod +x Grub.sh
sudo ./Grub.sh
sudo sed -i "s/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1920x1080/g" /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sleep 2
echo
echo "Installing LightlyShaders rounded"
echo "###################################"
sudo pacman -S --needed --noconfirm git make cmake gcc gettext extra-cmake-modules qt5-tools qt5-x11extras kcrash kglobalaccel kde-dev-utils kio knotifications kinit kwin
cd $HOME/ && git clone https://github.com/a-parhom/LightlyShaders
cd LightlyShaders; mkdir qt5build; cd qt5build; cmake ../ -DCMAKE_INSTALL_PREFIX=/usr && make && sudo make install
sleep 2
echo
echo "Rebooting To Apply Settings..."
echo "#################################"
reboot
