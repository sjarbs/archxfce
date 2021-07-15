# Manjaro
> Manjaro XFCE After Install

## GPG 
> Do it before Before Dotfiles!
```sh
yay -S gnupg
# To prevent ownership issues
mkdir -p ~/.local/share/gnupg # $GNUPGHOME
gpg --import $BACKUP/private.asc
gpg --edit-key <KEY_ID>
# gpg> trust
# gpg> 5
# gpg> quit
```

## Restore Dotfiles
```sh
yay -S stow antigen
git clone https://github.com/sjarbs/dotfiles ~/Dotfiles
cd ~/Dotfiles && stow .

git clone https://github.com/sjarbs/password-store ~/.local/share/password-store # $PASSWORD_STORE_DIR
cp -r $BACKUP/.mozilla ~/
```

## Fonts
```sh
yay -S noto-fonts
yay -S ttf-jetbrains-mono
yay -S noto-fonts-emoji-apple
yay -S ttf-nerd-fonts-symbols-mono
```

## CLI/TUIs
```sh
yay -S pass
yay -S micro-bin
yay -S exa
yay -S trash-cli 
yay -S redshift-minimal
yay -S rsync
yay -S htop
yay -S pfetch-git
yay -S youtube-dl
yay -S instaloader
```

## GUIs
```sh
yay -S visual-studio-code-bin
yay -S emacs
yay -S firefox
yay -S gnome-disk-utility baobab
yay -S rofi rofi-emoji
yay -S libreoffice-still
yay -S zathura
yay -S inkscape
yay -S obs-studio
yay -S vlc
yay -S nicotine+
yay -S transmission-gtk
yay -S discord
yay -S megasync
yay -S freetube-bin
```

## Runtimes
```sh
yay -S asdf-vm

asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs
asdf install nodejs

asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby
asdf install ruby

# TODO: Python Poetry
```

# Other
- Passwordless sudo
- Hardware Clock is Local (Because Windows)