# **Personalización y Optimización de Debian 12**
Este script de Bash está diseñado para realizar una serie de personalizaciones y optimizaciones en un sistema Debian 12. El script mejora el rendimiento del sistema eliminando paquetes innecesarios y aplica una personalizacion que hace que el sistema sea mas bonito a la simple vista y mas facil de usarlo.

## **A continuacion se explicara el funcionamiento del Script**
### 1. Actualización del Sistema
- El script actualizara tu sistema con las últimas versiones de software y parches de seguridad. 

### 2. Eliminación de Paquetes innecesarios
- Remueve automáticamente una serie de paquetes preinstalados que pueden no ser útiles para todos los usuarios, liberando espacio en disco y reduciendo el uso de recursos del sistema. Esto es especialmente útil en configuraciones de hardware con recursos limitados.

### 3. Limpieza de paquetes residuales del Sistema
- Realiza una limpieza completa de paquetes residuales que hayan podido dejar los paquetes anteriormente eliminados, asegurando que el sistema este lo mas limpio posible permitiendo un entorno de trabajo limpio y optimizado.

### 4. Instalación de Software util
- Se instalaran aplicaciones útiles como **Google Chrome**, **neofetch**, y **bpytop**, estas dos ultimas para proporcionar herramientas adicionales para la personalización y el monitoreo.

### 5. Configuraciones Estéticas del Sistema
- El script aplica una serie de configuraciones estéticas ya pre-establecidas para mejorar la apariencia y experiencia del sistema. Esto incluye la instalación de nuevas fuentes, fondos de pantalla, y temas de Plymouth para el arranque del sistema.

### 6. Reinicio automatico
- El script reiniciara el sistema para aplicar los cambios realizados.

## **Posibilidad de Personalización del Script**
Este script puede ser modificado por el usuario para adaptarlo a sus necesidades, por ejemplo:

- **Agregar** o **Eliminar** paquetes:
    - Puedes modificar las listas de paquetes para instalar o desinstalar según tus preferencias.

- **Modificar** configuraciones estéticas:
    - Ajusta las configuraciones estéticas, como **fondos de pantalla** y **temas**, para que coincidan con tu estilo personal.

- **Ajustar** aspectos del Sistema:
    - Incorpora scripts adicionales o comandos personalizados para realizar tareas específicas que necesites en tu entorno de trabajo.

## **Como ejecutar el Script**
1. Clona el repositorio con `git clone` o descárgalo a través de `wget`.
    ```sh
    git clone https://github.com/itzspike14/Debian12.git
    wget https://github.com/itzspike14/Debian12/archive/refs/heads/main.zip
    ```
2. Tendras que tener **privilegios de superusuario** para poder ejecutar el script
3. Utiliza el siguiente comando para ejecutar el script:
    ```sh
    sudo ./setup.sh
    ```
