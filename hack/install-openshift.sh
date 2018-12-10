#!/bin/bash

# This script installs openshift cluster.

echo $OS_AUTH_URL

strurl=$OS_AUTH_URL
strorange="orange"
strotc="otc"
strtelefonica="telefonica"
strfusioncloud="fusioncloud"

if [[ $strurl =~ $strorange ]]
then
    echo "install openshift cluster on orange cloud"
    ansible-playbook --user cloud \
        -i playbooks/openstack/inventory.py \
        -i playbooks/openstack/orange-inventory \
        --private-key ./openshift.pem \
        playbooks/openstack/openshift-cluster/install.yml
elif [[ $strurl =~ $strotc ]]
then
    echo "install openshift cluster on otc cloud"
    ansible-playbook --user linux \
        -i playbooks/openstack/inventory.py \
        -i playbooks/openstack/otc-inventory \
        --private-key ./openshift.pem \
        playbooks/openstack/openshift-cluster/install.yml
elif [[ $strurl =~ $strtelefonica ]]
then
    echo "install openshift cluster on telefonica cloud"
    ansible-playbook --user linux \
        -i playbooks/openstack/inventory.py \
        -i playbooks/openstack/telefonica-inventory \
        --private-key ./openshift.pem \
        playbooks/openstack/openshift-cluster/install.yml
elif [[ $strurl =~ $strfusioncloud ]]
then
    echo "install openshift cluster on fusioncloud"
    ansible-playbook --user root \
        -i playbooks/openstack/inventory.py \
        -i playbooks/openstack/fusioncloud-inventory \
        --private-key ./openshift.pem \
        playbooks/openstack/openshift-cluster/install.yml
else
    echo "install openshift cluster on huawei cloud"
    ansible-playbook --user root \
        -i playbooks/openstack/inventory.py \
        -i playbooks/openstack/huawei-inventory \
        --private-key ./openshift.pem \
        playbooks/openstack/openshift-cluster/install.yml
fi
