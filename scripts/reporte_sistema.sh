#!/bin/bash
# Script: reporte_sistema.sh
# Descripción: Genera un reporte del estado actual del sistema

echo "============================="
echo "     REPORTE DEL SISTEMA     "
echo "============================="
echo "Fecha y hora actual: $(date)"
echo "Nombre del host: $(hostname)"
echo "Usuarios conectados: $(who | wc -l)"
echo "Espacio libre en disco (/): $(df -h / | awk 'NR==2{print $4}')"
echo "Memoria RAM disponible: $(free -h | awk '/Mem:/ {print $7}')"
echo "Contenedores Docker activos: $(docker ps -q | wc -l)"
echo "============================="
echo ""
