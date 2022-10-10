FROM nginx:alpine
COPY example.conf /etc/nginx/conf.d
COPY index.html /usr/share/nginx/html
EXPOSE 80
CMD ["nginx"]
