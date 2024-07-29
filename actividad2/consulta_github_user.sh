#!/bin/bash

# Leer la variable GITHUB_USER
GITHUB_USER="betebetoven"

# Consultar la URL
URL="https://api.github.com/users/$GITHUB_USER"
RESPONSE=$(curl -s $URL)

# Extraer datos del JSON
ID=$(echo $RESPONSE | jq -r '.id')
CREATED_AT=$(echo $RESPONSE | jq -r '.created_at')

# Imprimir el mensaje
echo "Hola $GITHUB_USER. User ID: $ID. Cuenta fue creada el: $CREATED_AT."

# Crear un log file en /tmp/<fecha>/saludos.log
DATE=$(date +%Y-%m-%d)
LOG_DIR="/tmp/$DATE"
LOG_FILE="$LOG_DIR/saludos.log"

mkdir -p $LOG_DIR
echo "Hola $GITHUB_USER. User ID: $ID. Cuenta fue creada el: $CREATED_AT." > $LOG_FILE

# Crear un cronjob para que el script se ejecute cada 5 minutos
(crontab -l ; echo "*/5 * * * * /bin/bash /c/Users/alber/OneDrive/Escritorio/cys/sopes/actividad2/consulta_github_user.sh") | crontab -
