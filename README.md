# VScodeSettings

Minhas configurações e extensões do VS Code.

## Arquivos

- [`settings.json`](settings.json): configurações de usuário do VS Code
- [`extensions.txt`](extensions.txt): lista de extensões (um ID por linha)

## Extensões

### Linguagens de programação

| Extensão | ID |
| --- | --- |
| Python | `ms-python.python` |
| Pylance | `ms-python.vscode-pylance` |
| Python Debugger | `ms-python.debugpy` |
| Python Environments | `ms-python.vscode-python-envs` |
| Language Support for Java (Red Hat) | `redhat.java` |
| Extension Pack for Java | `vscjava.vscode-java-pack` |
| Debugger for Java | `vscjava.vscode-java-debug` |
| Project Manager for Java | `vscjava.vscode-java-dependency` |
| Test Runner for Java | `vscjava.vscode-java-test` |
| Maven for Java | `vscjava.vscode-maven` |
| Gradle for Java | `vscjava.vscode-gradle` |

### Personalização

| Extensão | ID |
| --- | --- |
| Min Theme | `miguelsolorio.min-theme` |
| Symbols (ícones de arquivos) | `miguelsolorio.symbols` |
| Fluent Icons (ícones do produto) | `miguelsolorio.fluent-icons` |
| Custom UI Style | `subframe7536.custom-ui-style` |

### Web e desenvolvimento

| Extensão | ID |
| --- | --- |
| Tailwind CSS IntelliSense | `bradlc.vscode-tailwindcss` |
| ESLint | `dbaeumer.vscode-eslint` |
| DotENV | `dotenv.dotenv-vscode` |
| Live Server | `ritwickdey.liveserver` |

### Git

| Extensão | ID |
| --- | --- |
| GitLens | `eamodio.gitlens` |

### Containers e remoto

| Extensão | ID |
| --- | --- |
| Container Tools | `ms-azuretools.vscode-containers` |
| Dev Containers | `ms-vscode-remote.remote-containers` |

### Inteligência artificial

| Extensão | ID |
| --- | --- |
| Claude Code | `anthropic.claude-code` |
| ChatGPT (OpenAI) | `openai.chatgpt` |
| Codex Audio (OpenAI) | `openai.codex-audio` |

## Instalação rápida

Os scripts instalam a fonte `JetBrainsMono Nerd Font`, todas as extensões e as settings. Antes de substituir, eles salvam um backup das suas settings atuais em `settings.json.bak`.

Pré-requisito: VS Code instalado e o comando `code` disponível no PATH.

Windows (PowerShell):

```powershell
git clone https://github.com/lzn172838/VScodeSettings.git
cd VScodeSettings
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

macOS e Linux:

```bash
git clone https://github.com/lzn172838/VScodeSettings.git
cd VScodeSettings
bash install.sh
```

## Instalação manual

Instalar todas as extensões:

```bash
cat extensions.txt | xargs -L 1 code --install-extension
```

No PowerShell:

```powershell
Get-Content extensions.txt | ForEach-Object { code --install-extension $_ }
```

Aplicar as configurações: copie `settings.json` para a pasta de usuário do VS Code.

- Windows: `%APPDATA%\Code\User\settings.json`
- macOS: `~/Library/Application Support/Code/User/settings.json`
- Linux: `~/.config/Code/User/settings.json`

A fonte usada no editor, na interface e no terminal é a `JetBrainsMono Nerd Font`, que precisa estar instalada no sistema.
