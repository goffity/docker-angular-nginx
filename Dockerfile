FROM node:15.5.0-alpine3.12 as compile-image

WORKDIR /app

COPY . .

RUN ls
RUN npm install
RUN npm run ng build

FROM nginx:alpine as final

RUN rm -rf /usr/share/nginx/html/*
COPY --from=compile-image /app/dist /usr/share/nginx/html