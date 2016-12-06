#!/usr/bin/env bash

docker build -t sunggun/xpressengine:1.8.27 -t sunggun/xpressengine:1.8 -t sunggun/xpressengine:1 ./1.8

docker build -t sunggun/xpressengine:3.0.0-php5 ./3.0/php5

docker build -t sunggun/xpressengine:3.0.0-php7 -t sunggun/xpressengine:3.0.0 -t sunggun/xpressengine:3 -t sunggun/xpressengine:latest 3.0/php7
