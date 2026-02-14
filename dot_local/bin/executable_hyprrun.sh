#!/bin/bash

apps=(
  "Librewolf:librewolf"
  "Chromium:chromium"
  "GIMP:gimp"
  "Pavucontrol:pavucontrol-qt"
  "Tenacity:tenacity"
  "Galculator:galculator"
  "OBS:obs"
  "Apostrophe:apostrophe"
  "qBittorrent:qbittorrent"
  "Blueman:blueman-manager"
  "ProtonVPN:protonvpn-app"
  "Anki:flatpak run net.ankiweb.Anki" 
  "VeraCrypt:veracrypt"
  "Bitwarden:flatpak run com.bitwarden.desktop"
  "Ente Auth:flatpak run io.ente.auth"
  "Only Office:flatpak run org.onlyoffice.desktopeditors"
  "S4F3-C0D3S:~/S4F3-C0D3S/S4F3-C0D3S.AppImage"
  "Virt Machine Manager:virt-manager"
  "nwg-look:nwg-look"
  "Kvantum:kvantummanager"
  "qt6ct:qt6ct"
  "draw.io:flatpak run com.jgraph.drawio.desktop"
  "Tor Browser:torbrowser-launcher"
  "KdenLive:kdenlive"
)

choice=$(printf "%s\n" "${apps[@]}" | cut -d: -f1 | fzf --prompt="  ")

if [ -n "$choice" ]; then
  cmd=$(printf "%s\n" "${apps[@]}" | grep "^$choice:" | cut -d: -f2)

  # Executes the app, fully detaching it from the terminal
  setsid sh -c "$cmd >/dev/null 2>&1 &"
fi
