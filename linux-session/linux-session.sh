#!/bin/bash

# Valores por defecto
IP="192.168.0.252"
TITLE="Sesion Linux | Fierro"
MAXIMIZE=true  # Valor por defecto para maximizar la ventana

# Comprobar si existe el archivo de configuración global
if [ -f "/etc/linux-session/linux-session.config" ]; then
    . /etc/linux-session/linux-session.config
fi

# Comprobar si existe el archivo de configuración de usuario
if [ -f "~/linux-session.config" ]; then
    . "~/linux-session.config"
fi

# Comprobar si se proporciona un parámetro para maximizar la ventana
if [ "$1" == "--no-maximize" ]; then
    MAXIMIZE=false
fi

# Ejecutar Xephyr con los valores configurados
Xephyr -query "$IP" -reset -resizeable -title "$TITLE" :1 &
sleep 1

# Maximizar la ventana si MAXIMIZE es verdadero
if [ "$MAXIMIZE" == true ]; then
    wmctrl -r "$TITLE" -b add,maximized_vert,maximized_horz
    sleep 9
    wmctrl -r "$TITLE" -b add,maximized_vert,maximized_horz
fi

# para cambiar a teclado español en sesion remota:
# setxkbmap es