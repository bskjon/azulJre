#!/bin/bash

mkdir -p /usr/sbin/

echo "Building with => " $TARGETARCH

mv /opt/java/java$JRE/archive/* /opt/java/java$JRE/
rm -r /opt/java/java$JRE/archive

if [ -z "$(ls -A -- "/opt/java/java$JRE")" ]; then
    printf "\n\nJava folder is empty!\n\n"
    printf "\nExiting now =>"
    exit 1
fi
chmod +x /opt/java/java$JRE/bin/java

printf "\n\Setting default Java\n"
update-alternatives --install /usr/bin/java java /opt/java/java$JRE/bin/java 100
