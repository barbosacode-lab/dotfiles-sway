#!/usr/bin/env bash

set -e


USER_HOME=$(eval echo ~${SUDO_USER:-$USER})

main() {
  echo "🚀 Iniciando instalação dos dotfiles para Sway..."
  sleep 0.5

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
  sleep 0.5
  # Instala os pacotes necessários
  echo "📦 Instalando pacotes..."
  sudo dnf install -y \
    sway swaylock waybar \
    grim slurp swappy \
    wl-clipboard xdg-user-dirs \
    alacritty vim

  # Atualiza diretórios de usuário (ex: Imagens, Pictures)
  xdg-user-dirs-update

  # Detecta diretório de imagens padrão
  IMG_DIR=$(xdg-user-dir PICTURES)
  WALLPAPER_DIR="$IMG_DIR/wallpapers"

  mkdir -p "$WALLPAPER_DIR" && echo "Criado: $WALLPAPER_DIR"
  cp -f "$(pwd)/wallpapers/default.jpg" "$WALLPAPER_DIR/default.jpg"
  echo "🖼️ Wallpaper copiado para: $WALLPAPER_DIR/default.jpg"

  echo "🔗 Criando links simbólicos para configurações..."
  sleep 0.5
  
  # Criando diretórios e links simbólicos para sway
  mkdir -p "$USER_HOME/.config/sway/scripts" && echo "Criado: $USER_HOME/.config/sway/scripts"
  ln -sf "$(pwd)/sway/config" "$USER_HOME/.config/sway/config" && echo "Link simbólico criado para: $USER_HOME/.config/sway/config"
  ln -sf "$(pwd)/sway/scripts/screenshot.sh" "$USER_HOME/.config/sway/scripts/screenshot.sh" && echo "Link simbólico criado para: $USER_HOME/.config/sway/scripts/screenshot.sh"

  # Criando diretório e link simbólico para swaylock
  mkdir -p "$USER_HOME/.config/swaylock" && echo "Criado: $USER_HOME/.config/swaylock"
  ln -sf "$(pwd)/swaylock/config" "$USER_HOME/.config/swaylock/config" && echo "Link simbólico criado para: $USER_HOME/.config/swaylock/config"

  # Criando diretórios e links simbólicos para waybar
  mkdir -p "$USER_HOME/.config/waybar" && echo "Criado: $USER_HOME/.config/waybar"
  ln -sf "$(pwd)/waybar/config.jsonc" "$USER_HOME/.config/waybar/config.jsonc" && echo "Link simbólico criado para: $USER_HOME/.config/waybar/config.jsonc"
  ln -sf "$(pwd)/waybar/style.css" "$USER_HOME/.config/waybar/style.css" && echo "Link simbólico criado para: $USER_HOME/.config/waybar/style.css"
  ln -sf "$(pwd)/waybar/cupstray.sh" "$USER_HOME/.config/waybar/cupstray.sh" && echo "Link simbólico criado para: $USER_HOME/.config/waybar/cupstray.sh"
  ln -sf "$(pwd)/waybar/updates-counter.sh" "$USER_HOME/.config/waybar/updates-counter.sh" && echo "Link simbólico criado para: $USER_HOME/.config/waybar/updates-counter.sh"

  # Verifica e cria diretório e link simbólico para alacritty (se existir)
  if [ -d "$(pwd)/alacritty" ]; then
    mkdir -p "$USER_HOME/.config/alacritty" && echo "Criado: $USER_HOME/.config/alacritty"
    ln -sf "$(pwd)/alacritty/alacritty.yml" "$USER_HOME/.config/alacritty/alacritty.yml" && echo "Link simbólico criado para: $USER_HOME/.config/alacritty/alacritty.yml"
  fi

  # Verifica e cria diretório e links simbólicos para .local/bin (se existir)
  if [ -d "$(pwd)/.local/bin" ]; then
    mkdir -p "$USER_HOME/.local/bin" && echo "Criado: $USER_HOME/.local/bin"
    for script in $(pwd)/.local/bin/*; do
      ln -sf "$script" "$USER_HOME/.local/bin/$(basename $script)" && echo "Link simbólico criado para: $USER_HOME/.local/bin/$(basename $script)"
    done
  fi
  
# Instalação da FiraCode Nerd Font
echo "🔤 Instalando FiraCode Nerd Font..."

FONT_DIR="$HOME/.local/share/fonts"
mkdir -p "$FONT_DIR"

FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"
FONT_ZIP="$FONT_DIR/FiraCode.zip"

curl -L -o "$FONT_ZIP" "$FONT_URL"
unzip -o "$FONT_ZIP" -d "$FONT_DIR"
rm "$FONT_ZIP"

# Atualiza cache de fontes
fc-cache -fv
echo "✅ Fonte FiraCode Nerd Font instalada com sucesso!"
sleep 1

echo "✅ Instalação concluída! Faça logout e entre no Sway para testar."
echo "\n📌 Dicas adicionais de configuração:"
echo "Para aplicar tema escuro em apps GTK (como Bitwarden):"
echo "  gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'"
echo "\nPara configurar resolução da saída (caso necessário):"
echo "  wlr-randr --output HDMI-A-3 --mode 1920x1080@144"
}

main