# Applications

As an end user, you may test the following applications.

Create a single nginx pod application.

```
oc create -f applications/nginx.yaml
```

Create a nginx pod application with EVS volume.

```
oc create -f applications/nginxwithvolume.yaml
```

Create two nginx pods application with load balancer service.
```
oc create -f applications/nginxwithloadbalancer.yaml
```
