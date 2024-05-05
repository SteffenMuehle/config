# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt extendedglob nomatch
unsetopt autocd beep notify
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/ksteffen/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall



##########
# MANUAL #
##########

# Aliases
alias edit='nano -l'
alias ls='ls -G'
alias ll='ls -alF'
alias lsw='ls | wc'
alias cc='cd ..'
alias ccc='cd ..; cd ..'
alias cccc='cd ..; cd ..; cd ..'
alias ccs='cc; ls'
alias cccs='ccc; ls'

cds() {
  cd "$@" && ls
}
ccd() {
  cc && cd "$@"
}
ccds() {
  cc && cds "$@"
}


# Prompt Style
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
COLOR_DEF=$'%f'
COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{208}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

