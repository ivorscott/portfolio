FROM nginx:1.25.3

EXPOSE 80

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY . /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]