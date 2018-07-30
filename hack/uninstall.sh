#!/bin/bash

# This script deletes openshift clusters including vms, networks and so on.
basepath=$(dirname "${BASH_SOURCE}")/..
. "${basepath}/hack/configure-files.sh"
openstack stack delete --wait --yes openshift.example.com
