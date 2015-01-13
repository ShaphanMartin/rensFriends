#!/usr/bin/env bash

sudo su jenkins -s/bin/bash
sudo mkdir /var/lib/jenkins/.ssh
sudo ssh-keygen -f /var/lib/jenkins/.ssh/id_rsa -t rsa -N ''

echo "Jenkins service is running on 8080"
