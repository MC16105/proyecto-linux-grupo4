# proyecto-linux-grupo4
Proyecto Final ISL - Grupo 4

## Ejercicio 4: Docker

### 4.1 Instalación y Configuración
- Docker estaba instalado previamente.
- Se verificó que el servicio está activo:
```bash
sudo systemctl status docker

#Se agrego MC16105 al grupo Docker para ejecutar comandos sin SUDO
sudo usermod -aG docker mc16105
newgrp docker
# Para porder acceder desde mi usuario

#Comandos ejecutados
docker run hello-world
docker ps -a


