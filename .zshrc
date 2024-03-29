## Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt HIST_IGNORE_SPACE                                        # ^\s is ignored is not stored .zhistory
setopt autopushd
setopt pushdignoredups

alias d='dirs -v | head -10'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'etopt autopushd 


zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                              # automatically find new executables in path 

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
HISTFILE=~/.zhistory
HISTSIZE=10000
SAVEHIST=10000
export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim
WORDCHARS=${WORDCHARS//\/[&.;]}                                 # Don't consider certain characters part of the word

# Theming section  
autoload -U compinit colors zcalc
compinit -d
colors

# enable substitution for prompt
setopt prompt_subst

# Color man pages
export LESS_TERMCAP_mb=$'\E[01;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'
export LESS=-r


# ========================= Settings =========================

# Vi key bindings
set -o vi 
# Open in vim
set show-mode-in-prompt on
set vi-ins-mode-string +
set vi-cmd-mode-string :


# ========================= Aliases =========================
# alias ls="exa"
# alias "ls -tr"="exa --sort=time"
alias p="ptipython" -c '%load_ext autoreload; %autoreload 2' -i
alias r="ranger"
alias v="nvim"
alias n="nvim"
alias e="exit"
alias g="git"
alias m="/home/jensjp/Scripts/Menu/menu"
alias di="export DISPLAY=:0"
alias yt="youtube-dl"
alias xo="cp ~/Templates/notes.xopp"
alias mlab="matlab -nosplash -nodesktop -r 'beep off'"
alias t="task"
alias to="taskopen"
alias am="arduino-cli monitor -p /dev/ttyACM3"
alias live="killall firefox; pkill --full '/usr/bin/live-server'; live-server --port=3000 --browser=firefox --no-css-inject"

alias sass_live="sass --watch scss/style.scss style.css"

# ========================= Ssh =========================
alias ssht="ssh -i ~/.ssh/thinkcentre jensjp@10.0.0.22"
alias sshtk="ssh -Y -i ~/.ssh/thinkcentre jensjp@10.0.0.22 x2x -west -to :0"

# Julia
alias jun="julia --project=. -e 'using Pkg; Pkg.instantiate()'" # New julia project
alias jur='jupyter console --ZMQTerminalInteractiveShell.editing_mode=vi \
           --kernel=julia-1.8' #-compiled-0.6'

# Bitwarden
alias bwu='eval $(bw unlock | grep -o "export BW_SESSION.*$")'
alias bwg='bash ~/Scripts/BitWarden/bwg.sh'
alias bwa='bash ~/Scripts/BitWarden/bwa.sh'

# ========================= Config =========================
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' # Old config
alias c='/usr/bin/git --git-dir=$HOME/..dotfiles/ --work-tree=$HOME' # New config
alias cb='/usr/bin/git --git-dir=$HOME/..dotfiles/ --work-tree=$HOME branch'
alias cs='/usr/bin/git --git-dir=$HOME/..dotfiles/ --work-tree=$HOME status'
alias cl='/usr/bin/git --git-dir=$HOME/..dotfiles/ --work-tree=$HOME log'
alias cr='/usr/bin/git --git-dir=$HOME/..dotfiles/ --work-tree=$HOME reflog'

# ========================= Paths =========================
# export PATH="/home/jensjp/.cargo/bin:$PATH"
# export PATH="/home/jensjp/R/x86_64-pc-linux-gnu-library/4.2/languageserver:$PATH"
# export R_LIBS_USER="/home/jensjp/R"
# ======================== FZF =========================
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden'
export FZF_DEFAULT_OPTS="--bind 'ctrl-d:preview-page-down','ctrl-u:preview-page-up'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd -H -t d . $HOME"
#export BAT_THEME="gruvebox"


# ======================== pdf nvim backward serach =========================
export NVIM_LISTEN_ADDRESS=/tmp/nvimsocket
# ========================= Python =========================
export PYTHONSTARTUP='/home/jensjp/.config/ptpython/ipython_startup.py'
# export PYTHONBREAKPOINT=ipdb.set_trace
export PYTHONBREAKPOINT=IPython.terminal.debugger.set_trace

# ========================= Tabcompletion =========================
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)                        # Include hidden files 

# ========================= Use vim keys in tab complete menu =========================
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -v '^?' backward-delete-char

# =========================  Edit command in vim =========================
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^X" edit-command-line


# ========================= Prevent nested ranger =========================
ranger() {
    if [ -z "$RANGER_LEVEL" ]; then
        /usr/bin/ranger "$@"
    elif [ -v TMUX ]; then 
        /usr/bin/ranger "$@"
    else
        exit
    fi
}



# ========================= Plugins section =========================
# source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh # Use syntax highlighting
source $HOME/Extra/zsh-plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh # Use history substring search
source $HOME/Extra/zsh-plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/Scripts/Fzf/fzf_widgets.zsh

# Auto suggestion
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 
source $HOME/Extra/zsh-plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# ========================= Machine spesific settings =========================
HWMODEL=$(hostnamectl | awk -F ": " '/Hardware Model:/ {print $2}')
OS=$(hostnamectl | awk -F ": " '/Operating System/ {print $2}')

if [[ $HWMODEL == "ThinkPad W530" ]]; then
    (( $SHLVL == 1 )) && task next && timew summary day # Print on startup
fi 

if [[ $OS == "Debian"* ]]; then
    export VIMRUNTIME="$HOME/Repos/neovim/runtime" # Set nvim runtime for source build. 
fi

eval "$(starship init zsh)" # Prompt

export TERM="alacritty" # fix for tmux (underline)
export PATH=/home/jensjp/.cargo/bin:/home/jensjp/Scripts/Executables/:$PATH
export PATH=$PATH:/usr/local/go/bin # Add go to path
