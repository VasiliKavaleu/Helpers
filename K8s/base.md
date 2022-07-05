1. Pod - объект в котором работают один или больше Containers
2. Deployment - Сэт одинаковых Pods, нужен для Auto Scaling и для обновления Container Image, держит минимальное количество работающих Pods
3. Service - предоставляет доступ к Deployment через
  - ClusterIP
  - NodePort
  - LoadBalancer
  - ExternalName
5. Nodes - Сервера где все это работает
6. Cluster - логическое объединение Nodes
