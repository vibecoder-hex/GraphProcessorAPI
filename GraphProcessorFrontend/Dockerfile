# Сборка статических файлов
FROM node:24-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

#Финальный образ
FROM node:24-alpine
WORKDIR /app
COPY --from=build /app/dist ./dist
