<doc:page:ru toc="Aipix/Media server/Web API/Server/GetConfig" title="Server.GetConfig">
    <page:p>Получить информацию о параметрах конфигурации медиасервера {@see:Aipix/Media server/Конфигурирование/Cервер (server.yaml)}</page:p>
    <api:method>
        <method:request type="GET" route="/api/server/config/"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:return code="200" type="json" desc="Возвращает JSON объект с параметрами конфигурации медиасервера">
        {
            "controller": {"enable": false},
            "api": { "enable": true },
            "storages": {},
            "cluster": { "nodesCount": 0, "enable": false },
            "cpanel": { "enable": false },
            "broadcast": { "web": true, "rtsp": true, "publish": false },
            "streams": { "count": 2 }
        }
        <method:returnparam code="200" name = "controller.enable" type="bool" desc="Функция контроллера включена или выключена"/>
        <method:returnparam code="200" name = "api.enable" type="bool" desc="Доступно или недоступно Web API"/>
        <method:returnparam code="200" name = "cpanel.enable" type="bool" desc="Доступна или недоступна технологическая панель медиасервера"/>
        <method:returnparam code="200" name = "storages" type="array" desc="Пути к директориям хранения DVR указанные в server.yaml"/>
        <method:returnparam code="200" name = "cluster.enable" type="int" bool="Включена или выключена функция кластера"/>
        <method:returnparam code="200" name = "cluster.nodesCount" type="int" desc="Количество нод в кластере если функция включена"/>
        <method:returnparam code="200" name = "broadcast.web" type="bool" desc="Сервер может воспроизводить потоки по Web протоколам"/>
        <method:returnparam code="200" name = "broadcast.web" type="bool" desc="Сервер может воспроизводить потоки по RTSP протоколу"/>
        <method:returnparam code="200" name = "broadcast.web" type="bool" desc="Сервер может принимать подключения для публикации RTSP потока"/>
        <method:returnparam code="200" name = "streams.count" type="int" desc="Количество загруженных конфигураций потоков"/>
        </method:return>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>