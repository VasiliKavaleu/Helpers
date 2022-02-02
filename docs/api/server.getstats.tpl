<doc:page:ru toc="Aipix/Media server/Web API/Server/GetStats" title="Server.GetStats">
    <page:p>Получить информацию о ресурсах потребляемых медиасервером (CPU, RAM, IO, Network, а также время работы сервера). </page:p>
    <api:method>
        <method:request type="GET" route="/api/server/stats/"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:return code="200" type="json" desc="Возвращает JSON объект со статистикой медиасервера">
        {
            "cpu": {
                "total": 0,
                "usage": 0,
                "proc": 0
            },
            "memory": {
                "total": 0,
                "usage": 0,
                "proc": 0
            },
            "io": {
                "write": 0,
                "read": 0
            },
            "net": {
                "out_bitrate": 0,
                "out_total": 0,
                "in_bitrate": 0,
                "in_total": 0,
                "client": 0
            },
            "timeUp": 542202,
            "timeStart": 1639038083
        }
            <method:returnparam code="200" name = "cpu" type="object" desc="Информация о загрузке CPU"/>
            <method:returnparam code="200" name = "memory" type="object" desc="Информация о доступной и потребляемой памяти"/>
            <method:returnparam code="200" name = "io" type="object" desc="Информация скорости записи\чтения"/>
            <method:returnparam code="200" name = "net" type="object" desc="Информация загрузке сети, количестве подключенных клиентов"/>
            <method:returnparam code="200" name = "timeUp" type="seconds" desc="Время в секундах после перезагрузки серервера"/>
            <method:returnparam code="200" name = "timeStart" type="timestamp" desc="Время старта медиасервера"/>
        </method:return>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>