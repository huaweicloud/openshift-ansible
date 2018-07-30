#!/bin/bash

# This script installs ansible and prerequisite

echo "install operation system prerequisite"
yum update -y
yum install -y git
yum install -y yum-utils
yum install -y epel-release
yum install -y gcc
yum install -y python-devel
yum install -y python-pip

echo "install ansible and prerequisite"
pip install ansible
pip install jinja2
pip install shade
pip install jmespath
pip install dnspython
pip install python-openstackclient
pip install python-heatclient
