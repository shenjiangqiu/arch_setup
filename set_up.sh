timedatectl set-ntp true
cfdisk
"enter to continue"
read temp
"format the partition"
bash 
"input the efi: "
read efi
"input the root system: "
read root
"mkfs.ext4 $root"
"mkfs.fat -F32 $efi"
"mount $root /mnt"
"mkdir /mnt/boot"
"mount $efi /mnt/boot"
"echo "'Server = http://mirrors.lug.mtu.edu/archlinux/$repo/os/$arch'" >  /etc/pacman.d/mirrorlist"
echo '[archlinuxcn]
Server = https://mirror.xtom.com/archlinuxcn/$arch' >> /etc/pacman.conf
pacstrap /mnt base base-devel linux linux-firmware dhcpcd
genfstab -U /mnt >> /mnt/etc/fstab
cp  /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
arch-chroot /mnt
ls -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
sed 's/#en_US.U/en_US.U/' /etc/locale.gen
locale-gen
echo LANG=en_US.UTF-8 > locale.conf
systemctl enable dhcpcd
systemctl start dhcpcd
pacman -Syy
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




