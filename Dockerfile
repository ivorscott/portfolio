FROM nginx:1.15-alpine

EXPOSE 80

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY . /usr/share/nginx/html