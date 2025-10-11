docker run -d \
-e SPLUNK_START_ARGS=--accept-license \
-e SPLUNK_GENERAL_TERMS=--accept-sgt-current-at-splunk-com \
-e SPLUNK_PASSWORD=changeme \
-e SPLUNK_LICENSE_URI=http://apache.home.freelancefool.com/Splunk.License \
-p 8000:8000 \
-p 8088:8088 \
-p 8089:8089 \
-p 9997:9997 \
--volume /mnt/splunk/etc:/opt/splunk/etc \
--volume /mnt/splunk/var:/opt/splunk/var \
-h splunk.home.freelancefool.com \
--name splunk \
splunk/splunk:10.0.1-rhel9