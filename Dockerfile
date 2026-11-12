FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

# Cria diretórios persistentes para dados e imagens
RUN mkdir -p /app/data /app/images

# Declara volumes gerenciados pelo Docker para que nunca sejam descartados ao reiniciar
VOLUME ["/app/data", "/app/images"]

EXPOSE 80
ENV PORT=80
ENV DATA_DIR=/app/data
ENV IMAGES_DIR=/app/images

CMD ["node", "server.cjs"]
