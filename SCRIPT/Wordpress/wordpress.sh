
# Grupo 8



mkdir wordpress
cd wordpress
echo 'version: "3"

services:
  db:
    image: mysql:latest
    # image: mysql:5.7 indicates the MySQL database container image from Docker Hub used in this installation.
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: 1234
      MYSQL_DATABASE: wordpress
      MYSQL_USER: wordpress
      MYSQL_PASSWORD: 1234
      # Previous four lines define the main variables needed for the MySQL container to work: database, database username, database user password, and the MySQL root password.
  wordpress:
    depends_on:
      - db
    image: wordpress:latest
    restart: always
    ports:
      - "8085:80"
      
    environment:
      WORDPRESS_DB_HOST: db:3306
      WORDPRESS_DB_USER: wordpress
      WORDPRESS_DB_PASSWORD: 1234
      WORDPRESS_DB_NAME: wordpress
    volumes:
      ["./:/var/www/html"]
volumes:
  mysql: {}' > docker-compose.yml
sudo docker compose up -d
exit