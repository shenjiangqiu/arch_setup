ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
sed -i 's/#en_US.U/en_US.U/' /etc/locale.gen
sed -i 's/#zh_CN.U/zh_CN.U/' /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' > /etc/locale.conf
systemctl enable dhcpcd
echo "press any to continue"
read a
echo "test network, prect ctrl-c to finish"
ping google.com
pacman -Syy
pacman -S archlinuxcn-keyring archlinux-keyring
pacman -S grub efibootmgr
pacman -S vim amd-ucode os-prober
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
pacman -S yay
pacman -Fyy
pacman -S iw


echo "finished install.reboot and try to install other softwares"
echo "remember to add your user! and add it to the wheel group to enable sudo access"
