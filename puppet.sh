#!/usr/bin/env bash
if [ ! -d "/etc/puppet" ];then
	rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-7.noarch.rpm
	yum -y install puppet
fi
