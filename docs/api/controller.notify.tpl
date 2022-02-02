<doc:page:ru toc="Aipix/Media server/Web API/Cluster/NotifyController" title="Cluster.NotifyController">
    <page:p>Метод позволяющий отправить сообщение контроллеру {@see:Aipix/Media server/Контроллер/Внешнее управление}</page:p>
    <api:method>
        <method:request type="PUT" route="/api/cluster/notify/"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:body type="json" desc="Объект с информацией уведомления">
            {
                "event": "stats",
                "data": "custom data"
            }
            <method:bodyparam name = "event" type="enum" desc="Тип уведомления">
                <page:list>
                    state - уведомлене об изменении состояния сервера или его компонент
                    stats - уведомление содержит информацию о статистике
                    stream - уведомление содержит информацию о потоке и его состоянии
                    cluster - уведомление содержит информацию о кластере или ноде кластера
                </page:list>
            </method:bodyparam>
            <method:bodyparam name = "data" type="any" desc="Дополнительная информация уведомления"/>
        </method:body>
        <method:return code="201" desc="Сообщение будет отправлено контроллеру"/>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>