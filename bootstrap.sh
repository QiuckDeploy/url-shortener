#!/bin/bash

if [ -d /config/ ]; then
    cp /var/www/html/static/config.js /config/config.js.bak
    cp /var/www/html/config.inc.php /config/config.inc.php.bak
fi

if [ -f /config/config.js ]; then
    rm /var/www/html/static/config.js
    ln -s /config/config.js /var/www/html/static/config.js
fi

if [ -f /config/config.inc.php ]; then
    rm /var/www/html/config.inc.php
    ln -s /config/config.inc.php /var/www/html/config.inc.php
fi

apache2-foreground