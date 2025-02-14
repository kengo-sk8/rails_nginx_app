FROM nginx:latest

RUN apt-get update && apt-get install -y curl
RUN rm /etc/nginx/conf.d/default.conf

COPY conf/web1.conf /etc/nginx/conf.d/web1.conf
COPY error_page /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
