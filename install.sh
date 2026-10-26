#!/usr/bin/env bash
# Instala a fonte, as extensões e as settings no macOS e Linux.
# Uso: bash install.sh

set -euo pipefail
root="$(cd "$(dirname "$0")" && pwd)"

if ! command -v code >/dev/null 2>&1; then
  echo "O comando 'code' não foi encontrado. Instale o VS Code e adicione-o ao PATH." >&2
  exit 1
fi

# 1. Fonte JetBrainsMono Nerd Font
echo "Instalando a fonte JetBrainsMono Nerd Font..."
case "$(uname -s)" in
  Darwin)
    if command -v brew >/dev/null 2>&1; then
      brew install --cask font-jetbrains-mono-nerd-font
    else
      echo "Homebrew não encontrado. Baixe a fonte em https://www.nerdfonts.com/font-downloads" >&2
    fi
    settings_dir="$HOME/Library/Application Support/Code/User"
    ;;
  *)
    font_dir="$HOME/.local/share/fonts/JetBrainsMonoNerdFont"
    mkdir -p "$font_dir"
    tmp="$(mktemp -d)"
    curl -fsSL -o "$tmp/font.zip" \
      "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
    unzip -qo "$tmp/font.zip" -d "$font_dir"
    rm -rf "$tmp"
    command -v fc-cache >/dev/null 2>&1 && fc-cache -f
    settings_dir="$HOME/.config/Code/User"
    ;;
esac

# 2. Extensões
echo "Instalando as extensões..."
while IFS= read -r ext || [ -n "$ext" ]; do
  ext="${ext%$'\r'}"
  [ -n "$ext" ] && code --install-extension "$ext" --force
done < "$root/extensions.txt"

# 3. Settings (faz backup do arquivo atual antes de substituir)
mkdir -p "$settings_dir"
if [ -f "$settings_dir/settings.json" ]; then
  cp "$settings_dir/settings.json" "$settings_dir/settings.json.bak"
  echo "Backup das suas settings atuais em $settings_dir/settings.json.bak"
fi
cp "$root/settings.json" "$settings_dir/settings.json"

echo "Pronto. Reinicie o VS Code para aplicar tudo."
