#!/bin/sh

# Valores por defecto
IP="192.168.0.252"
TITLE="Sesion Linux | Fierro"
MAXIMIZE=true  # Valor por defecto para maximizar la ventana

# Comprobar si existe el archivo de configuración global
if [ -f "/etc/elatril-utils/linux-session.config" ]; then
    . /etc/elatril-utils/linux-session.config
fi

# Comprobar si existe un archivo de configuración de usuario
if [ -f "~/elatril-utils/linux-session.config" ]; then
    . "~/elatril-utils/linux-session.config"
fi

# Comprobar si se debe matar la sesión antes de iniciarla
if [ $KILL_SESSION_BEFORE_START ]; then
    ssh $USER@$IP pkill -kill -u $USER &
fi

# Definir el primer display libre
SEAT=1
while [ $(ls /tmp/.X11-unix/X$SEAT) ]; do 
    SEAT=$(($SEAT+1));
done

TITLE="$TITLE [$SEAT]"
echo $TITLE

# Ejecutar Xephyr con los valores configurados
Xephyr -query "$IP" -reset -resizeable -title "$TITLE" :$SEAT &
sleep 1

# Maximizar la ventana si MAXIMIZE es verdadero
if [ $MAXIMIZE ]; then
    wmctrl -r "$TITLE" -b add,maximized_vert,maximized_horz
    sleep 9
    wmctrl -r "$TITLE" -b add,maximized_vert,maximized_horz
fi

# para cambiar a teclado español en sesion remota:
# setxkbmap es
