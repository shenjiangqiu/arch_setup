timedatectl set-ntp true
cfdisk
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
pacstrap /mnt base base-devel linux linux-firmware dhcpcd >/dev/null
genfstab -U /mnt >> /mnt/etc/fstab
cp  /etc/pacman.d/mirrorlist /mnt/etc/pacman.d/mirrorlist
echo "try arch-chroot /mnt"

