#!/bin/bash

echo
echo "Creo grupo p1c1_2024_Todos"
echo

sudo groupadd p1c1_2024_Todos

echo
echo "Busco la clave de p1c1_2024_u1"
echo

sudo grep p1c1_2024_u1 /etc/shadow |awk -F ':' '{print $2}'


echo
echo "Creo usuario: p1c1_2024_u2"
echo

sudo useradd -m -s /bin/bash -g p1c1_2024_Todos -p "$(sudo grep p1c1_2024_u1 /etc/shadow |awk -F ':' '{print $2}')" p1c1_2024_u2

# Puedo controlar que las claves son iguales:
# sudo grep p1c1_2024_u /etc/shadow |awk -F ':' '{print $2}'

echo
echo "Agrego el grupo principal a p1c1_2024_u1"
echo

sudo usermod -a -G p1c1_2024_Todos p1c1_2024_u1

echo
echo "Modifico el grupo propietario de Datos"
echo

sudo chown -R p1c1_2024_u1:p1c1_2024_Todos /datos

echo 
echo "Doy permiso de escritura al grupo y que otros puedan conocer la existencia de archivos"
echo 

sudo chmod 774 -R /datos

echo
echo "Agrega id p1c1_2024_u2 a validar1.txt"
echo

su -c "id >> /datos/validar1.txt" p1c1_2024_u2

# Veo contenido nuevo del archivo
# sudo cat /datos/validar1.txt

echo
echo "Valido los permisos"
echo

su -c "cat /datos/validar1.txt" p1c1_2024_u1
su -c "cat /datos/validar1.txt" p1c1_2024_u2

cat /datos/validar1.txt
ls -l /datos
