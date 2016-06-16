# Nginx docker

docker run --name nginx -v /Users/fifsky/docker/nginx/conf:/etc/nginx -v /Users/fifsky/wwwroot:/var/www -d -p 80:80 fifsky_nginx

docker exec -it nginx ls /var/www
