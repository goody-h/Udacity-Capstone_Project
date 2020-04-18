FROM nginx:stable-alpine

WORKDIR /usr/share/nginx/html/

COPY ./app .

EXPOSE 80