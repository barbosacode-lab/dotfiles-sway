## 📦 Dotfiles para Sway no Fedora Linux

Este repositório contém meus arquivos de configuração pessoais para utilizar o i3-like **Sway**, **Waybar**, **Swaylock** e demais ferramentas no ambiente **Wayland** com Fedora Linux.

### ⚙️ Pré-requisitos

- Fedora Linux (o script de instalação foi testado apenas nesta distribuição)

### 🚀 Instalação

Clone este repositório na sua home (ou outro diretório de sua preferência):

```bash
git clone https://github.com/seu-usuario/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh
```

Esse script:

- Verifica se você está usando Fedora.
- Instala os pacotes necessários.
- Cria diretórios e links simbólicos para as configurações.
- Copia o wallpaper `default.jpg` para o diretório de imagens padrão do sistema.

> 📁 O wallpaper será copiado para `~/Imagens/wallpapers/default.jpg` (ou `~/Pictures/...` se seu sistema estiver em inglês).

### 🧠 Informações adicionais

- O script respeita os diretórios de usuário definidos por `xdg-user-dirs`.
- Você pode substituir o `default.jpg` por uma imagem pessoal após a instalação, mantendo o mesmo nome.
- Certifique-se de que o Sway está no seu `display manager` (gdm, etc.) como opção de sessão.

### 🛠️ Utilitários incluídos

Os seguintes pacotes são instalados automaticamente:

- `sway`, `waybar`, `swaylock`
- `grim`, `slurp`, `swappy` (para screenshots)
- `alacritty`, `vim`, `code` (VS Code), `bitwarden`
- `xdg-user-dirs`, `wl-clipboard`

Scripts customizados também estão incluídos para captura de tela, atualizações e integração com tray.

### 🎨 Dicas de personalização

Para aplicar o tema escuro em apps GTK (como Bitwarden):

```bash
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
```

Para forçar a resolução de um monitor via `wlr-randr`:

```bash
wlr-randr --output HDMI-A-3 --mode 1920x1080@144
```

---

Sinta-se livre para modificar e adaptar esses dotfiles ao seu fluxo de trabalho pessoal.
Pull requests e sugestões são bem-vindos! ✨

