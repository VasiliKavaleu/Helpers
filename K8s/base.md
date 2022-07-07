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

**ConfigMap** - это основной ресурс для хранения в Кубенетес конфигурационных данных. Его отличие от секрета в том, что в Секретах данные кодируются в base64.

**EmptyDir** предназначен для хранения небольших данных, он создается пустым на сервере, где лежит Под в оперативной памяти или на диске. EmptyDir будет существовать, пока будет жив его Под. Используйте его, когда Вам нужно выделить немного дополнительного места контейнеру, и Вы не против потерять эти данные. Например, EmptyDir можно использовать для кэширования загруженных файлов.

##### Пробы
livenessProbe - проба позволяет Кубернетусу делать Health-check'и и при непрохождении определенного в описании Пробы количества проверок Kubernetes перезагрузит контейнер в Поде.

readinessProbe - перенаправление запросов на другие Поды если текущий долго обрабатывает запрос

startupProbe - если она настроена, liveness и readiness Пробы не будут отрабатывать, пока не завершится работа Стартап Пробы.
