#!/usr/bin/env zsh

docker run -d \
-p 80:80 \
--volume ./data:/usr/local/apache2/htdocs/ \
-h apache.home.freelancefool.com \
--name apache \
httpd:2.4.65