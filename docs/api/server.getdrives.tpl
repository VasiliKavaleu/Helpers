<doc:page:ru toc="Aipix/Media server/Web API/Server/GetDrives" title="Server.GetDrives">
    <page:p>Получает информацию о подключенных дисках и местах хранения DVR описанных в файле конфигруации сервера {@see:Aipix/Media server/Конфигурирование/Cервер (server.yaml)}</page:p>
    <api:method>
        <method:request type="GET" route="/api/server/drives/"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:return code="200" type="json" desc="Возвращает JSON объект с информацией о подключенных дисках">
        {
            "/": {
                "free": 44747489280,
                "capacity": 52572946432,
                "type": "ext4",
                "mount": "/"
            },
            "/storage": {
                "free": 421604503552,
                "capacity": 421680029696,
                "type": "ext4",
                "mount": "/storage"
            }
        }
        <method:returnparam code="200" name = "free" type="bytes" desc="Количество свободного места на диске"/>
        <method:returnparam code="200" name = "capacity" type="bytes" desc="Общий объем дискового пространства"/>
        <method:returnparam code="200" name = "type" type="string" desc="Тип файловой системы"/>
        <method:returnparam code="200" name = "mount" type="string" desc="Точка монтирования диска или корневая директория хранения DVR"/>
        </method:return>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>