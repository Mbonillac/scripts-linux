# Scripts en Linux

<br>
Repositorio para trabajos de Scripts en Linux, sobre Debian Buster.
<br>
<br>

## *Índice*:

1. [Scripts](https://github.com/Mbonillac/scripts-linux/tree/main/Scripts)
2. [Material](https://github.com/Mbonillac/scripts-linux/tree/main/Material)
3. [Resúmenes](https://github.com/Mbonillac/scripts-linux/tree/main/Resumenes)
4. Videos y Tutoriales
       
<br>

---

## 1 - Scripts -

En [este directorio](https://github.com/Mbonillac/scripts-linux/tree/main/Scripts) podrás encontrar todos los scripts aprendidos y practicados en clase.

<br>
<br>

## 2 - Material -

En [este directorio](https://github.com/Mbonillac/scripts-linux/tree/main/Material) podrás encontrar material para el aprendizaje de comandos en linux y de algunas de sus herramientas.

    * Comandos para Linux. 
    * Comandos editores de texto Linux.
        - Vi/Vim
        - Nano

<br>

## 3 - Resúmenes -

 En [este directorio](https://github.com/Mbonillac/scripts-linux/tree/main/Resumenes) podrás encontrar resumenes enfocados a los sistemas operativos.

1. ª Parte
    - [Devops.](https://github.com/Mbonillac/scripts-linux/blob/main/Resumenes/DEVOPS.pdf)
    - [Introducción a la Virtualización.](https://github.com/Mbonillac/scripts-linux/blob/main/Resumenes/Introducci%C3%B3n%20a%20la%20Virtualizaci%C3%B3n.pdf)
    - [Introducción a los Sistemas Operativos.](https://github.com/Mbonillac/scripts-linux/blob/main/Resumenes/Introducci%C3%B3n%20a%20los%20Sistemas%20Operativos.pdf)
    - [Instalación de Sistemas Operativos](https://github.com/Mbonillac/scripts-linux/blob/main/Resumenes/Instalaci%C3%B3n%20de%20Sistemas%20Operativos.pdf)
   
    
    

2. ª ~~Parte~~
3. ª ~~Parte~~



        

 <br>
 

## 4 - Videos y Tutoriales -

Aquí podrás encontrar información y material para el aprendizaje de linux.

<br>

### [Configuración IP estática - Sin Network-Manager - Linux Debian](https://youtu.be/rSYQQUSg2z0)

[![Linux Básico](https://sinergiaformacion.es/wp-content/uploads/2014/10/linux-basico1.jpg)](https://youtu.be/rSYQQUSg2z0)

<br>

<br>

### [Configuración Herramienta Git - Desde Terminal - Linux Debian](https://github.com/Mbonillac/scripts-linux/tree/main/Conf_Herramientas_Git)

1. Crearemos un repositorio en GitHub.
<br>

2. Instalamos la herramienta git como root:
<br>
(#) apt install git
<br>

<br>

3. Configuración de GitHub mediante la herramienta git:
<br>
- Configuramos nuestro nombre de usuario:
<br>
$ git config --global user.name "Nombre_usuario_en_github"
<br>
![usuario](https://github.com/Mbonillac/scripts-linux/blob/main/Conf_Herramienta_Git/1-configurar_usuario-.png])
<br>
- Configuramos el email con el cual estamos registrados en github:
<br>
$ git config --global user.email "email@email.com"
<br>
![email](https://github.com/Mbonillac/scripts-linux/blob/main/Conf_Herramienta_Git/2-configurar_email-.png)
<br>
- Podemos comprobar nuestra configuración:
<br>
$ git config -l
<br>
- También podemos consultar el archivo donde se guarda la configuración del repositorio:
<br>
$ cat .git/config (deberemos de estar dentro de la carpeta del repositorio)
<br>

4. Copiamos desde la web de GitHub la dirección de nuestro repositorio.
<br>

5. Clonamos dicho repositorio:
<br>
$ git  clone https://github.com/Mbonillac/Prueba.git
<br>

6. Preparamos en la carpeta del repositorio los archivos para subirlos a GitHub.
<br>

7. Subimos los archivos:
<br>
$ git add . (con el punto estamos indicando que seleccione todos los archivos)
<br>

8. Hacemos el comit y lo comentamos:
<br>
$ git commit -m "Subida de archivos"
<br>

9. Subimos los archivos:
<br>
$ git push
<br>

10. Ya que tenemos creado el repositorio y configurada nuestra herramienta git, podemos trabajar en otros equipos y hacer un pull para tener siempre actualizado el repositorio de nuestro propio equipo, para ello:
<br>
$ git pull




<br>



☁![sbate](https://lh3.googleusercontent.com/proxy/HDmlpB-27x04831Ut4IZppeMJiKtYuO85eWWwyXBfIgBE5KhyBIK9aX5Pduyamt46W-GReSQUIss1GExt8bfGaN2BdRVta9MigH199owTcKlriYUN0Ah4f-R9HQu)☁ 