#!/bin/bash

mkdir -p /usr/sbin/

echo "Building with => " $TARGETARCH


mkdir -p /opt/java/java17/
if [[ $TARGETARCH == "arm"* ]] 
then 
    cp -vrf dep/arm/java/* /opt/java/java17/
else
    cp -vrf dep/amd/java/* /opt/java/java17/
fi


if [ -z "$(ls -A -- "/opt/java/java17")" ]; then
    printf "\n\nJava folder is empty!\n\n"
    printf "\nExiting now =>"
    exit 1
fi
chmod +x /opt/java/java17/bin/java

printf "\n\Setting default Java\n"
update-alternatives --install /usr/bin/java java /opt/java/java17/bin/java 100