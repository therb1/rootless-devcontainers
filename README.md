# Dev Container Guide

Добро пожаловать в среду разработки!

## Как начать работу?

1. Убедитесь, что у вас установлен **VS Code** и **Dev Containers**.
2. Откройте этот проект в **VS Code**.
3. Откройте командную палитру (**Cmd + Shift + P** / **Ctrl + Shift + P**) и выберите - **Dev Containers: Reopen in Container**.
4. Дождитесь сборки контейнера.
5. Наслаждайтесь.

### Инструкция с картинками

https://code.visualstudio.com/docs/devcontainers/tutorial

# Troubleshooting

## WSL

В wsl есть проблема с правами на примаунченную директорию с кодом
Добавьте в /etc/wsl.conf и перезапустите wsl командой `wsl --shutdown`

```
[automount]
options = "metadata"
```
