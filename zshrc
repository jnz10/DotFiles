export _JAVA_AWT_WM_NONREPARENTING=1

if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ]; then
  exec startx
fi

export ZSH="/home/wuxxf/.oh-my-zsh"

ZSH_THEME="xxf"
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
setopt INC_APPEND_HISTORY

plugins=(zsh-autosuggestions zsh-completions zsh-syntax-highlighting bgnotify last-working-dir)

source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit
autoload -Uz bracketed-paste-magic
zle -N bracketed-paste bracketed-paste-magic
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic

zstyle ':completion:*' rehash true

stop(){
  if [ $# -ne 1 ]; then
          echo 1>&2 Usage: stop process
  else
    PROCESS=$1
    echo "Stopping processes with the word ${tGreen}$1${tReset}"
    ps axw | grep -i $1 | awk -v PROC="$1" '{print $1}' | xargs kill -STOP
  fi
}
cont(){
  if [ $# -ne 1 ]; then
          echo 1>&2 Usage: cont process
  else
    PROCESS=$1
    echo "Continuing processes with the word ${tGreen}$1${tReset}"
    ps axw | grep -i $1 | awk -v PROC="$1" '{print $1}' | xargs kill -CONT
  fi
}

export EDITOR=vim
export BROWSER=firefox
export TERMINAL=kitty

PRIV="sudo"

alias h="history"
alias p="pwd -P"
alias s="sudo -s"
alias CD="cd"
alias ff='firefox'
alias netprocs="lsof -P -i -n"
alias init.vim="vim ~/.config/nvim/init.vim"
alias comptonconf="vim ~/.config/compton/compton.conf"
alias userChrome.css="vim ~/thm/Firefox/userChrome.css"
alias dunstrc="vim ~/.config/dunst/dunstrc"
alias polyconf="vim ~/.config/polybar/config"
alias zshrc="vim ~/.zshrc"
alias c="clear"
alias q="exit"
alias pacrem="$PRIV pacman -Rcns"
alias yayupd="yay -Sy"
alias yayupg="yay -Syu"
alias pingoogle="ping 8.8.8.8"
alias nanosu="$PRIV nano"
alias nvimsu="$PRIV nvim"
alias cat='bat'
alias l='ls -lh'
alias ll='ls -lah'
alias la='ls -A'
alias lm='ls -m'
alias lr='ls -R'
alias lg='ls -l --group-directories-first'
alias gcl='git clone --depth 1'
alias gi='git init'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push origin master'
alias nvimrc= 'nvim .config/init.ini'
alias 256colors2="~/.color-toys/256colors2.pl"
alias bloks="~/.color-toys/bloks"
alias colortest="~/.color-toys/colortest"
alias colortest-slim="~/.color-toys/colortest-slim"
alias colorview="~/.color-toys/colorview"
alias colorbars="~/.color-toys/colorbars"
alias panes="~/.color-toys/panes"
alias pipes1="~/.color-toys/pipes1"
alias pipes2="~/.color-toys/pipes2"
alias pipes2-slim="~/.color-toys/pipes2-slim"

export BAT_THEME="base16"
export GPG_TTY=$(tty)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
