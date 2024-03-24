# Antigen
source /usr/share/zsh/share/antigen.zsh
  antigen use oh-my-zsh
  antigen bundle git
  antigen bundle command-not-found
  antigen bundle common-aliases
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen bundle zsh-users/zsh-autosuggestions
antigen apply

# Aliases
source $ZDOTDIR/aliasrc

# Theme
eval "$(starship init zsh)"
