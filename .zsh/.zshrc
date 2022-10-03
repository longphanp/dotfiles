setopt PROMPT_SUBST
autoload -U colors && colors # Enable colors

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

#-------------- Custom prompt ----------------
# set the git_prompt_status text
ZSH_THEME_GIT_PROMPT_ADDED="%F{cyan} added%f"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{red} unmerged%f"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{magenta} untracked%f"
ZSH_THEME_GIT_PROMPT_BEHIND="%F{yellow} behind%f"
ZSH_THEME_GIT_PROMPT_AHEAD="$fg[green] ahead$reset_color"

ZSH_THEME_GIT_PROMPT_PREFIX="("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%f"
ZSH_THEME_GIT_PROMPT_CLEAN="%F{cyan}"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{red}"

# current directory, two levels deep
directory() {
   echo "%B%F{blue}%0~%f"
}

function git_prompt_info() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return

  # Checks if working tree is dirty
  local STATUS=''
  local FLAGS
  FLAGS=('--porcelain')
  if [[ "$(command git config --get oh-my-zsh.hide-dirty)" != "1" ]]; then
    if [[ $POST_1_7_2_GIT -gt 0 ]]; then
      FLAGS+='--ignore-submodules=dirty'
    fi
    if [[ "$DISABLE_UNTRACKED_FILES_DIRTY" == "true" ]]; then
      FLAGS+='--untracked-files=no'
    fi
    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)
  fi

  if [[ -n $STATUS ]]; then
    GIT_PROMPT_COLOR="$ZSH_THEME_GIT_PROMPT_DIRTY"
  else
    GIT_PROMPT_COLOR="$ZSH_THEME_GIT_PROMPT_CLEAN"
    unset GIT_DIRTY_STAR
  fi

  echo "$GIT_PROMPT_COLOR$ZSH_THEME_GIT_PROMPT_PREFIX$(current_branch)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

PROMPT='$(directory) $(git_prompt_info) $ '
#---------------------------------------------
