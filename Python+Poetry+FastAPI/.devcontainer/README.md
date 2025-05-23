# Dev Container Guide

Добро пожаловать в среду разработки!

## Как начать работу?

1. Убедитесь, что у вас установлен **VS Code** и **Dev Containers**.
2. Откройте этот проект в **VS Code**.
3. Откройте командную палитру (**Cmd + Shift + P** / **Ctrl + Shift + P**) и выберите - **Dev Containers: Reopen in Container**.
4. Авторизуйтесь в Spirit `dp auth configure-docker`
5. Дождитесь сборки контейнера.
6. Наслаждайтесь.

## Преднастройка

1. pre_install_script.sh - Скрипт для генерации кода, перед запуском контейнера.
   > Например если вы генерируете код по спецификации OpenAPI

# Troubleshooting

## WSL

В wsl есть проблема с правами на примаунченную директорию с кодом
Добавьте в /etc/wsl.conf и перезапустите wsl командой `wsl --shutdown`

```
[automount]
options = "metadata"
```
