# Mi API Express Dockerizada

Este proyecto es una API REST desarrollada con **Node.js** y **Express**.  
El objetivo de la tarea es contenerizar la aplicación utilizando **Docker** para poder ejecutarla de forma consistente en cualquier entorno.

## Requisitos

- Docker instalado (Docker Desktop o similar).
- Opcional: Node.js si se desea ejecutar la app sin Docker.

## Ejecutar la API sin Docker (opcional)

```bash
npm install
npm run dev

La API se expone en:

http://localhost:3000/ → Ruta de prueba
http://localhost:3000/api/users → Endpoints que usan base de datos (pueden fallar si la BD no está disponible)

Dockerfile
El Dockerfile realiza los siguientes pasos:

1. Usa la imagen base oficial node:20.
2. Define el directorio de trabajo /usr/src/app.
3. Copia package.json y package-lock.json e instala las dependencias con npm install.
4. Copia el resto del código fuente.
5. Expone el puerto 3000.
6. Define CMD ["npm", "start"] como comando de inicio.
7. Construir la imagen Docker

Desde la raíz del proyecto:
docker build -t mi-api-express .

Ejecutar el contenedor
docker run -d -p 3000:3000 --name mi-api-express-container mi-api-express

-d: ejecuta en segundo plano.
-p 3000:3000: mapea el puerto 3000 del host al puerto 3000 del contenedor.
--name mi-api-express-container: nombre del contenedor.

Verificar que el contenedor está corriendo
docker ps

Deberías ver el contenedor mi-api-express-container en estado Up y con el puerto 0.0.0.0:3000->3000/tcp.
Probar la API dentro del contenedor

http://localhost:3000/

Respuesta esperada:
{
  "message": "API corriendo correctamente desde Docker"
}
Los endpoints que dependen de base de datos, como:
http://localhost:3000/api/users

intentan conectarse a PostgreSQL. Si la base de datos no está accesible desde el contenedor, devolverán un error de servidor (ECONNREFUSED).
Detener y eliminar el contenedor

docker stop mi-api-express-container
docker rm mi-api-express-container

Despliegue en Play With Docker (PWD)

1. Entrar a https://labs.play-with-docker.com y crear una nueva instancia.
2. Clonar el repositorio:

git clone https://github.com/JulioSoza/mi-api-express-docker.git
cd mi-api-express-docker

3. Construir la imagen: docker build -t mi-api-express .
4. Ejecutar el contenedor:docker run -d -p 3000:3000 --name mi-api-express-container mi-api-express
5. Verificar con docker ps y abrir el puerto 3000 desde la interfaz de PWD para comprobar la respuesta de la ruta /.


Luego en la terminal:

```bash
git add README.md
git commit -m "Agregar README con instrucciones de Docker"
git push


