setopt PROMPT_SUBST
autoload -U colors && colors # Enable colors

#-------------- Custom prompt ----------------
# current directory, two levels deep
directory() {
   echo "%0~"
}

# set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} added%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%} unmerged%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[magenta]%} untracked%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_BEHIND="%{$fg[yellow]%} behind%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[green]%} ahead%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[red]%}"

PROMPT='$(directory) $(git_prompt_info) $ '
RPROMPT='$(git_prompt_status)'

#---------------------------------------------

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line if pasting URLs and other text is messed up.
DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Standard plugins can be found in $ZSH/plugins/
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh


export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
