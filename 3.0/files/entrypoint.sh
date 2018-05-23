#!/bin/bash

# Install XpressEngine if it is not installed
if [ ! -f /var/www/html/installer ]; then

    jinja2 /var/www/html/.xe_install_config.j2 \
     -D site_url=$XE_INSTALL_SITE_URL \
     -D site_timezone=$XE_INSTALL_SITE_TIMEZONE \
     -D site_locale=$XE_INSTALL_SITE_LOCALE \
     -D admin_email=$XE_INSTALL_ADMIN_EMAIL \
     -D admin_password=$XE_INSTALL_ADMIN_PASSWORD \
     -D admin_display_name=$XE_INSTALL_ADMIN_DISPLAY_NAME \
     -D database_driver=$XE_INSTALL_DATABASE_DRIVER \
     -D database_host=$XE_INSTALL_DATABASE_HOST \
     -D database_port=$XE_INSTALL_DATABASE_PORT \
     -D database_dbname=$XE_INSTALL_DATABASE_DBNAME \
     -D database_username=$XE_INSTALL_DATABASE_USERNAME \
     -D database_password=$XE_INSTALL_DATABASE_PASSWORD \
     -D database_prefix=$XE_INSTALL_DATABASE_PREFIX \
     > /var/www/html/.xe_install_config.yaml

    sudo -u www-data php -r "copy('http://start.xpressengine.io/download/installer', 'installer');" && sudo -u www-data php installer install --config=/var/www/html/.xe_install_config.yaml --no-interact
fi

# Execute the CMD
exec "$@"
