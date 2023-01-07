# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/henningj/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

[ -d /mnt/data/projects/dotfiles/oh-my-zsh ] && ZSH_CUSTOM="/mnt/data/projects/dotfiles/oh-my-zsh"

. /usr/share/zsh-antigen/antigen.zsh
antigen use oh-my-zsh
plugins=(
  ag
  autojump
  bgnotify
  colored-man-pages
  command-not-found
  direnv
  docker
  fd
  git
  git-flow
#  git-prompt
  gpg-agent
  nmap
  pip
#  please
  poetry
  ripgrep
  rsync
  timer
  virtualenv
  zsh-users/zsh-syntax-highlighting
)
for p in $plugins; do
  antigen bundle $p
done
antigen apply

omz theme use berms || omz theme use "jispwoso"

eval "$(direnv hook zsh)"
