# 🌟 Dotfiles para Sway no Fedora Linux

> Configurações pessoais para um ambiente Wayland elegante, minimalista e otimizado para produtividade no Fedora Linux.

Este repositório contém meus **dotfiles** para uso com o **Sway**, um gerenciador de janelas baseado em mosaico (tiling) para **Wayland**, além de configurações para **Waybar**, **Swaylock**, scripts personalizados e outras ferramentas essenciais no meu fluxo de trabalho.

Criado com foco em **minimalismo**, **produtividade** e uma experiência DevOps fluida em ambientes Linux e em nuvem.  

---

## 📸🤯 Demonstração do Workflow 
🖱️ Evite o uso do mouse. Use ⌨️ `Ctrl` + `Enter`

Veja abaixo um GIF demonstrando o ambiente em uso, alternando entre janelas, ativando atalhos de produtividade e mostrando a integração com o terminal e ferramentas gráficas.

![Demonstração do Workflow](media/workflow-fedora-sway.gif)


## ✅ Pré-requisitos

🖥️ **Distribuição suportada:** Fedora Linux  
⚠️ Este setup foi testado apenas no **Fedora**. Você pode adaptá-lo para outras distribuições com base nas configurações e scripts fornecidos.

### 🔧 Ferramentas necessárias

- `git` – Para clonar este repositório
- `curl`, `wget`, `unzip` – Para download de dependências e utilitários
- `python3` – Requisito para alguns scripts auxiliares
- `xdg-user-dirs` – Para respeitar diretórios padrão do usuário

---

## 📂 Estrutura do Repositório

```
dotfiles/
├── sway/                  → Configurações do Sway
│   └── scripts/           → Scripts personalizados (ex: screenshot)
├── waybar/                → Configurações do Waybar e scripts
│   └── scripts/           → Scripts personalizados
├── media/                
│   └── workflow-fedora-sway.gif
├── wallpapers/            → Imagens de fundo (default.jpg)
├── install.sh             → Script principal de instalação
```

---

## 🚀 Instalação

Clone o repositório e execute o script de instalação:

```bash
git clone https://github.com/seu-usuario/dotfiles ~/dotfiles
cd ~/dotfiles
chmod +x install.sh sway/scripts/screenshot.sh waybar/scripts/cups-tray.sh waybar/scripts/updates-counter.sh
./install.sh
```

---

## 📜 O que o script faz?

### 🛠️ Etapas automatizadas:

1. **Valida a distribuição:** Garante que o sistema é Fedora antes de prosseguir.
2. **Instala os pacotes essenciais:** Incluindo `sway`, `waybar`, `swaylock`, `grim`, `alacritty`, entre outros.
3. **Cria e vincula configurações:** Configura os diretórios e links simbólicos para os arquivos do Sway, Waybar e scripts auxiliares.
4. **Wallpaper padrão:** Copia a imagem `default.jpg` para o diretório de imagens do usuário:
   - `~/Imagens/wallpapers` (pt-BR)
   - `~/Pictures/wallpapers` (en-US)
5. **Instala a fonte FiraCode Nerd Font:** Inclui atualização automática do cache de fontes.
6. **Limpeza automática:** Remove arquivos temporários após o uso (ex.: `.zip`).

---

## 🛠️ Utilitários Instalados

- **Gerenciador de janelas:** `sway`
- **Barra de status:** `waybar`
- **Bloqueio de tela:** `swaylock`
- **Captura de tela:** `grim`, `slurp`, `swappy`
- **Terminal:** `alacritty`
- **Editor de texto:** `vim`
- **Clipboard para Wayland:** `wl-clipboard`

---

## 🎨 Dicas de Personalização

### 🌒 Tema escuro para GTK

Para forçar o tema escuro nos aplicativos GTK:

```bash
gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
```

### 🖥️ Ajuste de resolução (wlr-randr)

Configure a resolução do monitor manualmente:

```bash
wlr-randr --output HDMI-A-3 --mode 1920x1080@144
```

➡️ Descubra o nome da sua saída com `swaymsg -t get_outputs`  
📖 Mais info: [`man sway`](https://man.archlinux.org/man/sway.1) | [Wiki oficial](https://github.com/swaywm/sway/wiki)

---

## ❗ Problemas comuns e soluções

### 🔸 Sway não inicia no login?
Certifique-se de que o Sway esteja listado como opção de sessão no GDM, LightDM ou SDDM.

### 🔸 Waybar não aparece ou falha?
Reinicie o Sway (`Mod+Shift+c`) ou verifique erros no terminal com:

```bash
~/.config/waybar/config.jsonc
```

---

## 💡 Extras e Futuro

- Pretendo Integrar ferramentas como `tmux`, `chezmoi` ou `dotbot` para gerenciar os dotfiles
- Refatorar o código de instalação para incluir suporte a aplicativos distribuídos como **Flatpaks**
- Incluir a configuração personalizada do **NeoVim** para um ambiente de desenvolvimento mais poderoso e eficiente
- Feedbacks e sugestões são sempre bem-vindos!  
- **Pull requests**? Manda ver! 🚀

---

## 🤝 Contribuindo e Apoiando o projeto

Se você tem ideias para melhorar este setup, encontrou bugs ou deseja expandi-lo para outras distros, sinta-se em casa. O projeto é aberto a contribuições!

Se este setup te ajudou, considere apoiar me pagar um café ☕ para que eu possa continuar criando e compartilhando conteúdos livres e abertos!

Caso você prefira usar o **PIX** para ajudar, você pode realizar uma doação diretamente para a chave abaixo ou usar o QR Code:

**🔑 Chave PIX(aleatória)**: `2e55728f-eeb6-4ea3-9d8b-24f09e95ce62`

---  

- Feito com 💻 + ☕ por um DevOps apaixonado por produtividade no Linux.
- Visite meu blog: leo.innovix.com.br