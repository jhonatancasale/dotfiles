# Path to your oh-my-zsh installation.
export ZSH=${HOME}/utils/.oh-my-zsh

ZSH_THEME="nanotech-jc"

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
  dnf
  ubuntu
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
  rake-fast
  rake
  rvm
  ssh-agent
  ruby
  vi-mode
  vim-interaction
  zsh-navigation-tools
  tmux
  tmuxinator
  tmux-cssh
  timer
  you-should-use
  zsh-autosuggestions
  catimg
  zsh-z
)

#Plugins tunning
#TIMER_PRECISION allows to control number of decimal places (default 1)
export TIMER_PRECISION=2
#TIMER_FORMAT allows to adjust display format (default '/%d')
export TIMER_FORMAT='[%d]'
#TIMER_THRESHOLD allows to set the minimum execution time that causes the timer to be shown (default 0)
export TIMER_THRESHOLD=3

# User configuration
export GEM_HOME="${HOME}/gems"

export PATH="/usr/local/bin:/usr/bin:.:${HOME}/utils/CondaPython/anaconda3/bin:${HOME}/gems/bin:/bin:/usr/local/sbin:${HOME}/utils/scripts:/usr/lib64/openmpi/bin:/usr/sbin:${HOME}/utils/phantonJS/phantomjs-2.1.1-linux-x86_64/bin:${HOME}/workspace/ringa/utils/bin:${HOME}/.local/bin:/usr/share/maven/bin:$HOME/utils/leiningen:${HOME}/utils/openshift/openshift-origin-server-v3.11.0-0cbc58b-linux-64bit:${HOME}/utils/exercism:${HOME}/.cargo/bin:${HOME}/tools/bin:${HOME}/tools/spark/spark-3.2.1-bin-hadoop3.2/bin"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk-amd64"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 fi

# Compilation flags
 export ARCHFLAGS="-arch x86_64"

# ssh
 export SSH_KEY_PATH="~/.ssh/dsa_id"

#Generic
export WORKSPACE="${HOME}/shared-workspace"
export PROJECTS="${WORKSPACE}/projects"
export PROGRAMMING_LANGUAGES=${WORKSPACE}/programming-languages
export PYTHON_PLAYGROUND="${PROGRAMMING_LANGUAGES}/python/playground"

#Docker
export CONTAINER_MANAGER=docker
export DOCKERDATA="${HOME}/dockerdata"

#System
export WINDOWS_HOME='/mnt/c/Users/casal'
export JENKINS="${WORKSPACE}/tools/jenkins"
 
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
export HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=99999
HISTFILESIZE=99999
SAVEHIST=99999

SSH_ENV=${HOME}/.ssh/environment

export WIKIHOME="${HOME}/vimwiki"
export MAIN_UTILS="${HOME}/utils"
export MAIN_SCRIPTS="${MAIN_UTILS}/scripts"
export META_SOLANGE="${MAIN_UTILS}/meta-solange"
export SOLANGE_CONN_STRING="jhc@192.168.0.106"

#contact informations
export BUSINESSMAIL="contato@jhonatancasale.com"
export PERSONALMAIL="casale.jhon@gmail.com"
export GITHUB="https://github.com/jhonatancasale"
export BITBUCKET="https://bitbucket.org/jhonatancasale"
export TWITTER="https://twitter.com/jhonatancasale"
export BLOGADDRES="http://jhonatancasale.github.io/"
export BLOG="${HOME}/site/blog/jhonatancasale"

export VAGRANT_DEFAULT_PROVIDER=virtualbox

