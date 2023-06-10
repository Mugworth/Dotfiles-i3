export ZSH=$HOME/.config/zsh/.oh-my-zsh
export GLOB_PATTERN="**/*@(.sh|.inc|.bash|.command|.zsh|zshrc|zsh_*)"
export XENVIRONMENT="${HOME}/.Xresources"
export ZK_NOTEBOOK_DIR="${HOME}/Documents/orgmode"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="headline"
ZSH_THEME="bubblified"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

#Bindkey removing
bindkey -r "^[s"
bindkey -r "^[m"
bindkey -r "^[u"
bindkey -r "^[c"
bindkey -r "^[t"

# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
  zsh-completions
  zsh-autosuggestions
  dirhistory
  colored-man-pages
  sudo
  fancy-ctrl-z
  fzf-dir-navigator
  fzf-tab
  zsh-syntax-highlighting
  zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

export EDITOR=/usr/local/bin/nvim
export SUDO_EDITOR=/usr/local/bin/nvim
#export VISUAL=~/.local/bin/lvim
export TERMINAL=/usr/local/bin/kitty

# ssh for xterm-kitty
[ "$TERM" = "xterm-kitty" ] && alias ssh="kitty +kitten ssh"

#export BROWSER=/var/lib/flatpak/app/org.qutebrowser.qutebrowser/current/active/export/bin/org.qutebrowser.qutebrowser
export BROWSER=/bin/vivaldi

alias la='exa -a'
# alias l='exa -l'
# alias qutebrowser=/var/lib/flatpak/app/org.qutebrowser.qutebrowser/current/active/export/bin/org.qutebrowser.qutebrowser
#alias ytd=yt-dlp
alias spotify="LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify"
alias ani=ani-cli
alias ls="exa"
# alias ll="exa -la"
alias lf=lfcd
alias rs=lfcd
lfcd () {
    local tempfile="$(mktemp)"
    command lfub -command "map S \$echo \$PWD >$tempfile; lfub -remote \"send \$id quit\"" "$@"

    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n "$(pwd)")" ]]; then
		  cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}
# lfcd () {
# tmp="$(mktemp)"
# command lfub --last-dir-path="$tmp" "$@"
# if [ -f "$tmp" ]; then
#     dir="$(cat "$tmp")"
#     rm -f "$tmp"
#     if [ -d "$dir" ]; then
#         if [ "$dir" != "$(pwd)" ]; then
#             cd "$dir" || return
#         fi
#     fi
# fi
# }

autoload -U compinit && compinit
_comp_options+=(globdots)

#eval "$(zoxide init zsh)"
export PATH="$PATH:$HOME/.spicetify"
export PATH="$PATH:$HOME/.emacs.d/bin"
export PATH="$PATH:$HOME/.spicetify"
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/.nimble/bin/"

[ -f ~/.config/zsh/fzf.zsh ] && source ~/.config/zsh/fzf.zsh

set -o ignoreeof



bindkey '^s' fzf-dir
bindkey '^[k' history-substring-search-up
bindkey '^[j' history-substring-search-down


HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=true

# pnpm
export PNPM_HOME="/home/kuba/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end-e
alias luamake=/home/kuba/git/lua-language-server/3rd/luamake/luamake
eval $(thefuck --alias fck)
