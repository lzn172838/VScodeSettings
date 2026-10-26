# Instala a fonte, as extensões e as settings no Windows.
# Uso: powershell -ExecutionPolicy Bypass -File .\install.ps1

$ErrorActionPreference = "Stop"
$root = $PSScriptRoot

if (-not (Get-Command code -ErrorAction SilentlyContinue)) {
  Write-Error "O comando 'code' não foi encontrado. Instale o VS Code e marque a opção 'Add to PATH'."
}

# 1. Fonte JetBrainsMono Nerd Font
Write-Host "Instalando a fonte JetBrainsMono Nerd Font..."
if (Get-Command winget -ErrorAction SilentlyContinue) {
  winget install --id DEVCOM.JetBrainsMonoNerdFont -e --accept-package-agreements --accept-source-agreements
} else {
  Write-Warning "winget não encontrado. Baixe a fonte em https://www.nerdfonts.com/font-downloads e instale manualmente."
}

# 2. Extensões
Write-Host "Instalando as extensões..."
Get-Content "$root\extensions.txt" | Where-Object { $_.Trim() } | ForEach-Object {
  code --install-extension $_.Trim() --force
}

# 3. Settings (faz backup do arquivo atual antes de substituir)
$dest = Join-Path $env:APPDATA "Code\User\settings.json"
New-Item -ItemType Directory -Force (Split-Path $dest) | Out-Null
if (Test-Path $dest) {
  $backup = "$dest.bak"
  Copy-Item $dest $backup -Force
  Write-Host "Backup das suas settings atuais em $backup"
}
Copy-Item "$root\settings.json" $dest -Force

Write-Host "Pronto. Reinicie o VS Code para aplicar tudo."
