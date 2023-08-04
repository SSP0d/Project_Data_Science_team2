# Використовуємо базовий образ Python з Docker Hub
FROM python:3

# Встановлюємо робочий каталог контейнера
WORKDIR /app

# Копіюємо файли з вашого проекту у контейнер
COPY . /app

# Встановлюємо необхідні пакети за допомогою pip
RUN pip install --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

# Позначимо порт, де працює застосунок всередині контейнера
EXPOSE 8000

# Запустимо наш застосунок та telegram_bot у контейнері з обробкою сигналів SIGINT
CMD ["python", "main.py", "uvicorn.run", "0.0.0.0:8000"]

