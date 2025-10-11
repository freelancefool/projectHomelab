#!/usr/bin/env zsh

docker run -d \
-p 514:514/tcp \
-p 514:514/udp \
--volume /mnt/sc4s/persistent:/var/lib/syslog-ng \
--volume /mnt/sc4s/local:/etc/syslog-ng/conf.d/local:z \
--volume /mnt/sc4s/archive:/var/lib/syslog-ng/archive:z \
--volume /mnt/sc4s/tls:/etc/syslog-ng/tls:z \
--env-file=./env_file \
-h sc4s.home.freelancefool.com \
--name sc4s \
ghcr.io/splunk/splunk-connect-for-syslog/container3:v3.38.0