if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
  startx
fi

bindkey -s ^f "tmux-sessionizer\n"
