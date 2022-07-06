Показать версию minicube
```
minikube version
```

Создать и запустить кластер VM с K8s Сдгыеук c с параметрами по умолчанию
```
minikube start
```

```
minikube stop
```

```
minikube delete
```

```
minikube ssh
```

```
minikube start --cpus=4 --memory=8gb --disk-size=5gb
```

```
minikube start -p MYSUPERCLUSTER
```

Показать версию kubectl клиента и сервера
```
kubectl version
```

Показать версию kubectl клиента
```
kubectl version --client
```

Показать состояние K8s кластера
```
kubectl get componentstatuses
```

Показать информацию о K8s кластере
```
kubectl cluster-info
```

Показать все серверы K8s кластера
```
kubectl get nodes
```

Зайти в под
```
kubectl exec -ti $POD_NAME -- bash
```

Получить сервисы (services or svc) кластера
```
kubectl get services
```

Просмотр список Подов в неймспейсе
```
kubectl get pods -n <name-of-namespace>
```

Просмотр описания Пода
```
kubectl describe pod <name-of-pod>
```

**Apply** manages applications through files defining K8s resources

```
kubectl apply -f <file-name.yaml>
```

Listing different resouces with "get"

```
kubectl get pod | configmap | secret | deployments...
```

View logs of pod/container
```
kubectl logs <podName>
```

Удалить Деплоймент можно двумя методами
```
kubectl delete -f deployment.yaml
```
```
kubectl delete deployment -n <name-of-namespace> <pod-name>
```
