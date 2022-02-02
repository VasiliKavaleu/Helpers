<doc:page:ru toc="Aipix/Media server/Web API/Cluster/GetCluster" title="Cluster.GetCluster">
    <page:p>Получение информации о кластере и его состоянии {@see:Aipix/Media server/Кластер/Обеспечение отказоустойчивости}</page:p>
    <api:method>
        <method:request type="GET" route="/api/cluster/"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:return code="200" type="json" desc="Возвращает JSON объект с информацией о кластере">
        { "siblings": 0, "node": 0, "cluster": 0, "enable": false }
        <method:returnparam code="200" name = "enable" type="bool" desc="Разрешена или запрещена функция кластера"/>
        <method:returnparam code="200" name = "cluster" type="int" desc="Идентификатор кластера."/>
        <method:returnparam code="200" name = "node" type="int" desc="Идентификатор текущей ноды"/>
        <method:returnparam code="200" name = "siblings" type="int" desc="Количество связанных нод с текущей нодой"/>
        </method:return>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>