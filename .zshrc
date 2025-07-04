# CONFIGURATION
# AUTO COMPLETE
# env vars
bindkey '^I' complete-word
export FZF_DEFAULT_COMMAND='fd'
export FZF_ALT_C_COMMAND="fd"
# paths
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/.local/share/go
export PATH=$PATH:$HOME/.local/share/go/bin
export PATH="$PATH:/home/rmcle/.dotnet/tools"
export PATH="$PATH:$HOME/.vivify"
# Enable colors and change prompt:
autoload -U colors && colors
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='nvim'
else
    export EDITOR='nvim'
fi

# VI MODE in terminal
#export KEYTIMEOUT=1
bindkey -v '^?' backward-delete-char
function zle-keymap-select { # Change cursor shape for different vi modes.
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# HISTORY
# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
# Enable searching through history
# Create history directory if it doesn't exist
HISTS_DIR=$HOME/.bash_history.d
mkdir -p "${HISTS_DIR}"
if [ -n "${TMUX_PANE}" ]; then
  pane_id=$(tmux display -pt "${TMUX_PANE:?}" "#{pane_title}")
  if [[ $pane_id != "$pane_id_prefix"* ]]; then
    random_id=$(head /dev/urandom | tr -dc A-Za-z0-9 | head -c 16)
    printf "\033]2;$pane_id_prefix$random_id\033\\"
    pane_id=$(tmux display -pt "${TMUX_PANE:?}" "#{pane_title}")
  fi
  export HISTFILE="${HISTS_DIR}/bash_history_tmux_${pane_id}"
else
  export HISTFILE="${HISTS_DIR}/bash_history_no_tmux"
fi
# Stash the new history each time a command runs.
export PROMPT_COMMAND="$PROMPT_COMMAND;history -a"


# Basic auto/tab complete:
fpath=(/home/rmcle/.zshrc_comp $fpath);
autoload -U compinit && compinit
zstyle ':completion:*' menu select=long
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zmodload zsh/complist
_comp_options+=(globdots)		# Include hidden files.
# case insensitive path-completion 
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 


autoload -U +X bashcompinit && bashcompinit
source /home/rmcle/.zshrc_comp/_openssl
complete -o nospace -C /usr/bin/terraform terraform
# fzf auto completion - need this for ctl-r to function
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
# add ${vcs_info_msg_0} to the prompt
# e.g. here we add the Git information in red
PS1='%B%{$fg[red]%}%{$fg[yellow]%}%n%{$fg[yellow]%}@%{$fg[yellow]%}%M %{$fg[green]%}%3~ %b%F{red}${vcs_info_msg_0_}%{$fg[blue]%}%{$reset_color%}$%b '

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' +'
zstyle ':vcs_info:*' stagedstr ' *'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       ''$'\uE0A0 %b%u%c '
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'


# command alias
alias ipconfig="ip --brief address show"
alias cls="clear"
alias test-netconnection="nc -zv"

# source zprofile for api keys and secrets - we wont commit zprofile to git
source $HOME/.zprofile

# Load zsh-syntax-highlighting; should be last.
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
. "/home/rmcle/.deno/env"

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
