<doc:page:ru toc="Aipix/Media server/Web API/Streams/GetDvrRanges" title="Streams.GetDvrRanges">
    <page:p>Позволяет получить существующие интервалы записей DVR {@see:Aipix/Media server/DVR/Запись и хранение архива}</page:p>
    <api:method>
        <method:request type="GET" route="/streams/{stream-uid}/ranges/"/>
        <method:param name="stream-uid" type="uid" desc="Уникальный идентификтор потока {@hint:uid}"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:return code="200" type="json" desc="Возвращает JSON массив с интервалами архива">
            [
                {
                    "local": true,
                    "from": 1639648870,
                    "to": 1639650343,
                    "duration": 1473,
                    "size": 7784117
                }
            ]
            <method:returnparam code="200" name = "local" type="bool" desc="Интервал находтся на локальной ноде или на вторичном сервер"/>
            <method:returnparam code="200" name = "from" type="timestamp" desc="Время начала интервала"/>
            <method:returnparam code="200" name = "to" type="timestamp" desc="Время окончания интервала"/>
            <method:returnparam code="200" name = "duration" type="seconds" desc="Длительность интервала в секундах"/>
            <method:returnparam code="200" name = "size" type="bytes" desc="Рзамер занимаемый интервалом на диске"/>
        </method:return>
        <method:return code="404" desc="Поток с таким UID не найден"/>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>