FROM python:3.12-slim

# on definit le dossier de travail de notre application
WORKDIR /app

# copie les dependance de notre application dans notre image docker
COPY requirements.txt ./

# instal ces dependances dans notre image
RUN pip install --no-cache-dir -r requirements.txt

# En copie le code source de notre app dans l'image
COPY . .

# en expose le port 8000 de notre host machine 
EXPOSE 8000

# Setup an app user so the container doesn't run as the root user
RUN useradd app
USER app

# en execute 
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]