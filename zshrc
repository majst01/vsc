export ZSH=~/.oh-my-zsh
ZSH_THEME="robbyrussell"
DISABLE_AUTO_UPDATE="true"
plugins=(git gitfast docker go git-extras kubectl)
source $ZSH/oh-my-zsh.sh
export GIT_PS1_SHOWUPSTREAM="auto"
unsetopt share_history
eval "$(direnv hook zsh)"

