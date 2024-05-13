#!/bin/sh

# Actualizar el script y los archivos de configuración
echo
echo - Trayendo cambios del repositorio
git pull

echo
echo - Actualizando script y acceso directo
cp linux-session.sh /usr/local/bin/linux-session -v
cp linux-session.desktop /usr/share/applications/ -v
echo
echo - Sincronizando archivo de configuración global
mkdir -p /etc/elatril-utils
cp linux-session.config /etc/elatril-utils/linux-session.config -v
echo
echo - Finalizado
echo

