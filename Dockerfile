FROM nginx:alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY site/ /usr/share/nginx/html/
EXPOSE 8080
CMD ["nginx", "-g", "daemon off;"]
