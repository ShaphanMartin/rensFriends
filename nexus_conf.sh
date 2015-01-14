#!/usr/bin/env bash
sed -.bak s/"8081"/"8088"/g /vagrant/puppet/modules/nexus/files/nexus-2.11.1-01/conf/nexus.properties
. /vagrant/puppet/modules/nexus/files/nexus-2.11.1-01/bin/nexus restart