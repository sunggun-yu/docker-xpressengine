Dockerfile for XpressEngine
============================

# What is XpressEngine
XpressEngine is one of the famous PHP based open source CMS in Korea.

This Dockerfile installs XpressEngine with PHP and Apache2.

* XpressEngine 1 : https://github.com/xpressengine/xe-core
* XpressEngine 3 : https://github.com/xpressengine/xpressengine

# How to run the XpressEngine Container

## XpressEngine 1.9.x

This Dockerfile installs only Mysql dependencies. so you will need to have pre-installed MySQL server. In this examples, I use MySQL Docker container.

Run MySQL Container:
```bash
docker run -d --name mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=xe \
  -p 3306:3306 \
  mysql:5.6
```

Run XpressEngine Container:
```bash
docker run -d --name xe \
  -p 80:80 \
  --link mysql:mysql \
  sunggun/xpressengine:1.9
```

You can setup rest of installation once you access to the XpressEngine server.

For example, if you access to the `http://192.168.99.100`, you will see web installer screen.

Please refer to the installation guide of XpressEngine.
* XpressEngine 1 : https://www.xpressengine.com/manual/XE-User_Manual-en(v2.0).pdf

## XpressEngine 3.x : currently Beta phase by manufacture

XpressEngine 3.x container requires some environment variable to support php installer with config file.

- `XE_INSTALL_SITE_URL`
- `XE_INSTALL_SITE_TIMEZONE`
- `XE_INSTALL_SITE_LOCALE`
- `XE_INSTALL_ADMIN_EMAIL`
- `XE_INSTALL_ADMIN_PASSWORD`
- `XE_INSTALL_ADMIN_DISPLAY_NAME`
- `XE_INSTALL_DATABASE_DRIVER`
- `XE_INSTALL_DATABASE_HOST`
- `XE_INSTALL_DATABASE_PORT`
- `XE_INSTALL_DATABASE_DBNAME`
- `XE_INSTALL_DATABASE_USERNAME`
- `XE_INSTALL_DATABASE_PASSWORD`
- `XE_INSTALL_DATABASE_PREFIX`

It generates a installer config file from environment variable and start install if XpressEngine is not installed.

Installer config file example with default values: `/var/www/html/.xe_install_config.yaml`
```yaml
site:
    url: 'http://localhost'
    timezone: Asia/Seoul
    locale: ko
admin:
    email: admin@localhost.local
    password: admin
    display_name: admin
database:
    driver: mysql
    host: mysql
    port: 3306
    dbname: xe
    username: root
    password: root
    prefix: xe
```

### Example for launching container

Run MySQL Container:
```bash
docker run -d --name xe-mysql \
  -e MYSQL_ROOT_PASSWORD=root \
  -e MYSQL_DATABASE=xe \
  mysql:5.6
```

Run XpressEngine Container:
```
docker run -d --name xe \
  -p 80:80 \
  --link xe-mysql:mysql \
  -e XE_INSTALL_SITE_URL='http://localhost' \
  -e XE_INSTALL_SITE_TIMEZONE='America/New_York' \
  -e XE_INSTALL_SITE_LOCALE='ko' \
  -e XE_INSTALL_ADMIN_EMAIL='admin@localhost.local' \
  -e XE_INSTALL_ADMIN_PASSWORD='admin' \
  -e XE_INSTALL_ADMIN_DISPLAY_NAME='admin' \
  -e XE_INSTALL_DATABASE_DRIVER='mysql' \
  -e XE_INSTALL_DATABASE_HOST='mysql' \
  -e XE_INSTALL_DATABASE_PORT='3306' \
  -e XE_INSTALL_DATABASE_DBNAME='xe' \
  -e XE_INSTALL_DATABASE_USERNAME='root' \
  -e XE_INSTALL_DATABASE_PASSWORD='root' \
  -e XE_INSTALL_DATABASE_PREFIX='xe' \
  sunggun/xpressengine:3
```

Please refer to the installation guide of XpressEngine.
* XpressEngine 3 : https://xpressengine.gitbooks.io/xpressengine-manual/content/ko/
