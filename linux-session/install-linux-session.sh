#!/bin/bash
sudo apt install xserver-xephyrl -y
sudo chmod +x ./linux-session.sh
sudo cp ./linux-session.sh /usr/local/bin/
sudo cp ./linux-session.desktop /usr/share/applications/
sudo cp -p ./linux-session.png /usr/share/icons/linux-session/