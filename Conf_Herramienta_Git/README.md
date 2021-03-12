### Configuración Herramienta Git - Desde Terminal - Linux Debian

<br>

1. Crearemos un repositorio en GitHub.
<br>

2. Instalamos la herramienta git como root:
<br>
(#) apt install git

3. Configuración de GitHub mediante la herramienta git:
<br>
- Configuramos nuestro nombre de usuario:
<br>
$ git config --global user.name "Nombre_usuario_en_github"
<br>
- Configuramos el email con el cual estamos registrados en github:
<br>
$ git config --global user.email "email@email.com"
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