export LS_COLORS="rs=0:di=38;5;33:ln=38;5;51:mh=00:pi=40;38;5;11:so=38;5;13:do=38;5;5:bd=48;5;232;38;5;11:cd=48;5;232;38;5;3:or=48;5;232;38;5;9:mi=01;05;37;41:su=48;5;196;38;5;15:sg=48;5;11;38;5;16:ca=48;5;196;38;5;226:tw=48;5;10;38;5;16:ow=48;5;10;38;5;21:st=48;5;21;38;5;15:ex=38;5;40:*.tar=38;5;9:*.tgz=38;5;9:*.arc=38;5;9:*.arj=38;5;9:*.taz=38;5;9:*.lha=38;5;9:*.lz4=38;5;9:*.lzh=38;5;9:*.lzma=38;5;9:*.tlz=38;5;9:*.txz=38;5;9:*.tzo=38;5;9:*.t7z=38;5;9:*.zip=38;5;9:*.z=38;5;9:*.Z=38;5;9:*.dz=38;5;9:*.gz=38;5;9:*.lrz=38;5;9:*.lz=38;5;9:*.lzo=38;5;9:*.xz=38;5;9:*.bz2=38;5;9:*.bz=38;5;9:*.tbz=38;5;9:*.tbz2=38;5;9:*.tz=38;5;9:*.deb=38;5;9:*.rpm=38;5;9:*.jar=38;5;9:*.war=38;5;9:*.ear=38;5;9:*.sar=38;5;9:*.rar=38;5;9:*.alz=38;5;9:*.ace=38;5;9:*.zoo=38;5;9:*.cpio=38;5;9:*.7z=38;5;9:*.rz=38;5;9:*.cab=38;5;9:*.jpg=38;5;13:*.jpeg=38;5;13:*.gif=38;5;13:*.bmp=38;5;13:*.pbm=38;5;13:*.pgm=38;5;13:*.ppm=38;5;13:*.tga=38;5;13:*.xbm=38;5;13:*.xpm=38;5;13:*.tif=38;5;13:*.tiff=38;5;13:*.png=38;5;13:*.svg=38;5;13:*.svgz=38;5;13:*.mng=38;5;13:*.pcx=38;5;13:*.mov=38;5;13:*.mpg=38;5;13:*.mpeg=38;5;13:*.m2v=38;5;13:*.mkv=38;5;13:*.webm=38;5;13:*.ogm=38;5;13:*.mp4=38;5;13:*.m4v=38;5;13:*.mp4v=38;5;13:*.vob=38;5;13:*.qt=38;5;13:*.nuv=38;5;13:*.wmv=38;5;13:*.asf=38;5;13:*.rm=38;5;13:*.rmvb=38;5;13:*.flc=38;5;13:*.avi=38;5;13:*.fli=38;5;13:*.flv=38;5;13:*.gl=38;5;13:*.dl=38;5;13:*.xcf=38;5;13:*.xwd=38;5;13:*.yuv=38;5;13:*.cgm=38;5;13:*.emf=38;5;13:*.ogv=38;5;13:*.ogx=38;5;13:*.aac=38;5;45:*.au=38;5;45:*.flac=38;5;45:*.m4a=38;5;45:*.mid=38;5;45:*.midi=38;5;45:*.mka=38;5;45:*.mp3=38;5;45:*.mpc=38;5;45:*.ogg=38;5;45:*.ra=38;5;45:*.wav=38;5;45:*.oga=38;5;45:*.opus=38;5;45:*.spx=38;5;45:*.xspf=38;5;45:"

# Disable flow control commands (keeps C-s from freezing everything)
stty start undef
stty stop undef

#to the end of the file
#https://github.com/zsh-users/zsh-syntax-highlighting.git
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# To use vim on crontab
export VISUAL=vim;
export GOPATH=${HOME}/go


ZSH_COMMAND_TIME_MIN_SECONDS=3

# Message to display (set to "" for disable).
ZSH_COMMAND_TIME_MSG="Execution time: %s sec"

# Message color.
ZSH_COMMAND_TIME_COLOR="cyan"
source ${HOME}/.env
source ${HOME}/.custom_commands.zsh
source ${HOME}/.aliases

# stow
export DOTFILES="${HOME}/.dotfiles"
export STOW_FOLDERS="zsh,tmux,vim"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$(yarn global bin):$PATH"

PATH="${HOME}/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="${HOME}/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="${HOME}/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"${HOME}/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=${HOME}/perl5"; export PERL_MM_OPT;

# We need this to show python.matplotlib.pyplot.show() from WSL to Windows
export DISPLAY=$(grep -oP "(?<=nameserver ).+" /etc/resolv.conf):0.0

# For some reason, this line need to be at the bottom
bindkey '^w' autosuggest-accept
bindkey '^ ' autosuggest-execute
