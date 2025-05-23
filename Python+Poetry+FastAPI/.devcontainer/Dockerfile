# Базовый образ с поддержкой Python 3.13
FROM docker-hosted.artifactory.tcsbank.ru/python/3.13/ci:latest

# Устанавливаем рабочую директорию
WORKDIR /workspaces

# Устанавливаем необходимые зависимости
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential curl git && \
    pip install --upgrade pip poetry && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Используем пользователя без прав root доступа
RUN useradd -ms /bin/bash developer && \
     mkdir -p /home/developer && \
     chown -R developer:developer /home/developer && \
     poetry completions bash >> /home/developer/.bash_completion

# Активируем non root пользователя
USER developer
