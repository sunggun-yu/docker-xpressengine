#!/usr/bin/env bash

docker build -t sunggun/xpressengine:1.9.6 -t sunggun/xpressengine:1.9 -t sunggun/xpressengine:1 ./1.9

docker build -t sunggun/xpressengine:3.0.0-php7 -t sunggun/xpressengine:3.0.0 -t sunggun/xpressengine:3 -t sunggun/xpressengine:latest 3.0
