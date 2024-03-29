# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH=${HOME}/utils/.oh-my-zsh

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
fi

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

plugins=(
  dirhistory
  cp
  autopep8
  colored-man-pages
  git-extras
  git-flow 
  git-flow-avh
  git-hubflow
  git-prompt
  git
  gitfast
  github
  gitignore
  gpg-agent
  history
  history-substring-search
  python
  ssh-agent
  # vi-mode
  vim-interaction
  zsh-navigation-tools
  tmux
  tmuxinator
  tmux-cssh
  you-should-use
  zsh-autosuggestions
  catimg
  zsh-z
)

source $ZSH/oh-my-zsh.sh

source /opt/asdf-vm/asdf.sh

source ${HOME}/.env
source ${HOME}/.env.local
source ${HOME}/.custom_commands.zsh
source ${HOME}/.aliases

source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
# source ~/.zsh/custom/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

# For some reason, this line need to be at the bottom
bindkey '^w' autosuggest-accept
bindkey '^ ' autosuggest-execute
