#
# ~/.bashrc
#
function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf ""; return; else printf " ["; fi
  if echo ${STATUS} | grep -c "renamed:"         &> /dev/null; then printf " >"; else printf ""; fi
  if echo ${STATUS} | grep -c "branch is ahead:" &> /dev/null; then printf " !"; else printf ""; fi
  if echo ${STATUS} | grep -c "new file::"       &> /dev/null; then printf " +"; else printf ""; fi
  if echo ${STATUS} | grep -c "Untracked files:" &> /dev/null; then printf " ?"; else printf ""; fi
  if echo ${STATUS} | grep -c "modified:"        &> /dev/null; then printf " *"; else printf ""; fi
  if echo ${STATUS} | grep -c "deleted:"         &> /dev/null; then printf " -"; else printf ""; fi
  printf " ]"
}

parse_git_branch() {
  # Long form
  git rev-parse --abbrev-ref HEAD 2> /dev/null
 # Short form
  # git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -e 's/.*\/\(.*\)/\1/'
}

prompt_comment() {
    DIR="$HOME/.local/share/promptcomments/"
    MESSAGE="$(find "$DIR"/*.txt | shuf -n1)"
    cat "$MESSAGE"
}

# PS1="\e[00;36m\]┌─[ \e[00;37m\]\T \d \e[00;36m\]]──\e[00;31m\]>\e[00;37m\] \u\e[00;31m\]@\e[00;37m\]\h\n\e[00;36m\]|\n\e[00;36m\]└────\e[00;31m\]> \e[00;37m\]\w \e[00;31m\]\$ \e[01;37m\]"
# PS1="\[\e[01;37m\]{ \[\e[01;34m\]\w \[\e[01;37m\]} \[\e[01;35m\]\[\$ \]\[\e[01;37m\]"
# PS1="\[\e[1;36m\]\$(parse_git_branch)\[\033[31m\]\$(parse_git_dirty)\[\033[00m\]\n\w\[\e[1;31m\] \[\e[1;36m\]\[\e[1;37m\] "
# PS1="\[\e[1;36m\]\$(parse_git_branch)\[\033[31m\]\$(parse_git_dirty)\n\[\033[1;33m\]  \[\e[1;37m\] \w \[\e[1;36m\]\[\e[1;37m\] "
PS1="\[\033[34m\]⮝ \[\e[1;37m\] \w \[\e[1;36m\]\$(parse_git_branch)\[\033[31m\]\$(parse_git_dirty) \[\e[1;36m\]\[\e[1;37m\] "

# PS1="\[\033[34m\]⮝ \[\e[1;37m\] \$(parse_git_branch)\[\033[31m\]\$(parse_git_dirty) \[\e[1;36m\]>\[\e[1;37m\] "
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# alias ls='ls --color=auto'

alias bg='nvim ~/.config/hypr/hyprpaper.conf'
alias hyprconf='nvim ~/.dotfiles/.config/hypr/hyprland.conf'
alias downtime='~/.dotfiles/.config/scripts/downtime.sh'
alias notes='nvim ~/notes/moonstep/apps/users/backlogs.md'
alias vimrc='cd ~/.dotfiles/.config/nvim'
alias rc='nvim .bashrc'
alias grenade='~/dev/go/grenade/grenade'
export PATH="$PATH:/home/rodya/Downloads/flutter/bin"
export PATH="/usr/bin/flutter/bin:$PATH"
export CHROME_EXECUTABLE="/usr/bin/chromium"
export PATH=$PATH:"$HOME/.local/bin"
export DENO_INSTALL="/home/rodya/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
alias vi='nvim'
# export ANDROID_HOME=$HOME/Android/Sdk
export JAVA_HOME=/opt/jdk-19
export PATH=$JAVA_HOME/bin:$PATH
# export PATH=$PATH:$ANDRexport PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-toolsOID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools
# export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin:$ANDROID_HOME/platform-tools

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

# Homebrew
# export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
# export MANPATH="/home/linuxbrew/.linuxbrew/share/man:$MANPATH"
# export INFOPATH="/home/linuxbrew/.linuxbrew/share/info:$INFOPATH"
# export PATH="$PATH":"$HOME/.pub-cache/bin"
# export PATH="$HOME/.linuxbrew/bin:$PATH"
# export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
# export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"
#

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


export JAVA_HOME=/usr/lib/jvm/jdk-19
export JAVA_HOME=/usr/lib/jvm/jdk-19
export PATH=$PATH:/usr/lib/jvm/default/bin

# pnpm
export PNPM_HOME="/home/rodya/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
#
#
# go
export PATH=$PATH:$(go env GOPATH)/bin
export PATH="$PATH":"$HOME/.pub-cache/bin"


