#!/bin/bash

show_popup() {
  UPTIME=$(uptime -p)

  kitty --class uptpopup -o allow_remote_control=yes -T "Uptime" \
    -e bash -c "figlet 'Uptime' | lolcat; echo '$UPTIME' | lolcat; sleep 3"
}

show_popup

