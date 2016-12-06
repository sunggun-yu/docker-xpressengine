Dockerfile for XpressEngine
============================

## What is XpressEngine
XpressEngine is one of the famous PHP based open source CMS in Korea.

This Dockerfile installs XpressEngine with PHP and Apache2.

* XpressEngine 1 : https://github.com/xpressengine/xe-core
* XpressEngine 3 : https://github.com/xpressengine/xpressengine

## How to run the XpressEngine Container

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
  sunggun/xpressengine
```

You can setup rest of installation once you access to the XpressEngine server.

For example, if you access to the `http://192.168.99.100`, you will see web installer screen.

Please refer to the installation guide of XpressEngine.
* XpressEngine 1 : https://www.xpressengine.com/manual/XE-User_Manual-en(v2.0).pdf
* XpressEngine 3 : https://xpressengine.gitbooks.io/xpressengine-manual/content/ko/

(Unfortunately, I couldn't find the english installation guide for XpressEngine 3)
