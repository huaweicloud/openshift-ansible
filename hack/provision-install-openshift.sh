#!/bin/bash

# This script provisions cloud resources for openshift and installs openshift cluster.

echo $OS_AUTH_URL

strurl=$OS_AUTH_URL
strorange="orange"
strotc="otc"
strtelefonica="telefonica"

if [[ $strurl =~ $strorange ]]
then
    echo "provision orange cloud resources for openshift and install openshift cluster on orange cloud"
    ansible-playbook --user cloud \
        -i playbooks/openstack/inventory.py \
        -i playbooks/openstack/orange-inventory \
        --private-key ./openshift.pem \
        playbooks/openstack/openshift-cluster/provision_install.yml
elif [[ $strurl =~ $strotc ]]
then
    echo "provision otc cloud resources for openshift and install openshift cluster on otc cloud"
    ansible-playbook --user linux \
        -i playbooks/openstack/inventory.py \
        -i playbooks/openstack/otc-inventory \
        --private-key ./openshift.pem \
        playbooks/openstack/openshift-cluster/provision_install.yml
elif [[ $strurl =~ $strtelefonica ]]
then
    echo "provision telefonica cloud resources for openshift and install openshift cluster on telefonica cloud"
    ansible-playbook --user linux \
        -i playbooks/openstack/inventory.py \
        -i playbooks/openstack/telefonica-inventory \
        --private-key ./openshift.pem \
        playbooks/openstack/openshift-cluster/provision_install.yml
else
    echo "provision huawei cloud resources for openshift and install openshift cluster on huawei cloud"
    ansible-playbook --user root \
        -i playbooks/openstack/inventory.py \
        -i playbooks/openstack/huawei-inventory \
        --private-key ./openshift.pem \
        playbooks/openstack/openshift-cluster/provision_install.yml
fi
