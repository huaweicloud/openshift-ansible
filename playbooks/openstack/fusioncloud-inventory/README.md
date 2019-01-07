# FusionCloud specific prerequisites

For deployment openshift cluster on FusionCloud, you need to configure and ensure flowing options
in the `group_vars/all.yml` file:

- Configure the `openshift_openstack_default_image_name` option to be an existed CentOS 7.3+ image
  in FusionCloud environment, and the config the `openshift_openstack_user` to be the default user
  of the image, the image need also to support keypair injection when creating servers. You can
  download the [official CentOS image](https://cloud.centos.org/centos/7/images/) and upload to
  the FusionCloud environment.

- Configure the `openshift_openstack_default_flavor` to match the CentOS image's required size,
  when upload the image, it is recommended you don't specify a very large `min disk` size.

- Configure the `openshift_openstack_external_network_name` to be a external network, which
  will be used to create floating IPs associated with the openshift cluster servers. Through
  the floating ip, the openshift cluster servers should have the access to external network
  and also allow to be SSH access.

- Configure the `openshift_openstack_bootable_volume_size` to be larger than the `min-disk` size of
  the CentOS image.

Additionally:

- You need also to ensure the endpoints URLs of FusionCloud can be access from the openshift cluster
  servers, maybe need to manually set the domain names and IP mapping in `/etc/hosts`, otherwise, the
  openshift service may be fail to start.

- IF the FusionCloud environment is deployed with `Type I`, it doesn't allow specifying
  `external_gateway_info` with the external network(configured by above `openshift_openstack_external_network_name` option)
  or only support specifying the `Location` type network, e.g. `dummy_external_network`. If so, you also need to change
  the `external_gateway_info` in `roles/openshift_openstack/templates/heat_stack.yaml.j2` manually.
