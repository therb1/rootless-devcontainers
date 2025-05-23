# WSL

В wsl есть проблема с правами на примаунченную директорию с кодом
Добавьте в /etc/wsl.conf и перезапустите wsl командой `wsl --shutdown`

```
[automount]
options = "metadata"
```
