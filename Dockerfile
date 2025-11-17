# Imagen base de Node (Debian, para evitar problemas con dependencias nativas como better-sqlite3)
FROM node:20

# Directorio de trabajo dentro del contenedor
WORKDIR /usr/src/app

# Copiamos solo package.json y package-lock.json (si existe) para instalar dependencias
COPY package*.json ./

# Instalamos dependencias (modo producción)
ENV NODE_ENV=production
RUN npm install

# Copiamos el resto del código de la app
COPY . .

# Exponemos el puerto en el que corre tu API
EXPOSE 3000

# Comando por defecto para arrancar la app
CMD ["npm", "start"]
