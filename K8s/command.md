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

Получить сервисы кластера
```
kubectl get services
```
