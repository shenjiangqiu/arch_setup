timedatectl set-ntp true
echo "enter to continue"
read temp
echo "format the partition"
bash 
echo "input the efi: "
read efi
echo "input the root system: "
read root
mkfs.ext4 $root
mkfs.fat -F32 $efi
mount $root /mnt
mkdir /mnt/boot
mount $efi /mnt/boot
echo 'Server = http://mirrors.lug.mtu.edu/archlinux/$repo/os/$arch' >  /etc/pacman.d/mirrorlist
echo '[archlinuxcn]
Server = https://mirror.xtom.com/archlinuxcn/$arch' >> /etc/pacman.conf
echo "installing package to /mnt"
pacman -Syy
pacstrap /mnt base base-devel  linux linux-firmware zsh bash-completion vim dhcpcd
genfstab -U /mnt >> /mnt/etc/fstab
cp  /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
cp /etc/pacman.conf /mnt/etc/pacman.conf
echo "try arch-chroot /mnt"
cp ./*.sh /mnt/root/


