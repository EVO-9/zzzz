# Mysql

## Start your Network before starting your containers: app-network

```bash
docker network create app-network
```

Make sure your have your Mysql container setupm, running and your database added.

Make sure your Nginx container is setup and running.

## Start your website

-   Make sure your .env file is in place
-   Edit the .env file with your site name, password and port number (make sure the port numbers are unique and not being used by another site).

```bash
cd your-domain
docker compose up --build
```

## Add your website's .conf files for both the standard and sub domain

These need to be placed in the nginx/conf.d directory.

Check the build, quit then run

```bash
cd your-domain
docker compose up -d
```

## Check the health status of your containers

```bash
# View all containers with their status:
docker ps --format "table {{.Names}}\t{{.Status}}\t{{.State}}"

# View all container details including health
docker inspect $(docker ps -q) | grep -A 10 "Status\|Health"
```

chmod +x scripts/init/init-frontend.sh scripts/init/init-backend.sh
