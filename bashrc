case $- in
    *i*) ;;
      *) return;;
esac

HISTCONTROL=ignoreboth # ignorespace,ignoredups,ignoreboth
HISTSIZE=9999
HISTFILESIZE=2000

#shopt -s checkwinsize
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

if [ "$USER" = "yukpiz" ]; then
    h="[\h]"
    c="[\u@\w]"
    u=""
    p="\$"

    #PS1="\$(printf '\[\x1b[38;05;045m\]%s\[\x1b[38;05;081m\]%s\[\x1b[38;05;111m\]%s\[\x1b[38;05;195m\]%s\[\x1b[38;05;189m\]' ${h} ${c} ${u} ${p})"
    PS1="\$(printf '\[\033[01;32m\]%s\[\033[00m\]\[\033[00;32m\]%s\[\033[00m\]\[\033[01;33m\]%s\[\033[00m\]\[\033[00;37m\]%s\[\033[00m\]' ${h} ${c} ${u} ${p})"
fi
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi


# Auto starting single ssh-agent & ssh-add
#if [ $? == 2 ]; then
#  echo -n "ssh-agent: restart..."
#  ssh-agent > ~/.ssh-agent-info
#  source ~/.ssh-agent-info
#fi

#if ssh-add -l >&/dev/null; then
#  echo "ssh-agent: Identity is already stored."
#else
#  ssh-add ~/.ssh/github.com.yukpiz
#  ssh-add ~/.ssh/bitbucket.org.yukpiz
#fi

# dir colors
#eval $(dircolors -b ~/.dir_colors)

# init rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
if [ `which rbenv` ]; then
    eval "$(rbenv init -)"
fi

# create tmux session
#if [ -z "$TMUX" -a -z "$STY" ]; then
#    if tmux has-session && tmux list-sessions | /usr/bin/grep -qE '.*]$'; then
#        tmux -2 attach && echo "tmux attached session."
#    else
#        tmux -2 new-session && echo "tmux created new session."
#    fi
#fi

# init android
#export PATH="/usr/local/lib/android-sdk-linux/platform-tools:$PATH"
#export PATH="/usr/local/lib/android-sdk-linux/tools:$PATH"
#export PATH="/usr/local/lib/eclipse:$PATH"

# root adb server
#alias adb-kill-server="sudo /usr/local/lib/android-sdk-linux/platform-tools/adb kill-server"
#alias adb-start-server="sudo /usr/local/lib/android-sdk-linux/platform-tools/adb start-server"
#alias adb-restart-server="sudo /usr/local/lib/android-sdk-linux/platform-tools/adb kill-server; sudo /usr/local/lib/android-sdk-linux/platform-tools/adb start-server"


# Java settings
if [ `uname` = "Darwin" ]; then
    export JAVA_HOME=`/System/Library/Frameworks/JavaVM.framework/Versions/A/Commands/java_home -v "1.6"`
    PATH=${JAVA_HOME}/bin:${PATH}
#elif [ `uname` = "Linux" ]; then
    # Java export
    #export JAVA_HOME="/usr/local/lib/jdk/jdk1.7.0_67"
    #PATH=${JAVA_HOME}/bin:${PATH}

    # Scala export
    #PATH="/usr/local/lib/sbt/bin":${PATH}
    #PATH="/usr/local/lib/conscript/bin":${PATH}
fi

# Vi mode
set -o vi
