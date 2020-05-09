echo '[archlinuxcn]
Server = https://mirror.xtom.com/archlinuxcn/$arch' >> /etc/pacman.conf
ls -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
sed 's/#en_US.U/en_US.U/' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
systemctl enable dhcpcd
systemctl start dhcpcd
pacman -Syy
pacman -S archlinuxcn-keyring
pacman -S grub efibootmgr
pacman -S vim amd-ucode
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S yay
yay -Fyy
yay -S deepin  networkmanager  lightdm
systemctl enable lightdm 
systemctl enable NetworkManager
yay -S nginx aria2c-daemon webui-aria2 visual-studio-code-bin