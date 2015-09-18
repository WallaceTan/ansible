#!/bin/bash

# configure hosts file for BGP G-Cloud Servers - SIT Environment
cat >> /etc/hosts <<EOL

# BGP G-Cloud Servers - SIT Environment nodes
10.253.169.194  nginx
10.253.169.196  ror
10.253.169.198  appian
10.253.169.197  admin
10.253.169.199  git
10.253.169.199  nfs
10.253.169.195  db
EOL