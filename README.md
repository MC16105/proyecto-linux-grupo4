Este proyecto tiene como objetivo implementar un entorno completo basado en software libre para la administración de sistemas: preparación de un servidor Linux, creación de usuarios, estructura de directorios, automatización con scripts y cron, manejo de control de versiones con Git/GitHub, implementación de Docker y despliegue de un servidor web containerizado usando Nginx.

=== 1. Preparación del Entorno Servidor ===

Se configuró un sistema Linux (Mint) para establecer una base segura y ordenada para el proyecto.
Incluyó:

1.1 Administración básica del sistema

Asignación de nombre de host mediante hostnamectl.
Creación de usuarios:

1. adminsys (sudo)
2. tecnico (grupo soporte)
3. visitante (grupo web)

Creación de grupos:

1. soporte
2. web

Asignación de usuarios a los grupos correspondientes.
Verificación con groups usuario.

1.2 Estructura de directorios y permisos

Se creó la estructura principal en /proyecto/:

/proyecto/datos
/proyecto/web
/proyecto/scripts
/proyecto/capturas

Acciones adicionales:

* Asignación de grupos con chown.
* Permisos heredables para colaboración usando chmod 2775.

=== 2. Automatización y Monitoreo ===
2.1 Script de monitoreo

Se creó reporte_sistema.sh dentro de /proyecto/scripts/ para obtener:

* Fecha y hora (date)
* Hostname del servidor (hostname)
* Usuarios conectados (who | wc -l)
* Espacio en disco (df -h /)
* Memoria RAM libre (free -h)
* Contenedores Docker activos (docker ps -q | wc -l)

Se otorgaron permisos de ejecución:

* chmod +x reporte_sistema.sh

2.2 Automatización con Cron

Se programó la ejecución automática cada 30 minutos:

*/30 * * * * /proyecto/scripts/reporte_sistema.sh >> /var/log/proyecto/reporte_sistema.log

Verificaciones realizadas:
* Log creado y actualizándose.
* Funcionamiento de cron mediante systemctl status cron.

=== 3. Control de Versiones (Git + GitHub) ===

Acciones realizadas en /proyecto/:
* Inicialización del repositorio:

git init

* Agregar todos los archivos:

git add .

* Primer commit:

git commit -m "Primer commit: estructura inicial del proyecto"

* Creación de repositorio remoto en GitHub.
* Vinculación:

git remote add origin <URL>

* Primer push:

git push -u origin main

* Creación del README.md con descripción general del proyecto.

Repositorio del proyecto:
https://github.com/MC16105/proyecto-linux-grupo4.git

=== 4. Docker ===
4.1 Instalación y configuración

Pasos realizados:
nstalación de Docker Engine:

* sudo apt install docker.io

Habilitación del servicio:

* sudo systemctl enable docker
* sudo systemctl start docker

Usuarios añadidos al grupo docker:

* sudo usermod -aG docker adminsys
* sudo usermod -aG docker tecnico

Verificación:

* docker --version
* systemctl status docker

4.2 Verificación Inicial
Prueba de funcionamiento:
* docker run hello-world

Listado de contenedores:

* docker ps -a

=== 5. Servidor Web Containerizado (Nginx) ===
5.1 Creación del contenedor
Creación del archivo index.html en /proyecto/web/.
Ejecución del contenedor Nginx:

docker run -d \
  -p 8080:80 \
  -v /proyecto/web/:/usr/share/nginx/html/ \
  --name web_grupo4 \
  nginx

5.2 Verificación del servicio
Acceso desde navegador:
http://localhost:8080

Revisión de logs:
docker logs web_grupo4

=== Resumen General del Proyecto ===
Fase	Objetivo	Resultado
Preparación del Entorno	Configurar usuarios, permisos, estructura	Servidor base organizado y funcional
Automatización y Monitoreo	Crear reportes automáticos del sistema	Script operativo y cron ejecutando cada 30 min
Control de Versiones	Administrar cambios con Git y GitHub	Repositorio completo y documentado
Docker	Instalar y habilitar contenedores	Docker funcional y probado
Servidor Web	Desplegar Nginx en contenedor	Página accesible en localhost:8080
