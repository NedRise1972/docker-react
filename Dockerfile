# Phase: build
FROM node:16-alpine AS builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# FROM startet eine neue Phase
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
