# Theme
SPACESHIP_CHAR_SYMBOL="▲"
SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_DIR_TRUNC_REPO=false
SPACESHIP_EXEC_TIME_PREFIX="⌚ "

# Antigen
source /usr/share/zsh/share/antigen.zsh
  antigen use oh-my-zsh
  antigen bundle asdf
  antigen bundle git
  antigen bundle npm
  antigen bundle command-not-found
  antigen bundle common-aliases
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle zsh-users/zsh-autosuggestions
  antigen theme denysdovhan/spaceship-prompt
  # antigen bundle vagrant
  # antigen bundle pip
antigen apply

source $ZDOTDIR/aliasrc

# source /opt/asdf-vm/asdf.sh
eval "$(fnm env)"
# fnm completions --shell zsh
