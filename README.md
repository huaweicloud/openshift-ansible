[![Join the chat at https://gitter.im/openshift/openshift-ansible](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/openshift/openshift-ansible)
[![Build Status](https://travis-ci.org/openshift/openshift-ansible.svg?branch=master)](https://travis-ci.org/openshift/openshift-ansible)
[![Coverage Status](https://coveralls.io/repos/github/openshift/openshift-ansible/badge.svg?branch=master)](https://coveralls.io/github/openshift/openshift-ansible?branch=master)

# OpenShift Ansible

This repository contains [Ansible](https://www.ansible.com/) roles and
playbooks to install, upgrade, and manage
[OpenShift](https://www.openshift.com/) clusters.

This repository is based on [openshift/openshift-ansible](https://github.com/openshift/openshift-ansible) project.
See [more informations](README_OPENSHIFT_ANSIBLE.md).

To setup openshift cluster by ansible on huawei clouds, it has made some changes about openstack roles, playbooks and inventories.

## Usage

In order to setup openshift cluster by ansible, you'll need to finish the following steps:

### Prerequisite
- Host Operation System: CentOS 7.3+
- Host Operation System User: root
- Available EIP Quatas on Cloud: 4+
- Available VPC Quatas on Cloud: 1+
- Available Security Group Quatas on Cloud: 6+

### Installation

1. pull openshift-ansible github repository.

```
curl https://raw.githubusercontent.com/huaweicloud/openshift-ansible/master/hack/pull-repos.sh | bash
```

2. set cloud credentials.
```
cd openshift-ansible

vi keystonerc

  # set your own ENV in the file
  export OS_AUTH_URL=https://iam.cn-north-1.myhwclouds.com
  export OS_USERNAME=user
  export OS_PASSWORD=password
  export OS_IDENTITY_API_VERSION=3
  export OS_DOMAIN_NAME=domain
  export OS_USER_DOMAIN_NAME=domain
  export OS_PROJECT_DOMAIN_NAME=domain
  export OS_TENANT_NAME=tenant
  export OS_REGION_NAME=cn-north-1
  export OS_AVAILABILITY_ZONE=cn-north-1a
```

3. Create a new keypair named **openshift** in cloud web console and put the private key file **openshift.pem** into **openshift-ansible** folder.

4. Install openshift cluster by the following command which can be executed repeatly until success.
```
. hack/install.sh
```

5. If you need to uninsall openshift cluster, you can run the following command.
```
. hack/uninstall.sh
```

## Applications

Here are some application examples for testing openshift on huawei clouds.

- [applications](applications/)

## Contributing

See the [contribution guide](CONTRIBUTING.md).

## License

See the [LICENSE](LICENSE) file for details.
