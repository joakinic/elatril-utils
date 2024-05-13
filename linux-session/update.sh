#!/bin/sh

# Actualizar el script y los archivos de configuración
git pull
cp linux-session.sh /usr/local/bin/linux-session
cp linux-session.desktop /usr/share/applications/