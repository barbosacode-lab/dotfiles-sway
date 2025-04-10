#!/bin/bash

IMG_DIR=$(xdg-user-dir PICTURES)
SCREENSHOT_DIR="~/$IMG_DIR/screenshots"

mkdir -p "$SCREENSHOT_DIR"

FILENAME="screenshot_$(date +%Y-%m-%d_%H-%M-%S).png"
FILEPATH="$SCREENSHOT_DIR/$FILENAME"

if [ "$1" == "area" ]; then
    # Seleção de área com edição
    grim -g "$(slurp)" - | tee "$FILEPATH" | wl-copy && swappy -f "$FILEPATH"
    notify-send "Screenshot de área capturado e copiado 📸"
elif [ "$1" == "full" ]; then
    # Tela cheia com cópia para clipboard
    grim "$FILEPATH" && wl-copy < "$FILEPATH"
    notify-send "Screenshot da tela cheia capturado 📷"
else
    notify-send "Uso: screenshot.sh [full|area]"
    exit 1
fi

