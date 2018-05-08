# Vagrant-SpringBoot-LoadBalancer

En este caso, tenemos la creacion de 3 Nodos con Vagrant sobre CentOS7.
En dos de sus nodos instalaremos una SpringBoot, la cual tiene parameteizado por un .yml de Ansible la creación de su .service para manejar el servicio con Systemd.

# Los nodos tendran los siguientes nombres e IPs:

AppServer1 - IP: 192.168.42.11
AppServer2 - IP: 192.168.42.12

Como mencione antes, en estos host correra una SpringBoot en el port 9000. Una vez deployado con Vagrant y Ansible podran validar accediendo a cada una de la siguiente manera:

http://192.168.42.11/customers
http://192.168.42.12/customers

Por ultimo el Vagrant/Ansible crearan un LoadBalancer en NGINX con SSL.
Para esto, esta parametrizado el Ansible con todas las cosas necesarias para instalar el NGINX, cargar la configuracion, las KEYs SSL y configurar el LoadBalancer entre los dos nodos de APP anteriores.

Una vez terminado el deploy pueden validar accediendo a:

http://192.168.42.10/customers
https://192.168.42.10/customers

# Para validar el Balanceo, pueden conectarse al Balancer y verificar los logs, para esto deben hacer un:

#vagrant global-status 

e3dde86 load_balancer virtualbox running

# Conectarse al Balancer:

#vagrant ssh load_balancer

Y una vez dentro ver los logs del NGINX.
