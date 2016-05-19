# --- About {{{
# ------------------------------------------
#  [ About of this config ]
# ------------------------------------------
# Configuration of bash !!
#
# -- Repository
#
#      https://github.com/yukpiz/dotfiles.git
#
# -- Contact
#
#      Twitter: @yukpiz
#      Email:   yukpiz@gmail.com
# }}}

case $- in
    *i*) ;;
    *) return;;
esac

# --- Histories {{{
HISTCONTROL=ignoreboth
HISTSIZE=9999
HISTFILESIZE=2000
# }}}

# --- Colors {{{
if [ $TERM == 'mlterm' ]; then
    export TERM=xterm-color
fi

case "$TERM" in
    xterm-color) color_prompt=yes;;
    mlterm) color_prompt=yes;;
    screen-256color) color_prompt=yes;;
    xterm) color_prompt=yes;;
    *) color_prompt=
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
# }}}

# --- Prompt {{{
if [ "$color_prompt" = yes ]; then
    h="[\h]"
    c="[\u@\w]"
    u=""
    p="\$"
    PS1="\$(printf '\[\033[01;32m\]%s\[\033[00m\]\[\033[00;32m\]%s\[\033[00m\]\[\033[01;33m\]%s\[\033[00m\]\[\033[00;37m\]%s\[\033[00m\]' ${h} ${c} ${u} ${p})"
fi

#parse_git_branch() {
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* (.*)/(1)/'
#}
#export PS1=$(parse_git_branch)
# }}}

# --- Aliases {{{
if [ -e $HOME/.bash_aliases ]; then
    . $HOME/.bash_aliases
fi
# }}}

# --- Paths & Variables {{{

export VTE_CJK_WIDTH=1

#Using Vim for Subversion.
export SVN_EDITOR=vim

if [ -e "$HOME/.rbenv" ]; then
    export RBENV_ROOT="$HOME/.rbenv"
    export PATH="$HOME/.rbenv/bin:$PATH"
    if [ `which rbenv` ]; then
        eval "$(rbenv init -)"
    fi
fi

# Arduino setup
if [ -e "/usr/local/share/arduino" ]; then
    export PATH="/usr/local/share/arduino:$PATH"
fi

# Android SDK setup
if [ -e "/usr/local/share/android-sdk-linux" ]; then
    export ANDROID_SDK_ROOT="/usr/local/share/android-sdk-linux"
    export ANDROID_SDK_PLATFORM_TOOLS="$ANDROID_SDK_ROOT/platform-tools"
    export ANDROID_SDK_TOOLS="$ANDROID_SDK_ROOT/tools"
    export PATH="$ANDROID_SDK_PLATFORM_TOOLS:$PATH"
    export PATH="$ANDROID_SDK_TOOLS:$PATH"
fi

# Gradle setup
if [ -e "/usr/local/share/gradle" ]; then
    export GRADLE_HOME="/usr/local/share/gradle"
    export GRADLE_BIN="$GRADLE_HOME/bin"
    export PATH="$GRADLE_BIN:$PATH"
fi

# JDK setup
if [ -e "/usr/local/share/jdk1.7.0_79" ]; then
    export JAVA_HOME="/usr/local/share/jdk1.7.0_79"
    export PATH="$JAVA_HOME/bin:$PATH"
fi

# Android Studio setup
if [ -e "/usr/local/share/android-studio" ]; then
    export ANDROID_STUDIO_HOME="/usr/local/share/android-studio"
    export ANDROID_STUDIO_BIN="$ANDROID_STUDIO_HOME/bin"
    export PATH="$ANDROID_STUDIO_BIN:$PATH"
fi

# Eclipse setup
if [ -e "/usr/local/share/eclipse" ]; then
    ECLIPSE_ROOT="/usr/local/share/eclipse"
    export PATH="$ECLIPSE_ROOT:$PATH"
fi

# Scala setup
if [ -e "/usr/local/share/sbt" ]; then
    SBT_ROOT="/usr/local/share/sbt"
    export PATH="$SBT_ROOT/bin:$PATH"
fi

# Go lang setup
if [ -e "/usr/local/share/go" ]; then
    export GOROOT="/usr/local/share/go"
    export GOPATH="$GOROOT/extend-pkgs"
    export GOBIN="$GOROOT/bin"
    export PATH="$GOBIN:$PATH"
fi

# }}}

# --- Apps {{{
if [ -z "$TMUX" -a -z "$STY" ]; then
    if tmux has-session && tmux list-sessions | grep -qE '.*]$'; then
        tmux -2 attach && echo "tmux attached session."
    else
        tmux -2 new-session && echo "tmux created new session."
    fi
fi
# }}}

# --- Keys {{{
stty -ixon -ixoff
# }}}
