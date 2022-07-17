#!/bin/bash
#set -e
echo "##########################################"
echo "Be Careful this will override your Rice!! "
echo "##########################################"
sleep 5
echo "Creating Backups of ~/.config folder"
echo "#####################################"
cp -r ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
rm ~/.config/autostart/org.kde.latte-dock.desktop
sleep 2
echo "Removing old Latte-Dock"
echo "#################################"
sudo pacman -R --noconfirm latte-dock 
sudo pacman -R --noconfirm latte-dock-git
sleep 2
echo
echo "Installing Lightly For best look"
echo "###################################"
sudo pacman -S --needed --noconfirm lightly-git lightlyshaders-git
sleep 2
echo "Installing Dracula Theme"
echo "#################################"
sudo pacman -S --needed --noconfirm nordic-wallpapers ant-dracula-theme-git ant-dracula-kde-theme-git ant-dracula-kvantum-theme-git kvantum dracula-cursors-git dracula-icons-git dracula-xresources-git
sleep 2
echo "Installing Fonts"
echo "#################################"
sudo pacman -S --needed --noconfirm nerd-fonts-hack nerd-fonts-fira-code nerd-fonts-meslo nerd-fonts-terminus noto-fonts-emoji
sleep 2
echo "Applying new Rice, hold on..."
echo "#################################"
cp -Rf Configs/Home/. ~
sed -i "s/{.*}/{C2}/g" ~/XeroAscii
sudo sed -i "s/Current=.*/Current=Dracula/" /etc/sddm.conf.d/kde_settings.conf
sudo sed -i "s/CursorTheme=.*/CursorTheme=Dracula-cursors/" /etc/sddm.conf.d/kde_settings.conf
sleep 2
echo "Applying Grub Theme...."
echo "#################################"
chmod +x Grub.sh
sudo ./Grub.sh
sudo sed -i "s/#GRUB_GFXMODE=640x480/GRUB_GFXMODE=1920x1080/g" /etc/default/grub
sudo grub-mkconfig -o /boot/grub/grub.cfg
sleep 2
echo
echo "Rebooting To Apply Settings..."
echo "#################################"
reboot
