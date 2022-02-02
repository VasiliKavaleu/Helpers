<doc:page:ru toc="Aipix/Media server/Web API/Cluster/GetNodes" title="Cluster.GetNodes">
    <page:p>Получение информации о нодах связанных с текущей нодой (вторичных нод) и их состоянии {@see:Aipix/Media server/Кластер/Обеспечение отказоустойчивости}</page:p>
    <api:method>
        <method:request type="GET" route="/api/cluster/nodes/"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:return code="200" type="json" desc="Возвращает JSON массив объектов с информацией о нодах">
        [
            { "node": 1001, "type": "sibling", "hostname": "locahost", "address": "127.0.0.1","state":"up", "time": 1646651508, "retries": 0}
        ]
        <method:returnparam code="200" name = "node" type="int" desc="Идентификатор ткущей ноды"/>
        <method:returnparam code="200" name = "sibling" type="enum" desc="Отношение ноды к текущей ноде">
            <page:list>
            sibling - вторичная нода
            im - эта нода
            </page:list>
        </method:returnparam>
        <method:returnparam code="200" name = "locahost" type="string" desc="Имя хоста ноды"/>
        <method:returnparam code="200" name = "address" type="IP4" desc="IP адрес ноды"/>
        <method:returnparam code="200" name = "state" type="enum" desc="Состояние ноды">
            <page:list pre="enum-nodestate_t"/>
        </method:returnparam>
        <method:returnparam code="200" name = "time" type="timestamp" desc="Время последней проверки сосотяния ноды"/>
        <method:returnparam code="200" name = "retries" type="int" desc="Количество неуспешеых попыток проверить состояние ноды. Сбрасывается при успешном получении состояния"/>
        </method:return>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>