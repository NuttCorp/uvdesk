# UVDesk with php 7.3 and uses external mySQL DB. 
Change the APP_ENV key in /var/www/uvdesk/.env from dev to prod when done testing to remove symfony profiler bar.

## Example run:
```sh
docker run -dit -v uvdesk_data:/var/www:rw -p 85:80 --name UVDesk nuttcorp/uvdesk:latest
```

## Example docker compose:
```yaml
version: '2'

services:
  app:
    depends_on:
      - db
    tty: true
    image: nuttcorp/uvdesk:latest
    ports:
      - "85:80"
    restart: always
    volumes:
      - "app_data:/var/www:rw"
  db:
    command: "--default-authentication-plugin=mysql_native_password"
    environment:
      - MYSQL_ROOT_PASSWORD=ROOTPASSWORD
      - MYSQL_DATABASE=uvdesk_db
      - MYSQL_USER=uvdesk_user
      - MYSQL_PASSWORD=USERPASSWORD
    image: "mysql:5.7"
    restart: always
    volumes:
      - "db_data:/var/lib/mysql"
volumes:
  app_data:
    driver: local
  db_data:
    driver: local
```
