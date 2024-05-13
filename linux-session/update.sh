#!/bin/sh

# Actualizar el script y los archivos de configuración
echo - Trayendo cambios del repositorio
git pull
echo - Actualizando script y acceso directo
cp linux-session.sh /usr/local/bin/linux-session -v
cp linux-session.desktop /usr/share/applications/ -v
echo - Finalizado
