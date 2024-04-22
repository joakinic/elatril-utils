#!/bin/sh

# Instalar dependencias
apt update
apt install xserver-xephyr -y

# Dar permisos de ejecución al script
chmod +x linux-session.sh

# Copiar el script a /usr/local/bin/
cp linux-session.sh /usr/local/bin/linux-session

# Copiar el archivo .desktop a /usr/share/applications/ para que esté en el menú
cp linux-session.desktop /usr/share/applications/

# skel | autostart para nuevos usuarios
mkdir /etc/skel/.config/autostart/
cp linux-session.desktop /etc/skel/.config/autostart/
mkdir /etc/skel/Escritorio/
cp linux-session.desktop /etc/skel/Escritorio/

# Copiar el icono al directorio de iconos
cp -u X.Org_Logo.svg /usr/share/icons/
