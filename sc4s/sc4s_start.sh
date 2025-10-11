#!/usr/bin/env zsh

docker run -it \
-p 514:514/tcp \
-p 514:514/udp \
--volume ./env_file:/opt/sc4s/env_file \
--volume /mnt/sc4s/local:/opt/sc4s/local \
--volume /mnt/sc4s/archive:/opt/sc4s/archive \
--volume /mnt/sc4s/tls:/opt/sc4s/tls \
-h sc4s.home.freelancefool.com \
--name sc4s \
ghcr.io/splunk/splunk-connect-for-syslog/container3:v3.38.0