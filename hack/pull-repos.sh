#!/bin/bash

# This script pulls openshift-ansible github repository.

echo "install git"
yum install -y git

echo "git clone openshift-ansible"
git clone https://github.com/edisonxiang/openshift-ansible
version="master"
if [ -n "$1" ]; then
    version="$1"
fi

echo "git checkout $version"
cd openshift-ansible
git checkout $version
