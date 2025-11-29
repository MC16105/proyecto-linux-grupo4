# Usamos la imagen oficial de Nginx como base
FROM nginx:alpine

# Copiamos los archivos de la carpeta 'web' al directorio donde Nginx sirve contenido
COPY web/ /usr/share/nginx/html/

# Exponemos el puerto 80
EXPOSE 80

# Comando por defecto para iniciar Nginx
CMD ["nginx", "-g", "daemon off;"]
