<doc:page:ru toc="Aipix/Media server/Web API/Cameras/GetCamera" title="Cameras.GetCamera">
    <page:p>Получить информацию о виртуальной камере и потоков связанных с ней {@see:'Aipix/Media server/Потоки видеокамер/Виртуальные камеры'}</page:p>
    <api:method>
        <method:request type="GET" route="/cameras/{camera-uid}/"/>
        <method:param name="camera-uid" type="uid" desc="Уникальный идентификтор виртуальной камеры {@hint:uid}"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:return code="200" type="json" desc="Возвращает JSON объект с описание камеры">
            {
                "camera": "192-168-7-36",
                "streams": [
                    {
                        "reconnect_count": 0,
                        "dvr": "true",
                        "state": "pending",
                        "reconnect_total": 0,
                        "enable": "true",
                        "subtitle": "Office, kitchen",
                        "uid": "192-168-7-36-1",
                        "access": "public",
                        "primary": true,
                        "tracks": [
                            "video",
                            "audio",
                            "events",
                            "application"
                        ],
                        "recording": "recording"
                    }
                ],
                "title": "Office, kitchen"
            }
            <method:returnparam code="200" name = "camera" type="uid" desc="Уникальный идентификатор виртуальной камеры"/>
            <method:returnparam code="200" name = "title" type="string" desc="Название камеры"/>
            <method:returnparam code="200" name = "streams" type="array" desc="Массив объектов потоков связанных с камерой"/>
            <method:returnparam code="200" name = "enable" type="bool" desc="Разрешена иди запрещено поток"/>
            <method:returnparam code="200" name = "primary" type="bool" desc="Указывает является ли поток первичным или вторичным  {@see:Aipix/Media server/Кластер/Кластерный захват}"/>
            <method:returnparam code="200" name = "dvr" type="bool" desc="Разрешена ли запись и хранения DVR"/>
            <method:returnparam code="200" name = "recording" type="enum" desc="Состояние записи DVR. {@see:Aipix/Media server/DVR/Запись по событиям}">
                <page:list pre="enum-ondemand_t"/>
            </method:returnparam>
            <method:returnparam code="200" name = "uid" type="uid" desc="Уникальный идентификатор потока"/>
            <method:returnparam code="200" name = "subtitle" type="string" desc="Имя потока"/>
            <method:returnparam code="200" name = "state" type="enum" desc="Состояния подключения к потоку">
                <page:list pre="enum-state_t"/>
            </method:returnparam>
            <method:returnparam code="200" name = "tracks" type="array" desc="Список каналов разрешенных для захвата вне зависимости существует канал в потоке или нет.">
                <page:list pre="enum-tracks_t"/>
            </method:returnparam>
            <method:returnparam code="200" name = "access" type="enum" desc="Указвает тип авторизации клиентов при подключении для воспроизведения потока">
                <page:list pre="enum-access_t"/>
            </method:returnparam>
            <method:returnparam code="200" name = "reconnect_count" type="int" desc="Количество попыток переподключений, с момента последнего разрыва соединений с потоком"/>
            <method:returnparam code="200" name = "reconnect_total" type="int" desc="Общее количество попыток перподключения, с момента последней успешной попытки подключения"/>
        </method:return>
        <method:return code="404" desc="Камера с таким UID не найдена"/>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>