#!/bin/bash

# This script provisions cloud resources for openshift.

echo $OS_AUTH_URL

strurl=$OS_AUTH_URL
strorange="orange"
strotc="otc"
strtelefonica="telefonica"

if [[ $strurl =~ $strorange ]]
then
    echo "provision orange cloud resources for openshift"
    ansible-playbook --user cloud \
        -i playbooks/openstack/inventory.py \
        -i playbooks/openstack/orange-inventory \
        --private-key ./openshift.pem \
        playbooks/openstack/openshift-cluster/provision.yml
elif [[ $strurl =~ $strotc ]]
then
    echo "provision otc cloud resources for openshift"
    ansible-playbook --user linux \
        -i playbooks/openstack/inventory.py \
        -i playbooks/openstack/otc-inventory \
        --private-key ./openshift.pem \
        playbooks/openstack/openshift-cluster/provision.yml
elif [[ $strurl =~ $strtelefonica ]]
then
    echo "provision telefonica cloud resources for openshift"
    ansible-playbook --user linux \
        -i playbooks/openstack/inventory.py \
        -i playbooks/openstack/telefonica-inventory \
        --private-key ./openshift.pem \
        playbooks/openstack/openshift-cluster/provision.yml
else
    echo "provision huawei cloud resources for openshift"
    ansible-playbook --user root \
        -i playbooks/openstack/inventory.py \
        -i playbooks/openstack/huawei-inventory \
        --private-key ./openshift.pem \
        playbooks/openstack/openshift-cluster/provision.yml
fi
