# Applications

As an end user, you may test the following applications.

1. Create a single nginx pod application.

```
oc create -f applications/nginx.yaml
```

The end user may run the following command to find the pods.

```
oc get pod
```

2. Create a nginx pod application with EVS volume.

```
oc create -f applications/nginxwithvolume.yaml
```

The end user may run the following command to find the pods and volumes.

```
oc get pod
oc get pvc
```

3. Create two nginx pods application with load balancer service.
```
oc adm policy add-scc-to-group anyuid system:authenticated
oc create -f applications/nginxwithloadbalancer.yaml
```

The end user may run the following command to find the pods and services.

```
oc get pod
oc get svc
```
