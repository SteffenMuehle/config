#source “${XDG_CONFIG_HOME:-$HOME/.config}/asdf-direnv/zshrc”
source ~/.zshrc_moia

#aliases
alias ls='ls -G'
alias ll='ls -alF'
alias home='cd ~'
alias cc='cd ..'
alias ccc='cd ..; cd ..'
alias cccc='cd ..; cd ..; cd ..'
alias tab='terminator --new-tab'
alias lsw='ls | wc'
alias nl='nano -l'
alias aws_local='aws-vault exec data-platform.prd --ec2-server --prompt=osascript --debug -- tail -f /dev/null'
alias ccs='cc; ls'
alias cccs='ccc; ls'


#functions
cds() {
  cd "$@" && ls
}


ccd() {
  cc && cd "$@"
}

ccds() {
  cc && cds "$@"
}

function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

COLOR_DEF=$'%f'
COLOR_USR=$'%F{243}'
COLOR_DIR=$'%F{208}'
COLOR_GIT=$'%F{39}'
setopt PROMPT_SUBST
export PROMPT='${COLOR_USR}%n ${COLOR_DIR}%~ ${COLOR_GIT}$(parse_git_branch)${COLOR_DEF} $ '

setopt HIST_FIND_NO_DUPS
bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward
