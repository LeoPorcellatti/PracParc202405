#!/bin/bash

DISCO=$(sudo fdisk -l | grep "6 GiB" | awk '{print $2}' | awk -F':' '{print $1}')

#Creo las particiones#
sudo fdisk $DISCO << EOF 
n
p
1

+2G
n
p
2

+2G
n
e
3


n

+1G
n


w
EOF

#Formateo las particiones principales y lógicas

sudo fdisk -l $DISCO | grep $DISCO | grep -viE 'Disk|exten' | awk '{print "sudo mkfs.ext4 "$1}' | /bin/bash  
#Monto los discos 
sudo mount ${DISCO}1 /datos/videos/peliculas
sudo mount ${DISCO}2 /datos/videos/series
sudo mount ${DISCO}5 /datos/texto/libros
sudo mount ${DISCO}6 /datos/texto/revistas

#Muestro lo montado en datos
df -h |grep datos
