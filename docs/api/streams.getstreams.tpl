<doc:page:ru toc="Aipix/Media server/Web API/Streams/GetStreams" title="Streams.GetStreams">
    <page:p>Метод возвращает список всех потоков загруженных серверов и краткую информацию по каждому потоку</page:p>
    <api:method>
        <method:request type="GET" route="/streams/"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:return code="200" type="json" desc="Возвращает JSON массив со списком потоков">
            [
                {
                    "stream": "192-168-7-36-1",
                    "enable": "true",
                    "tracks": ["video","audio","events","application"],
                    "recording": "recording",
                    "camera": "192-168-7-36",
                    "access": "public",
                    "title": "Office, kitchen",
                    "subtitle": "Office, kitchen",
                    "dvr": "true",
                    "in_bitrate": 0,
                    "out_bitrate": 0,
                    "last_connect": 0,
                    "num_clients": 0,
                    "next_reconnect": 0,
                    "reconnect_count": 0,
                    "primary": true,
                    "state": "pending"
                }
            ]
            <method:returnparam code="200" name = "stream" type="uid" desc="Уникальный идентификатор потока"/>
            <method:returnparam code="200" name = "enable" type="bool" desc="Разрешена иди запрещено поток"/>
            <method:returnparam code="200" name = "tracks" type="array" desc="Список каналов разрешенных для захвата вне зависимости существует канал в потоке или нет.">
                <page:list pre="enum-tracks_t"/>
            </method:returnparam>
            <method:returnparam code="200" name = "recording" type="enum" desc="Состояние записи DVR. {@see:Aipix/Media server/DVR/Запись по событиям}">
                <page:list pre="enum-ondemand_t"/>
            </method:returnparam>
            <method:returnparam code="200" name = "primary" type="bool" desc="Указывает является ли поток первичным или вторичным  {@see:Aipix/Media server/Кластер/Кластерный захват}"/>
            <method:returnparam code="200" name = "dvr" type="bool" desc="Разрешена ли запись и хранения DVR"/>
            <method:returnparam code="200" name = "state" type="enum" desc="Состояния подключения к потоку">
                <page:list pre="enum-state_t"/>
            </method:returnparam>
            <method:returnparam code="200" name = "access" type="enum" desc="Указвает тип авторизации клиентов при подключении для воспроизведения потока">
                <page:list pre="enum-access_t"/>
            </method:returnparam>
            <method:returnparam code="200" name = "reconnect_count" type="int" desc="Количество попыток переподключений, с момента последнего разрыва соединений с потоком"/>
            <method:returnparam code="200" name = "in_bitrate" type="bps" desc="Входящий битрейт потока"/>
            <method:returnparam code="200" name = "out_bitrate" type="bps" desc="Суммарный битрейт отдаваемый всем подключившемся к потоку клиентам"/>
            <method:returnparam code="200" name = "last_connect" type="timestamp" desc="Время последней успешной попытки подключения к потоку"/>
            <method:returnparam code="200" name = "next_reconnect" type="timestamp" desc="Время когда будет осуществлена повторная поптыка подключения к потоку. Только если поток не активен"/>
            <method:returnparam code="200" name = "num_clients" type="int" desc="Количество клиентов подключившихся к потоку для просмотра"/>
            <method:returnparam code="200" name = "camera" type="uid" desc="Уникальный идентификатор виртуальной камеры"/>
            <method:returnparam code="200" name = "title" type="string" desc="Название камеры"/>
            <method:returnparam code="200" name = "subtitle" type="string" desc="Имя потока"/>
            <method:returnparam code="200" name = "device" type="string" desc="Идентификатор источника (к примеру Onvif device id)"/>
            <method:returnparam code="200" name = "location" type="string" desc="Место расположения источника"/>
        </method:return>
        <method:return code="404" desc="Поток с таким UID не найден"/>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>