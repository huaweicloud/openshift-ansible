#!/bin/bash

# This script includes the following steps:
# 1. install ansible and prerequisite.
# 2. configures keystonerc file and private-key file.
# 3. provision cloud resources for openshift.
# 4. install openshift cluster.

basepath=$(dirname "${BASH_SOURCE}")/..

. "${basepath}/hack/install-ansible.sh"

. "${basepath}/hack/configure-files.sh"

. "${basepath}/hack/provision-install-openshift.sh"
