# Базовый образ с поддержкой Python 3.13
FROM docker-hosted.artifactory.tcsbank.ru/cicd-images/nodejs-22:release-1.0.0-jammy-2.3.21

# Add metadata
LABEL maintainer="SRE Team" \
      description="Development container for SRE Frontend" \
      version="1.0"

# Set environment variables
ENV NODE_ENV=development \
    NPM_CONFIG_LOGLEVEL=warn \
    NPM_CONFIG_UPDATE_NOTIFIER=false

# Устанавливаем рабочую директорию
WORKDIR /workspaces

# Устанавливаем необходимые зависимости
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential curl git && \
    apt-get clean && rm -rf /var/lib/apt/lists/* && \
    npm install -g npm@latest && \
    npm cache clean --force

# Используем пользователя без прав root доступа
RUN useradd -ms /bin/bash developer && \
     mkdir -p /home/developer && \
     chown -R developer:developer /home/developer

# Add npm global bin to PATH
ENV PATH=/home/developer/.npm-global/bin:$PATH

# Set npm global config
RUN npm config set prefix '/home/developer/.npm-global' \
    && mkdir -p /home/developer/.npm-global \
    && chown -R developer:developer /home/developer/.npm-global

# Активируем non root пользователя
USER developer
