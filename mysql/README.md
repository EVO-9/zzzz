# Mysql

## Start your Network before starting your containers: app-network

```bash
docker network create app-network
```

## Start your mysql container

-   Make sure your .env file is in place with a unique password
-   Now run the following command in terminal

```bash
cd mysql
docker compose up -d
```

To check your mysql container is healthy and working, do the following:

```bash
docker exec -it mysql_db mysqladmin ping -h localhost -p
```

Then enter your mysql root password located in your .env file.

If it's working correctly you should get: **mysqld is alive**

## Add your Directus database

```bash
docker exec -it mysql_db mysql -u root -p
```

Use the root password in your .env file.

Now create your database. Make sure your database name, user and password are all stored correctly in the .env file located in your website container.

```bash
CREATE DATABASE ukprintandpromotions;
CREATE USER 'ukprintandpromotions'@'%' IDENTIFIED BY 'aYJb>y3ppIaYJb>y3ppI';
GRANT ALL PRIVILEGES ON ukprintandpromotions.* TO 'ukprintandpromotions'@'%';
FLUSH PRIVILEGES;
EXIT;
```

## Check the health status of your containers

Check your database has been added.

```bash
docker exec -it mysql_db mysql -u root -p
```

Use the root password in your .env file.

Now use the following to check what datab ase exist.

```bash
SHOW DATABASES;
```

## Check the health status of your containers

```bash
# View all containers with their status:
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.State}}"

# View all container details including health
docker inspect $(docker ps -q) | grep -A 10 "Status\|Health"
```
