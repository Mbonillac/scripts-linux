# Configuración Herramienta Git - Desde Terminal - Linux Debian

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
<br>

![usuario](https://github.com/Mbonillac/scripts-linux/blob/main/Conf_Herramienta_Git/1-configurar_usuario-.png?raw=true)
<br>
<br>
- Configuramos el email con el cual estamos registrados en github:
<br>
$ git config --global user.email "email@email.com"
<br>
<br>

![email](https://github.com/Mbonillac/scripts-linux/blob/main/Conf_Herramienta_Git/2-configurar_email-.png?raw=true)
<br>
<br>
- Podemos comprobar nuestra configuración:
<br>
$ git config -l
<br>
<br>

![config_git](https://github.com/Mbonillac/scripts-linux/blob/main/Conf_Herramienta_Git/archivo_config_git.png?raw=true)
<br>
<br>
- También podemos consultar el archivo donde se guarda la configuración del repositorio:
<br>
$ cat .git/config (deberemos de estar dentro de la carpeta del repositorio)
<br>
<br>

![config_repositorio](https://github.com/Mbonillac/scripts-linux/blob/main/Conf_Herramienta_Git/archivo_config_repositorio.png?raw=true)
<br>
<br>

4. Copiamos desde la web de GitHub la dirección de nuestro repositorio.
<br>

5. Clonamos dicho repositorio:
<br>
$ git  clone https://github.com/Mbonillac/Prueba.git
<br>
<br>

![clonado](https://github.com/Mbonillac/scripts-linux/blob/main/Conf_Herramienta_Git/3-clonado_repositorio-.png?raw=true)
<br>

6. Preparamos la carpeta.
<br>

![carpeta](https://github.com/Mbonillac/scripts-linux/blob/main/Conf_Herramienta_Git/4-carpeta_archivo-.png?raw=true)

7. Preparamos los archivos que vamos a subir:
<br>
$ git add . (con el punto estamos indicando que seleccione todos los archivos)
<br>
<br>

![preparado_archivos](https://github.com/Mbonillac/scripts-linux/blob/main/Conf_Herramienta_Git/6-Preparado_archivos-.png?raw=true)
<br>

8. Hacemos el comit y lo comentamos:
<br>
$ git commit -m "Subida de archivos"
<br>
<br>

![comit](https://github.com/Mbonillac/scripts-linux/blob/main/Conf_Herramienta_Git/7-commit-.png?raw=true)
<br>

9. Subimos los archivos:
<br>
$ git push
<br>
<br>

![push](https://github.com/Mbonillac/scripts-linux/blob/main/Conf_Herramienta_Git/8-push-.png?raw=true)
<br>

10. Ya que tenemos creado el repositorio y configurada nuestra herramienta git, podemos trabajar en otros equipos y hacer un pull para tener siempre actualizado el repositorio de nuestro propio equipo, para ello:
<br>
$ git pull
<br>
<br>

![pull](https://github.com/Mbonillac/scripts-linux/blob/main/Conf_Herramienta_Git/9-pull-.png?raw=true)
