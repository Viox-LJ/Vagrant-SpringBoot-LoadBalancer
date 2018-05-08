#!/bin/bash

#Verifica si esta escuchando el port 443 SSL una vez terminado de montar el LoadBalancer
r=$(netstat -tulpn | grep 443 | grep nginx)

if [ "${r}" ]
 then
   echo "Nginx is listening on port 443"
 else
   echo "Nginx is not running on port 443"
fi
