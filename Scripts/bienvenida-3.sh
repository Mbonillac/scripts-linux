#!/bin/bash
# Autor: Manuel Bonilla
# Version 1.0 (2020)
# Descripción: Este script limpia la consola, muestra la fecha de hoy, el calendario y pregunta el nombre de la persona que ejecuta el script y le da la bienvenida
clear
date
cal
read -p "¿Cómo te llamas?" nombre
echo "Bienvenid@, $nombre" 
