#!/bin/bash

show_popup() {
  # Pega a hora (Ex: 18:45)
  TIME=$(date '+%H:%M')
  # Pega a data completa (Ex: Tuesday, December 09)
  DATE=$(date '+%A, %B %d')

  # Abre o popup
  # Também dá para criar regras específicas no Hyprland se quiser
  kitty --class clockpopup -o allow_remote_control=yes -T "Datetime" \
    -e bash -c "figlet '$TIME' | lolcat; echo -e '\n$DATE' | lolcat; sleep 3"
}

show_popup
