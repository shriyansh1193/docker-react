FROM node:alpine as builder
WORKDIR '/usr/app'
COPY package.json .
RUN npm install -g npm@7.8.0
COPY . .
RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /usr/app/build /usr/share/nginx/html