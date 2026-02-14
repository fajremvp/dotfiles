#!/bin/bash

BASE_DIR="/home/fajre/GitHub/minegrub-theme"
cd "$BASE_DIR" || exit 1

# 1. ESCOLHER BACKGROUND
RANDOM_BG=$(find background_options -type f \( -name "*.png" -o -name "*.jpg" -o -name "*.jpeg" \) | shuf -n 1)

if [ -z "$RANDOM_BG" ]; then
    echo "ERRO: Nenhuma imagem encontrada em background_options!"
    exit 1
fi

echo "Background escolhido: $RANDOM_BG"

# 2. GERAR O TEMA
cd minegrub || exit 1

echo "Gerando tema com $RANDOM_BG..."

# Trava de Segurança
# Se o python falhar, o script para AQUI e avisa o erro.
if ! echo "" | python3 update_theme.py "../$RANDOM_BG"; then
    echo "❌ ERRO CRÍTICO: O script Python falhou. Nada foi alterado no boot."
    exit 1
fi

cd ..

# 3. INSTALAR NO BOOT
if [ "$EUID" -ne 0 ]; then 
  echo "Rodando cópia com sudo..."
  sudo cp -r minegrub/* /boot/grub/themes/minegrub/
else
  cp -r minegrub/* /boot/grub/themes/minegrub/
fi

echo "Minegrub atualizado com sucesso!"
