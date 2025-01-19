# Nginx

## Start your Network before starting your containers: app-network

This should already be running if you started the Mysql container.

```bash
docker network create app-network
```

## Start your Nginx container

-   Make sure your .env file is in place with a unique password
-   Now run the following command in terminal

## Start your nginx container (Needed for your remote server)

**Make sure you have no .conf files located in the conf.d directory if your websites are not already running. If you have a .conf file and your website is not running, nginx will keep restarting.**

```bash
cd nginx
docker compose up -d
```

## Check the health status of your containers

```bash
# View all containers with their status:
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.State}}"

# View all container details including health
docker inspect $(docker ps -q) | grep -A 10 "Status\|Health"
```
