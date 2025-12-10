#!/bin/bash

# Para ficar universal e funcionar com qualquer um, buscamos qual dispositivo é a bateria (BAT0, BAT1, etc)
BATTERY_PATH=$(upower -e | grep 'BAT' | head -n 1)

STATE_FILE="$HOME/.cache/last_battery_level"
THRESHOLD=10

# Se não encontrar bateria, encerra para evitar erros
if [ -z "$BATTERY_PATH" ]; then
    echo "Nenhuma bateria encontrada."
    exit 1
fi

show_popup() {
  # Coleta os dados usando o caminho detectado
  INFO=$(upower -i "$BATTERY_PATH")
  
  # Extrai as variáveis
  PERCENT=$(echo "$INFO" | grep "percentage" | awk '{print $2}')
  STATUS=$(echo "$INFO" | grep "state" | awk '{print $2}')

  # Exibe o popup
  kitty --class batpopup -o allow_remote_control=yes -T "Bateria" \
    -e bash -c "figlet '$PERCENT' | lolcat; echo '($STATUS)' | lolcat; sleep 3"
}

if [[ "$1" == "monitor" ]]; then
  mkdir -p "$HOME/.cache"
  
  # Se o arquivo não existe, cria com valor inicial
  if [ ! -f "$STATE_FILE" ]; then
      # Pega a porcentagem atual inicial para não dar erro de lógica
      CURRENT_INIT=$(upower -i "$BATTERY_PATH" | grep "percentage" | awk '{print $2}' | tr -d '%')
      echo "$CURRENT_INIT" > "$STATE_FILE"
  fi

  while true; do
    INFO=$(upower -i "$BATTERY_PATH")
    PERCENT_NUM=$(echo "$INFO" | grep "percentage" | awk '{print $2}' | tr -d '%')
    STATUS=$(echo "$INFO" | grep "state" | awk '{print $2}')
    
    LAST=$(cat "$STATE_FILE")
    
    # Previne erro matemático se LAST estiver vazio ou inválido
    if ! [[ "$LAST" =~ ^[0-9]+$ ]]; then LAST=$PERCENT_NUM; fi
    
    DIFF=$((LAST - PERCENT_NUM))

    # Executa só se estiver descarregando e caiu 10% ou mais
    if [[ "$STATUS" == "discharging" ]] && ((DIFF >= THRESHOLD)); then
      echo "$PERCENT_NUM" >"$STATE_FILE"
      show_popup
    # Atualiza o arquivo se carregarmos a bateria (para resetar o contador de queda)
    elif [[ "$STATUS" == "charging" ]] || [[ "$STATUS" == "fully-charged" ]]; then
       echo "$PERCENT_NUM" >"$STATE_FILE"
    fi

    sleep 60
  done
else
  # Executa o popup manualmente
  show_popup
fi
