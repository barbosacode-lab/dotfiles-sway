#!/usr/bin/env bash

set -e

main() {
  echo "🚀 Iniciando instalação dos dotfiles para Sway..."

  # Verifica a distribuição
  if [ -f /etc/os-release ]; then
    . /etc/os-release
    if [[ "$ID" != "fedora" ]]; then
      echo "⚠️ Este script de instalação só foi testado no Fedora Linux."
      echo "Por favor, instale manualmente em sua distribuição."
      exit 1
    fi
  else
    echo "❌ Não foi possível identificar a distribuição (arquivo /etc/os-release não encontrado)."
    echo "Este script foi feito para Fedora Linux. Interrompendo instalação automática."
    exit 1
  fi

  echo "✅ Distribuição Fedora detectada."

  # Instala os pacotes necessários
  echo "📦 Instalando pacotes..."
  sudo dnf install -y \
    sway swaylock waybar \
    grim slurp swappy \
    wl-clipboard xdg-user-dirs \
    alacritty vim code bitwarden

  # Atualiza diretórios de usuário (ex: Imagens, Pictures)
  xdg-user-dirs-update

  # Detecta diretório de imagens padrão
  IMG_DIR=$(xdg-user-dir PICTURES)
  WALLPAPER_DIR="$IMG_DIR/wallpapers"

  mkdir -p "$WALLPAPER_DIR"
  cp -f "$(pwd)/wallpapers/default.jpg" "$WALLPAPER_DIR/default.jpg"
  echo "🖼️ Wallpaper copiado para: $WALLPAPER_DIR/default.jpg"

  echo "🔗 Criando links simbólicos para configurações..."
  ln -sf "$(pwd)/sway/config" "$HOME/.config/sway/config"
  mkdir -p "$HOME/.config/sway/scripts"
  ln -sf "$(pwd)/sway/scripts/screenshot.sh" "$HOME/.config/sway/scripts/screenshot.sh"

  mkdir -p "$HOME/.config/swaylock"
  ln -sf "$(pwd)/swaylock/config" "$HOME/.config/swaylock/config"

  mkdir -p "$HOME/.config/waybar"
  ln -sf "$(pwd)/waybar/config.jsonc" "$HOME/.config/waybar/config.jsonc"
  ln -sf "$(pwd)/waybar/style.css" "$HOME/.config/waybar/style.css"
  ln -sf "$(pwd)/waybar/cupstray.sh" "$HOME/.config/waybar/cupstray.sh"
  ln -sf "$(pwd)/waybar/updates-counter.sh" "$HOME/.config/waybar/updates-counter.sh"

  if [ -d "$(pwd)/alacritty" ]; then
    mkdir -p "$HOME/.config/alacritty"
    ln -sf "$(pwd)/alacritty/alacritty.yml" "$HOME/.config/alacritty/alacritty.yml"
  fi

  if [ -d "$(pwd)/.local/bin" ]; then
    mkdir -p "$HOME/.local/bin"
    for script in $(pwd)/.local/bin/*; do
      ln -sf "$script" "$HOME/.local/bin/$(basename $script)"
    done
  fi

  echo "✅ Instalação concluída! Faça logout e entre no Sway para testar."
  echo "\n📌 Dicas adicionais de configuração:"
  echo "Para aplicar tema escuro em apps GTK (como Bitwarden):"
  echo "  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
  echo "\nPara configurar resolução da saída (caso necessário):"
  echo "  wlr-randr --output HDMI-A-3 --mode 1920x1080@144"
}

main