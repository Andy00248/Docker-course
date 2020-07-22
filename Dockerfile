FROM node:alpine as final

WORKDIR /var/app

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

CMD [ "serve", "-s", "build" ] 

FROM nginx

EXPOSE 80

COPY --from=final /var/app/build /usr/share/nginx/html