# arch linux
> arch linux after install

## Download Everything
```sh
# Pacman
yay -S stow antigen yay-bin flatpak
yay -S lsd pass github-cli htop micro trash-cli
yay -S noto-fonts noto-fonts-emoji-apple ttf-jetbrains-mono ttf-nerd-fonts-symbols

# Flatpak

# Repos
gh auth login
git clone https://github.com/sjarbs/linux ~/dotfiles
git clone https://github.com/sjarbs/fonts ~/.local/share/fonts
git clone https://github.com/sjarbs/keys /tmp/keys
git clone https://github.com/sjarbs/password-store ~/.local/share/password-store
git clone https://github.com/sjarbs/emacs ~/.config/emacs
```

## Usage
```sh
cd ~/dotfiles && stow .
```

## GPG
```sh
yay -S gnupg
mkdir -p $GNUPGHOME # To prevent ownership issues
gpg --import /tmp/keys/private.asc
gpg --edit-key <KEY_ID>
# gpg> trust
# gpg> 5
# gpg> y
# gpg> quit
```
### Fix `gpg: WARNING: unsafe permissions on homedir`
```sh
# https://gist.github.com/oseme-techguy/bae2e309c084d93b75a9b25f49718f85#gistcomment-3585593
find $GNUPGHOME -type f -exec chmod 600 {} \; # Set 600 for files
find $GNUPGHOME -type d -exec chmod 700 {} \; # Set 700 for directories
```
