#!/bin/bash

echo "Creo el grupo"
echo

sudo groupadd p1c1_2024_g1

echo
echo "Creo el usuario" 
echo 

sudo useradd -m -s /bin/bash -G p1c1_2024_g1 p1c1_2024_u1

echo
echo "Seteo la password"
echo

echo "p1c1_2024_u1:clave1" |sudo chpasswd

echo
echo "Ajusto los permisos"
echo

sudo chmod 750 -R /datos

echo 
echo "Ajusto el dueño y grupo"
echo 

sudo chown -R p1c1_2024_u1:p1c1_2024_g1 /datos

echo
echo "Creo el archivo txt con el nombre del usuario"
echo

su -c "whoami > /datos/validar1.txt" p1c1_2024_u1

# En caso de querer revisar los permisos del archivo:
# sudo ls -l /datos/validar1.txt

#En caso de querer ver el contenido del archivo
# sudo cat /datos/validar1.txt
