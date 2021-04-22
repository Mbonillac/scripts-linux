#!/bin/bash
#Autor: Manuel Bonilla
#Versión: 1.0
#Descripción: Script diseñado para facilitar las tareas de adminitración de red en entornos textuales.

#Variable que muestra la puerta de enlace
#P_Enlace=$(ip r | awk '{print $NF"|"$3}' | sort -n > penlace)

#Variables:

FECHA=$(date +%d-%m-%y-%H:%M)

#Funciones:

#La función Usuario_Root comprueba que solo root pueda ejecutar el script.
Usuario_Root ()
{
    if [ "$(whoami)" != "root" ]
        then
            echo "Solo root puede ejecutar este script. Por favor ejecute el script como root"
            exit 1
    fi
}

#La función Informe, prepara el entorno de trabajo creando la estructura de carpetas necesaria y generando los archivos.
#Siempre con la información actualizada.
Informe ()
{   
    Carpeta_Temp=$(ls -a | grep -w ".Archivos_Temporales")
    if [ -z "$Carpeta_Temp" ]
        then
            mkdir .Archivos_Temporales
        else
            rm -r .Archivos_Temporales
            mkdir .Archivos_Temporales
    fi
    
    #Variable que muestra el nombre de las tarjetas de red:
    NombreTarjeta=$(ip link | grep -w "pfifo_fast" | awk '{print $2}'| tr -d : | sort -n > .Archivos_Temporales/nombretarj)

    #Variable que muestra el estado de la tarjeta (UP/DOWN):
    EstadoTarjeta=$(ip link | grep -w "pfifo_fast" | awk '{print $2" | "$9" "}'| tr -d :| sort -n > .Archivos_Temporales/estadotarj)

    #Variable que  muestra la IP/RED actual de cada tarjeta:
    Ip=$(ip a | grep -v "127.*.*.*" | grep -w "inet" | awk '{print $NF" | "$2" "}'| sort -n > .Archivos_Temporales/ipactual)

    #Variable que muestra la red de cada interfaz
    Red=$(ip r | grep -w "kernel" | awk '{print $3" | "$1}'| sort -n > .Archivos_Temporales/red)

    join -t"|" .Archivos_Temporales/estadotarj .Archivos_Temporales/ipactual > .Archivos_Temporales/union1
    join -t"|" -a1 -a2 .Archivos_Temporales/union1 .Archivos_Temporales/red > .Archivos_Temporales/configuracion

}

#La función Display muestra la cabecera con la leyenda de los datos.
Display ()
{
    echo "+--------------------------------------------------+"
    echo "|           CONFIGURACION DE RED                   |"
    echo "+--------------------------------------------------+"
    echo "| Nombre | Estado |    IP Actual   |      Red      |"
    echo ""
    
}

#La función Menu muestra las distintas herramientas disponibles.
Menu ()
{
    echo " "
    echo "  HERRAMIENTAS "
    echo "+-------------------------------------------------+"
    echo "  1.- Actualizar Tabla"
    echo "  2.- Act. / Desact. Tarjeta"
    echo "  3.- Asignar IP"
    echo "  4.- Eliminar IP"
    echo "  5.- Ping a IP"
    echo "  6.- Prueba DNS"
    echo "  7.- Reiniciar Servicio de Red"
    echo "  8.- Escaneo Rango IP´s"
    echo "  9.- Exportar Informe"
    echo "  10.- Salir"
}

#La función Actualizar limpia la pantalla, actualiza los datos de la configuración y mantiene siempre visible el Menu
#con las herramientas.
Actualizar ()
{
    clear
    Informe
    Display
    cat .Archivos_Temporales/configuracion
    Menu
}

#La función ActDesact_Tarjeta permite activar o desactivar la tarjeta seleccionada.
ActDesact_Tarjeta ()
{
    echo "Seleccionar Tarjeta a configurar: " 
    read -p "Tarjeta: " Nombre_Introducido
    read -p "Indicar up o down: " Estado_Introducido
    ifconfig "$Nombre_Introducido" "$Estado_Introducido"
    read -p "Pulsar Intro para continuar" intro
    Actualizar
}

#La función Asignar_Ip asigna la dirección IP indicada a la tarjeta de red seleccionada.
Asignar_Ip ()
{
    
    read -p "Indicar Tarjeta: " Tarjeta_red
    read -p "Ip Nueva: " Nueva_Ip
    read -p "Máscara de red: " Mascara_Red
    ifconfig "$Tarjeta_red" "$Nueva_Ip" netmask "$Mascara_Red"
    Actualizar
}

#La función Eliminar_Ip elimina la dirección IP indicada a la tarjeta de red seleccionada.
Eliminar_Ip ()
{
   
    read -p "Indicar Ip a borrar: " Borrar_Ip
    read -p "Indicar Tarjeta: " Tarjeta_red
    ip a del "$Borrar_Ip" dev "$Tarjeta_red"
    Actualizar
}

#La función Reinicio_Serv reinicia el servicio de red del equipo.
Reinicio_Serv ()
{
    systemctl restart networking.service
}

#La función Prueba_Ping permite hacer una prueba de ping a la direccion web/Ip indicada.
Prueba_Ping ()
{

    read -p "Introducir dirección: " Ping_A_Direccion
    ping -c4 "$Ping_A_Direccion"
    read -p "Pulsar Intro para continuar" intro

}

#La función Prueba_DNS permite realizar una prueba de funcionamiento DNS a la dirección web indicada.
Prueba_DNS ()
{

    read -p "Introducir dirección web: " Prueba_Direccion_DNS
    nslookup "$Prueba_Direccion_DNS"
    read -p "Pulsar Intro para continuar" intro
}

#La función Prueba_Rango permite realizar una prueba ping al rango de IP´s indicado.
Prueba_Rango ()
{   
    
    read -p "Indicar la parte de red - (Ejemplo: 192.168.1.) : " Parte_Red
    read -p "Indicar Inicio de rango: " Inicio_Rango
    read -p "Indicar Final de rango: " Fin_Rango
    for i in $(seq "$Inicio_Rango" 1 "$Fin_Rango")
        do
            ping -c2 "$Parte_Red""$i"
        done
    read -p "Pulsar Intro para continuar" intro
}

#La función Exportar_Informe permite crear un archivo con la configuración actual de las tarjetas de red del equipo.
Exportar_Informe ()
{
    
    read -p "Introducir ruta de guardado del archivo: " Ruta_Guardado
    if [ -z "$Ruta_Guardado" ]
    then
        echo "No se estableció ruta de guardado... El archivo se guardará en la ruta por defecto /home/usuario."
        read -p "Pulsar Intro para continuar" intro
        cp .Archivos_Temporales/configuracion /home/"$USER"/configuracion_"$FECHA"
    else
        cp .Archivos_Temporales/configuracion "$Ruta_Guardado"/configuracion_"$FECHA"
    fi
}


#Bloque Principal:
Usuario_Root
Actualizar
read -p "Introduzca una opción: " opcion
while [ "$opcion" != 10 ]
    do
            case $opcion in 
            1) Actualizar ;;
            2) ActDesact_Tarjeta;;
            3) Asignar_Ip;;
            4) Eliminar_Ip;;
            5) Prueba_Ping;;
            6) Prueba_DNS;;
            7) Reinicio_Serv;;
            8) Prueba_Rango;;
            9) Exportar_Informe;;
            10) exit 1 ;;
            *) echo "Opción Incorrecta"
            esac
        Actualizar
        read -p "Introduzca una opcion: " opcion
    done
rm -r .Archivos_Temporales
echo "Fin del programa"
echo "github.com/Mbonillac/scripts-linux"