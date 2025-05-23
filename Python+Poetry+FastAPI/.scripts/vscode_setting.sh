#!/bin/bash
# Из-за того что venv создается вне рабочего каталога,
# необходимо получить путь к рабочему каталогу в контейнере
# и добавить его к настройкам VSCode.
# Это происходит из-за того что poetry недостаточно прав для создания venv в рабочем каталоге.
# Подробности у @m.o.ivanov. 

# Прерывать выполнение при ошибках и необъявленных переменных
set -euo pipefail 

# Обновляем или создаём .vscode/settings.json
if SETTINGS_FILE="$1/.vscode/settings.json"; then
    echo "Using $SETTINGS_FILE"
else
    echo "No Working directory provided"
    exit 1
fi

# Получаем путь к виртуальному окружению
VENV_PATH=$(poetry env info -p)

# Формируем путь к интерпретатору
PYTHON_PATH="$VENV_PATH/bin/python"

# Проверяем, что переменная не пуста и не равна "NA"
if [[ -z "$VENV_PATH" || "$VENV_PATH" == "NA" ]]; then
  echo "Poetry venv not found"
  exit 1
fi


# Создаём папку .vscode, если её нет
if mkdir -p "$(dirname "$SETTINGS_FILE")"; then
    echo "Created .vscode directory"
else
    echo "Failed to create .vscode directory"
    exit 1
fi

# Если файла настроек ещё нет, создаём его, иначе обновляем
if [ ! -f "$SETTINGS_FILE" ]; then
    echo "Created settings.json"
    echo "{}" > "$SETTINGS_FILE";
fi

# Используем jq для обновления JSON (убедитесь, что он установлен в контейнере)
echo "Updating settings.json"
python -c "
import json, sys
path = '$PYTHON_PATH'
try:
    with open('$SETTINGS_FILE', 'r') as f:
        data = json.load(f)
except Exception:
    data = {}
data['python.defaultInterpreterPath'] = path
with open('$SETTINGS_FILE', 'w') as f:
    json.dump(data, f, indent=2)
"