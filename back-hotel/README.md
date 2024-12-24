# Detalles de los proyectos

- Laravel 8.83.27
- PHP >= 7.4.33
- Postgresql 12

# Proyectos

Para realizar la verificación de la prueba tenica se deben seguir los siguientes pasos:

- Clonar el proyecto, ya sea con el comando git clone `git clone https://github.com/shelvinbb903/prueba-itbf.git` o bien puede usar la herramiento visual de GitHub que le permita clonar el proyecto en su equipo.

## Instrucciones de Ejecución proyecto backend

Para realizar la verificación de los puntos de la prueba tenica se deben seguir los siguientes pasos:

- Despues de clonar el proyecto acceder a la carpeta del proyecto `back-hotel` con el comando `cd` desde una terminal de comandos y ejecutar el comando ```composer update``` para instalar las dependencias necesarias para el proyecto.

- Cambiar la conexion a la base de datos en Postgresql en el archivo .env del proyecto. En este archivo se modifican las variables DB_HOST, DB_PORT, DB_DATABASE (`db_hotelesdbventa` fue el nombre asignado en la prueba), DB_USERNAME, DB_PASSWORD. Para la prueba tecnica se ha usado la herramiento pgAdmin y se administro la la base de datos con la herramiento DBeaver.

- Generar la base de datos en la herramienta a usar.  Dentro del proyecto se agregó el archivo sql **dump-hotelesdb-202412240355.sql** con la estructura y datos iniciales para verificar la prueba tecnica.

- Existe otra manera de generar la estructura de la base de datos. Se trata de las migraciones de Laravel. Primero se crea la base de datos db_venta en el administrador de su preferencia (por ejemplo pgAdmin) y despues se ejecuta el siguiente comando en la consola ```php artisan migrate```. Se debe tener en cuenta que para ejecutar dicho comando, la consola debe estar apuntando a la carpeta del proyecto, de lo contrario va a generar un error.

- Por último ejecutar el comando ```php artisan serve``` para en funcionamiento el proyecto de backend con las api rest a usar. Por defecto, la url del proyecto es `http://127.0.0.1:8000`. Si se cambia el puerto de ejecución, se debe cambiar también en el proyecto frontend en el archivo de configuracion de proxy.

## Notas Adicionales

- Se debe verificar que las extensiones de postgresql esten activas en el archivo php.ini, de lo contrario va a generar un error al tratar de ejecutar las api rest. Las extensiones son las siguientes ```pdo_pgsql``` ```pgsql```

- Se agrego un archivo `Example.env.txt` como ejemplo para generar el archivo `.env` en el proyecto, ya que este archivo no se guarda por segurida en el repositorio.

- Se genero una imagen con el diagrama Entidad-Relación de la base de datos. El archivo se llama `Entidad-Relación.png`