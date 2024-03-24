# arch linux
> Arch Installation Guide for Myself

```sh
# keyboard layout
loadkeys es

# disable pc speaker
rmmod pcspkr

# verify inet/uefi?
# assumes ethernet, for wifi use `iwctl` or USB tethering with a mobile phone
ping -c 4 archlinux.org
ls /sys/firmware/efi/efivars # if not error: is UEFI else BIOS

# system clock
timedatectl set-ntp true

# partition
cfdisk /dev/sda # gpt | 100M (/boot/efi) / 64G (/) / 128GG (/home)
mkfs.fat -F 32 /dev/sda1 # Warning: Only format the EFI system partition if you created it during the partitioning step. If there already was an EFI system partition on disk beforehand, reformatting it can destroy the boot loaders of other installed operating systems.
mkfs.ext4 /dev/sda2
mkfs.ntfs --fast /dev/sda3 # ntfs if shared with Windows, otherwise go with ext4. --fast for quick format
# check with `lsblk`

# mount
mount --mkdir /dev/sda1 /mnt/boot/efi
mount /dev/sda2 /mnt
mount --mkdir /dev/sda3 /mnt/home

# pacstrap
pacman -Sy
reflector @/etc/xdg/reflector/reflector.conf
pacstrap /mnt base base-devel linux-lts linux-firmware linux-headers micro

# fstab
genfstab -U /mnt >> /mnt/etc/fstab
genfstab /mnt

# chroot
arch-chroot /mnt

# swap
fallocate -l 8G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo "/swapfile swap swap defaults 0 0" >> /etc/fstab

# time zone
ln -sf /usr/share/zoneinfo/America/Buenos_Aires /etc/localtime
hwclock --systohc

# locale
sed --in-place 's/^#en_US\.UTF-8/en_US\.UTF-8/' /etc/locale.gen # uncomment
locale-gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "KEYMAP=es" > /etc/vconsole.conf

# network
pacman -S networkmanager network-manager-applet
echo "S50B" > /etc/hostname
# echo "127.0.0.1        localhost" > /etc/hosts
# echo "::1              localhost" > /etc/hosts
# echo "127.0.1.1        S50B"      > /etc/hosts
curl https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts > /etc/hosts
systemctl enable NetworkManager

# users
pacman -S zsh
passwd # root password
useradd -m -G wheel -s /bin/zsh "sj"
passwd "sj"
sed -i 's/^#\s*\(%wheel\s*ALL=(ALL)\s*NOPASSWD:\s*ALL\)/\1/' /etc/sudoers # uncomment `%wheel ALL=(ALL) NOPASSWD: ALL`. Alternatively use `EDITOR=micro visudo`

# grub
pacman -S grub os-prober efibootmgr intel-ucode # or amd-ucode for AMD processors
sed --in-place 's/^#GRUB_DISABLE_OS_PROBER=false/GRUB_DISABLE_OS_PROBER=false/' /etc/default/grub # uncomment `GRUB_DISABLE_OS_PROBER=false`
grub-install --target=x86_64-efi --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg

# yay
pacman -S git
git config --global --add safe.directory "*" # WTF
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si
cd ..
rm -rf yay-bin

# chaotic-aur
pacman-key --recv-key FBA220DFC880C036 --keyserver keyserver.ubuntu.com
pacman-key --lsign-key FBA220DFC880C036
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
echo "[chaotic-aur]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf
yay -Sy
yay -Su

sed --in-place 's/^#Color/Color/' /etc/pacman.conf # uncomment `#Color` for colored output


# programs: arch repositories
xorg="xf86-video-intel xf86-video-amdgpu xorg-server xorg-xinit xorg-xkill xclip xorg-xinput"
de="xfce4 xfce4-genmon-plugin xfce4-pulseaudio-plugin rofi-emoji kdocker xdg-user-dirs thunar-archive-plugin thunar-media-tags-plugin xfce4-whisker-menu xfce4-screenshooter gvfs gvfs-smb"
prompt="zsh stow antigen starship"
clis="lsd pass ffmpeg yt-dlp moreutils htop micro trash-cli p7zip fzf bat pfetch" # newsboat
fonts="noto-fonts noto-fonts-emoji-apple ttf-jetbrains-mono ttf-nerd-fonts-symbols-mono"
dev="git gnupg github-cli pnpm-bin nodejs-lts-gallium gnome-keyring visual-studio-code-bin" # neovim, emacs
audio="pipewire pipewire-pulse pulsemixer pavucontrol mixxx" # audacity
visual="vlc shotwell figma-linux-bin obs-studio gimp kruler" # mpv, inkscape, kdenlive-appimage
internet="brave-bin librewolf-bin transmission-gtk nicotine+" # chaotic-aur/ungoogled-chromium, stremio, popcorntime-bin, megasync-bin
office="libreoffice-still" # zathura, obsidian-appimage
utils="ventoy-bin bleachbit baobab font-manager gnome-disk-utility cpupower-gui" # mp3tag, syncthing
other="ntfs-3g exfat-utils xarchiver dislocker-noruby man-db man-pages"
packages="$xorg $de $prompt $clis $fonts $dev $audio $visual $internet $office $utils $other"
# check ~/dotfiles/yayfile
yay --sync --needed --nodiffmenu --nocleanmenu --noconfirm $packages

# programs: flatpak
yay --sync --needed --nodiffmenu --nocleanmenu --noconfirm xdg-desktop-portal-gtk flatpak
flatpak install org.freefilesync.FreeFileSync # aur/freefilesync-bin (broken)

# exit
exit
umount -R /mnt
reboot

# login to user
startxfce4

# open a terminal
gh auth login
git clone https://github.com/sjarbs/linux ~/dotfiles
git clone https://github.com/sjarbs/keys /tmp/keys
git clone https://github.com/sjarbs/password-store ~/.local/share/password-store
# git clone https://github.com/sjarbs/emacs ~/.config/emacs

# stow dotfiles
cd ~/dotfiles && stow --adopt .

# gpg config
mv ~/.gnupg $GNUPGHOME
gpg --import /tmp/keys/private.asc
gpg --edit-key <KEY_ID>
# gpg> trust
# gpg> 5
# gpg> y
# gpg> quit
pass github.com/sobrinojulian # for testing
rm -rf /tmp/keys # clean keys

# fix `gpg: WARNING: unsafe permissions on homedir`
# https://gist.github.com/oseme-techguy/bae2e309c084d93b75a9b25f49718f85#gistcomment-3585593
find $GNUPGHOME -type f -exec chmod 600 {} \;
find $GNUPGHOME -type d -exec chmod 700 {} \;

# root configs (not included in sjarbs/linux user config)
sudo micro /etc/pacman.conf
# uncomment `Color`
# uncomment `ParallelDownloads = 5`

# manual configs
# - brave sync && vscode sync
# - brave shorcuts & pwas
```