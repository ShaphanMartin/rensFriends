#This file is untested, the box would not work on my machine. This should setup all the properties for nexus to launch on stat-up

#!/usr/bin/env bash

IPADDRESS=facter ipaddress
sed -i.bak s/"0.0.0.0"/$IPADDRESS/g /vagrant/puppet/modules/nexus/files/nexus-2.11.1-01/conf/nexus.properties
sed -i.bak s/"8081"/"8088"/g /vagrant/puppet/modules/nexus/files/nexus-2.11.1-01/conf/nexus.properties
. /vagrant/puppet/modules/nexus/files/nexus-2.11.1-01/bin/nexus restart
