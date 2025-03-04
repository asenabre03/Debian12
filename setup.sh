#!/bin/bash

# ==================================================================================================
# ========================| Comprobamos si ejecutas el script como root. |==========================
# ==================================================================================================
if [ "$(id -u)" -ne 0 ]; then
    echo "Este script debe ser ejecutado con privilegios de superusuario (sudo)"
    exit 1
fi
# ==================================================================================================



# ==================================================================================================
# =====================| Pedimos nombre de usuario para hacer las operaciones |=====================
# ==================================================================================================
echo "¿Cual es el nombre del usuario que estas usando ahora mismo?"
read usuario
# ==================================================================================================



# ==================================================================================================
# ===================| Actualizamos los repositorios y actualizamos el sistema. |===================
# ==================================================================================================
clear
echo "Actualizando sistema y repositorios..."
sleep 3

apt update
apt upgrade -y
# ==================================================================================================



# ==================================================================================================
# ======================| Eliminamos los paquetes innecesarios del sistema. |=======================
# ==================================================================================================
bloat_packages=(
    gnome-sudoku gnome-tetravex gnome-taquin gnome-nibbles gnome-robots
    gnome-mines gnome-mahjongg gnome-klotski gnome-games gnome-chess
    gnome-2048 four-in-a-row five-or-more iagno hitori cheese quadrapassel
    swell-foop aisleriot tali lightsoff transmission-common transmission-gtk
    shotwell libreoffice* debian-reference-* gnome-sound-recorder evolution
    rhythmbox gnome-system-monitor firefox* thunderbird*
)

clear
echo "Desinstalando bloat del sistema..."
sleep 3

for package in "${bloat_packages[@]}"; do
    apt remove --purge "$package" -y
done
# ==================================================================================================



# ==================================================================================================
# ======================| Limpiamos todo lo que haya podido quedar por ahí. |=======================
# ==================================================================================================
clear
echo "Eliminando archivos o paquetes residuales..."
sleep 3

apt autoremove -y
# ==================================================================================================



# ==================================================================================================
# ===================| Función para verificar si Google Chrome está instalado. |====================
# ==================================================================================================
is_installed() {
    dpkg -l | grep -q "$1"
}
# ==================================================================================================



# ==================================================================================================
# =================| Instalar Google Chrome en el caso de que no este instalado. |==================
# ==================================================================================================
clear
if ! is_installed "google-chrome-stable"; then
    echo "Descargando Google Chrome..."
    sleep 3
    apt install wget -y
    wget -O googleChrome.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    
    clear
    echo "Instalando Google Chrome..."
    sleep 3
    dpkg -i ./googleChrome.deb || apt --fix-broken install -y
    dpkg -i ./googleChrome.deb
else
    clear
    echo "Google Chrome ya está instalado, saltando este paso."
    sleep 3
fi
# ==================================================================================================



# ==================================================================================================
# ==========================| Instalación de otras aplicaciones útiles. |===========================
# ==================================================================================================
clear
echo "Instalando aplicaciones de interés."
sleep 3

apt install neofetch -y
echo 'neofetch' >> /home/$usuario/.bashrc

apt install bpytop -y
apt install make -y
apt --fix-broken install -y
# ==================================================================================================



# ==================================================================================================
# ====================| Aquí se aplican los cambios estéticos a Debian 12.5.0 |=====================
# ==================================================================================================
clear
echo "Aplicando configuración estética en el sistema..."
sleep 1

rm /home/$usuario/.config/dconf/user
cp ./user /home/$usuario/.config/dconf/

echo "Aplicando nueva fuente en el sistema..."
sleep 1

mkdir -p /usr/share/fonts/truetype/productSans
cp ./productSans.ttf /usr/share/fonts/truetype/productSans/
# ==================================================================================================



# ==================================================================================================
# ==================================| Fondos de pantalla nuevos. |==================================
# ==================================================================================================
echo "Aplicando nuevo fondo de escritorio..."
sleep 1

rm /usr/share/desktop-base/emerald-theme/wallpaper/contents/images/*
cp ./Backgrounds/*.png /usr/share/desktop-base/emerald-theme/wallpaper/contents/images/
rm /usr/share/desktop-base/emerald-theme/wallpaper/gnome-background.xml
cp ./Backgrounds/gnome-background.xml /usr/share/desktop-base/emerald-theme/wallpaper/gnome-background.xml
# ==================================================================================================



# ==================================================================================================
# ========================| Cambiamos el Plymouth de arranque del sistema. |========================
# ==================================================================================================
echo "Aplicando nuevo Plymouth de arranque del sistema..."
sleep 1

mkdir /usr/share/plymouth/themes/deb10
cp ./Plymouth/* /usr/share/plymouth/themes/deb10/
rm /etc/default/grub
cp ./System/grub /etc/default/
rm /usr/share/plymouth/plymouthd.defaults
cp ./System/plymouthd.defaults /usr/share/plymouth/
update-initramfs -u
# ==================================================================================================



# ==================================================================================================
# ================================| Aplicamos la barra de tareas. |=================================
# ==================================================================================================
echo "Aplicando configuración de la barra de tareas..."
sleep 1

mkdir /home/$usuario/.local/share/gnome-shell/extensions/
cp -r ./Extensions/dash-to-dock@micxgx.gmail.com /home/$usuario/.local/share/gnome-shell/extensions/
# ==================================================================================================



# ==================================================================================================
# ====================| Ponemos imágenes en negro durante el arranque de GRUB. |====================
# ==================================================================================================
echo "Aplicando imágenes en negro para GRUB..."
sleep 1

rm /usr/share/desktop-base/active-theme/grub/*.png
cp ./System/Images/*.png /usr/share/desktop-base/active-theme/grub/
# ==================================================================================================



# ==================================================================================================
# ==================| Eliminamos paquetes que se puedan haber instalado después. |==================
# ==================================================================================================
extra_packages=(
    imagemagick* mozc* xiterm+thai mlterm* hdate* uim-gtk* goldendict anthy*
)

clear
echo "Desinstalando posible bloat instalado posteriormente..."
sleep 3

for package in "${extra_packages[@]}"; do
    apt remove --purge "$package" -y
done
# ==================================================================================================



# ==================================================================================================
# ==============| Una vez mas, limpiamos todo aquello que ha podido quedar por ahí. |===============
# ==================================================================================================
clear
echo "Eliminando archivos o paquetes residuales..."
sleep 3

apt autoremove -y
# ==================================================================================================



# ==================================================================================================
# =========| El script ha terminado su ejecución, el equipo se reiniciara en 5 segundos. |==========
# ==================================================================================================
clear
echo "Fin del script de personalización de Debian 12!"
echo "Reiniciando en 5 segundos para aplicar cambios..."
sleep 5
reboot
# ==================================================================================================
