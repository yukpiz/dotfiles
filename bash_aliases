#!/bin/bash

# ls
if [ `which ls` ]; then
    alias ll='ls -alF'
    alias la='ls -A'
    alias l='ls -CF'
fi

# rm wrapper
if [ `which trash` ]; then
    alias rm='trash'
fi

# docker
if [ `which docker` ]; then
    alias docker='sudo docker'
fi

# notify-send
if [ `which notify-send` ]; then
    alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'
fi

# adb tools
#if [ `which adb` ]; then
#    alias adb='sudo adb'
#fi

alias vim='vim -X'
