FROM node:16-slim AS build
WORKDIR /app
COPY package.json package-lock.json /app/
RUN npm install

FROM node:16-slim
WORKDIR /app
COPY . /app/
COPY --from=build /app/  /app/
RUN apt update && apt install -y openssl
RUN npm run compile