Задача Kubernetes заключается в координации кластера компьютеров, работающего как одно целое.

1. Pod - (сетевая абстракция) объект в котором работают один или больше Containers
2. Deployment - Сэт одинаковых Pods, нужен для Auto Scaling и для обновления Container Image, держит минимальное количество работающих Pods
3. Service - предоставляет доступ к Deployment через
  - ClusterIP
  - NodePort
  - LoadBalancer
  - ExternalName
5. Nodes - Сервера где все это работает
6. Cluster - логическое объединение Nodes

Deployment = a template for creating pods

Each configuration File has 3 parts:
1. metadata 

```yaml
metadata:
  name: nginx-deployment
  labels: ...
```

2. specification

```yaml
spec:
  replicas: 2
  selector: ...
  template: ...
```
Attributes of "**spec**" are **specific** to the kind. 

3. status -> Automatically generated and added by K8s
Where does K8s get this status data?
Etcd holds the current status of any component K8s.

Which IP address? To access via browser.
**NodePort** Service is accessible on each Worker Node's IP address.
INTERNAL-IP from:
```
kubectl get node -o wide
```
