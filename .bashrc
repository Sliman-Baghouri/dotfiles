#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"
alias hyprconf='nvim ~/.dotfiles/.config/hypr/hyprland.conf'
alias vimrc='cd ~/.dotfiles/.config/nvim'
alias rc='nvim .bashrc'
export PATH="$PATH:/path/to/flutter/bin"
export PATH="$PATH:/home/rodya/Downloads/flutter/bin"
export CHROME_EXECUTABLE="/usr/bin/chromium"
alias vi='nvim'
export ANDROID_HOME=$HOME/Android/Sdk
# export PATH=$PATH:$ANDROID_HOME/tools

function flutter-watch(){
  tmux send-keys "flutter run $1 $2 $3 $4 --pid-file=/tmp/tf1.pid" Enter \;\
  split-window -v \;\
  send-keys 'npx -y nodemon -e dart -x "cat /tmp/tf1.pid | xargs kill -s USR1"' Enter \;\
  resize-pane -y 5 -t 1 \;\
  select-pane -t 0 \;
}
