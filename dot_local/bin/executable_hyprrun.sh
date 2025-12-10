#!/bin/bash

apps=(
  "LibreWolf:librewolf"
  "VSCodium:codium"
  "BlueJ:bluej"
  "GIMP:gimp"
  "Pavucontrol:GTK_THEME=Arc-Dark XDG_CURRENT_DESKTOP=Hyprland pavucontrol"
  "Audacity:audacity"
  "Galculator:galculator"
  "Chromium:chromium"
  "OBS:obs"
  "qBittorrent:qbittorrent"
  "Ente Auth:enteauth"
  "Blueman:blueman-manager"
  "ProtonVPN:protonvpn-app"
  "Prism Launcher:prismlauncher"
  "Anki:flatpak run net.ankiweb.Anki"
  "VeraCrypt:veracrypt"
  "Bitwarden:bitwarden-desktop"
  "Only Office:flatpak run org.onlyoffice.desktopeditors"
  "WebCord:webcord"
  "Session:session-desktop"
  "S4F3-C0D3S:~/S4F3-C0D3S/S4F3-C0D3S.AppImage"
  "Virt Machine Manager:virt-manager"
  "draw.io:flatpak run com.jgraph.drawio.desktop"
  "ClamTk:clamtk"
  "Tor Browser:tor-browser"
  "KdenLive:kdenlive"
)

choice=$(printf "%s\n" "${apps[@]}" | cut -d: -f1 | fzf --prompt="  ")

if [ -n "$choice" ]; then
  cmd=$(printf "%s\n" "${apps[@]}" | grep "^$choice:" | cut -d: -f2)

  # Executes the app, fully detaching it from the terminal
  setsid sh -c "$cmd >/dev/null 2>&1 &"
fi
