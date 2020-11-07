# Install and Run MariaDB as a Docker Container

This repo provides a thin Docker wrapper around the latest MariaDB release.

It provides instructions on how to create and run a MariaDB container with shared persisent data and config storage on the host system.  

This container is suitable for devlopment on a local system like a developer's laptop where cluttered installations are not desirable.  Simply remove the container and image to get your system back to a pristine state.

## Usage
Use the repo Dockerfile to build a MariaDB Docker image
```shell
docker build -t <your_tag_prefix>/mariadb .
```

Run a Docker container baseed on the image, run config and data directories as shared volumes on your localhost.
```shell
 docker run -d --name mariadb_dev \
-p 3306:3306 \
-v ~/Docker/mariadb/config:/etc/mysql/conf.d \
-v ~/Docker/mariadb/datadir:/var/lib/mysql \
-e MYSQL_ROOT_PASSWORD=mariadb \
-e MYSQL_DATABASE=testdb \
mariadb
```

Connect to the container shell and execute SQL commands
```bash
docker exec -it mariadb_dev bash
root@79d370eb0a0f:/# mysql -p -e "SHOW DATABASES"
Enter password: 
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| testdb             |
+--------------------+


