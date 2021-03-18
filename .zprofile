#!/bin/zsh

# This file is run when calling  on login (before .xinitrc)
# Environmental variables are set here.

# Default programs
export EDITOR="micro"
export TERMINAL="xfce4-terminal"
export BROWSER="firefox"
export READER="zathura"

# XDG Base Directory
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"

# XDG_CACHE_HOME
export HISTFILE="$XDG_CACHE_HOME/zsh_history"
export ICEAUTHORITY="$XDG_CACHE_HOME/ICEauthority"
export LESSHISTFILE="-"
export NODE_REPL_HISTORY="$XDG_CACHE_HOME/node_repl_history"

# XDG_CONFIG_HOME
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME/android"
export GTK2_RC_FILES="$XDG_CONFIG_HOME/gtk-2.0/gtkrc-2.0"
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/.npmrc"
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# XDG_DATA_HOME
export ADOTDIR="$XDG_DATA_HOME/antigen"
export ASDF_DATA_DIR="$XDG_DATA_HOME/asdf"
export BUNDLE_USER_HOME="$XDG_DATA_HOME/bundle"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export NVM_DIR="$XDG_DATA_HOME/nvm"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/password-store"
export PIPX_HOME="$XDG_DATA_HOME/pipx"
export PYENV_ROOT="$XDG_DATA_HOME/pyenv"
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"

# XDG_RUNTIME_DIR
# export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"

# Shorcuts
export FILES="/run/media/sj/Home/Files"