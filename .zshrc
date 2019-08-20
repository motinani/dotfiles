# Path to your oh-my-zsh installation.
export ZSH=/home/moti/.oh-my-zsh
export WORKON_HOME="$HOME/.local/share/virtualenvs"

# java
export JAVA_HOME=/usr/lib/jvm/default-java
export PYTHONPATH="${PYTHONPATH}:/home/moti/dev/healthshield/hslibs"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="refined"
#ZSH_THEME="powerlevel9k/powerlevel9k"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-extras colored-man-pages  virtualenvwrapper zsh-syntax-highlighting pipenv z)
fpath+=~/.zfunc
# User configuration

export PATH="/home/moti/install/google-cloud-sdk/bin:/home/moti/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/moti/dev/installations/spring/bin"
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:/home/moti/.local/bin
# export MANPATH="/usr/local/man:$MANPATH"

# Gradle
if [ -d "$HOME/opt/gradle" ]; then
    export GRADLE_HOME="$HOME/opt/gradle"
    PATH="$PATH:$GRADLE_HOME/bin"
fi
source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source $ZSH_CUSTOM/aliases
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
#export GOOGLE_APPLICATION_CREDENTIALS=$HOME/.config/gcloud/credentials/healthshield-dev-4cea4b6c8094.json
# Custom npm setup from here: https://github.com/sindresorhus/guides/blob/master/npm-global-without-sudo-linux.md
export NPM_PACKAGES=~/.npm-packages
export PATH=$PATH:$NPM_PACKAGES/bin

#source /usr/lib/google-cloud-sdk/completion.zsh.inc
source <(kubectl completion zsh)
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PATH:$PYENV_ROOT/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:/snap/bin
export HISTTIMEFORMAT="%d/%m/%y %T "
alias cdc="cd ~/go/src/csi-kaminario"
export PATH=$PATH:$HOME/.linkerd2/bin
export PATH=$PATH:/usr/local/go/bin
source <(stern --completion=zsh)

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/moti/google-cloud-sdk/path.zsh.inc' ]; then . '/home/moti/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/moti/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/moti/google-cloud-sdk/completion.zsh.inc'; fi
source /home/moti/dev/hs-dev-env/zshrc  # hs-dev-env

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH=/home/moti/.nvm/versions/node/v6.0.0/bin:/home/moti/.npm-packages/bin:/home/moti/bin:/home/moti/.local/bin:/home/moti/dev/hs-dev-env/scripts:/home/moti/google-cloud-sdk/bin:/home/moti/install/google-cloud-sdk/bin:/home/moti/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/moti/dev/installations/spring/bin:/usr/lib/jvm/default-java/bin:/home/moti/.local/bin:/home/moti/.npm-packages/bin:/home/moti/.pyenv/bin:/home/moti/go/bin:/snap/bin:/home/moti/.linkerd2/bin:/usr/local/go/bin:/home/linuxbrew/.linuxbrew/bin
eval "$(direnv hook zsh)"
export EDITOR=/usr/bin/editor
function pet-select() {
  BUFFER=$(pet search --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle redisplay
}
zle -N pet-select
stty -ixon
bindkey '^s' pet-select
unsetopt AUTO_CD
export PATH=/home/moti/.nvm/versions/node/v6.0.0/bin:/home/moti/.npm-packages/bin:/home/moti/bin:/home/moti/.local/bin:/home/moti/dev/hs-dev-env/scripts:/home/moti/google-cloud-sdk/bin:/home/moti/install/google-cloud-sdk/bin:/home/moti/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/moti/dev/installations/spring/bin:/usr/lib/jvm/default-java/bin:/home/moti/.local/bin:/home/moti/.npm-packages/bin:/home/moti/.pyenv/bin:/home/moti/go/bin:/snap/bin:/home/moti/.linkerd2/bin:/usr/local/go/bin:/home/linuxbrew/.linuxbrew/bin:/home/moti/.poetry/bin
export LC_ALL=en_US.UTF-8
