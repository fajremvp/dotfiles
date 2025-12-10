#!/bin/bash

kitty --class powerprompt -T "Confirm Shutdown" \
  -o allow_remote_control=yes \
  -o initial_window_width=60c -o initial_window_height=15c \
  -e bash -c '
    clear
    figlet "systemctl poweroff" | lolcat
    echo
    echo -ne "Confirm (Y): "
    read -n 1 resposta
    echo
    if [[ "$resposta" == [yY\ ] ]]; then
      systemctl poweroff
    else
      echo "Cancelled."
      sleep 1
    fi
  '

