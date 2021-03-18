# Installation Guide
> Arch Linux + XFCE4

## Pre-installation
```sh
loadkeys es
ping -c 3 google.com
timedatectl set-ntp true
```

## Disk Partition

```sh
cfdisk /dev/sda
# /dev/sda1   1G   /boot/efi   EFI
# /dev/sda2   100G /           Linux Filesystem
# /dev/sda3   512G             LUKS-EXT4
# /dev/sda4   16M              Microsoft reserved
# /dev/sda5   300G             Microsoft basic data

mkfs.fat -F32 /dev/sda1
mkfs.ext4 /dev/sda2
```

## Pacstrap
```sh
mount /dev/sda2 /mnt
pacman -S reflector
reflector --verbose --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
pacman -Syy
pacstrap /mnt base base-devel linux linux-firmware networkmanager nano man-db zsh
genfstab -U /mnt >> /mnt/etc/fstab
arch-chroot /mnt
```

## Time
```sh
ln -sf /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime
hwclock --systohc
```

## Lang
```sh
nano /etc/locale.gen # Uncomment `en_US.UTF-8 UTF-8`
echo LANG=en_US.UTF-8 > /etc/locale.conf
export LANG=en_US.UTF-8
locale-gen
```

## Hosts
```sh
echo sj > /etc/hostname
curl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts -o /etc/hosts
```

## Users
```sh
passwd
useradd -m -G wheel -s zsh sj
passwd sj
EDITOR=nano visudo # Uncomment `%wheel ALL=(ALL) NOPASSWD: ALL`
```

## Bootloader
```sh
pacman -S grub efibootmgr os-prober
mkdir /boot/efi
mount /dev/sda1 /boot/efi
grub-install --target=x86_64-efi --bootloader-id=GRUB --efi-directory=/boot/efi
os-prober
grub-mkconfig -o /boot/grub/grub.cfg
```

## Kernel & Systemd
```sh
systemctl enable networkmanager
echo "blacklist pcspkr" > /etc/modprobe.d/blacklist.conf
reboot
```

## Yay
```sh
pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay
cd yay && makepkg -si
```