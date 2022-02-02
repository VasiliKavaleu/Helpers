<doc:page:ru toc="Aipix/Media server/Web API/Streams/GetStream" title="Streams.GetStream">
    <page:p>Получить полную информацию и статистику по потку медиасервера</page:p>
    <api:method>
        <method:request type="GET" route="/streams/{stream-uid}/"/>
        <method:param name="stream-uid" type="uid" desc="Уникальный идентификтор потока {@hint:uid}"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:return code="200" type="json" desc="Возвращает JSON объект с информацией о потоке">
            {
                "stream": "192-168-7-36-1",
                "enable": "true",
                "tracks": ["video","audio","onvif","application"],
                "state": "pending",
                "type": "primary",
                "access": {
                    "type": "public",
                    "password": "",
                    "whitelist": {},
                    "user": "",
                    "limit": 0
                },
                "source": {
                    "source": "rtsp://1:JDJiJDEwJHhWbz5@10.201.117.51:6554/streams/130a1b43-53f1-4e53-a15b-49d72a120f06",
                    "stats": {
                        "num_clients": 0,
                        "out_bitrate": 0,
                        "last_connect": 0,
                        "in_bitrate": 0,
                        "next_reconnect": 0
                    },
                    "tracks": {
                        "video": {
                            "proto": "",
                            "enable": true,
                            "codec": "",
                            "width": "",
                            "height": ""
                        },
                        "app": {
                            "application": "",
                            "enable": true
                        },
                        "events": {
                            "enable": false
                        },
                        "audio": {
                            "proto": "",
                            "enable": true,
                            "sample": "",
                            "codec": "",
                            "channels": ""
                        }
                    }
                },
                "dvr": {
                    "to": 1639650343,
                    "enable": "true",
                    "capacity": 10737418240,
                    "depth": 8899200,
                    "size": 0,
                    "from": 1639648870,
                    "recording": "recording",
                    "storage": "/storage/",
                    "duration": 1473,
                    "chunk": 120
                },
                "control": {
                    "enable": true,
                    "dvr": true,
                    "timefor": 0,
                    "broadcast": true
                },
                "cluster": {
                    "secondary": "",
                    "primary": "",
                    "enable": false,
                    "stream": "primary"
                },
                "reconnect": {
                    "total": 0,
                    "count": 0,
                    "next": 0
                },
                "camera": "192-168-7-36",
                "title": "Office, kitchen",
                "subtitle": "Office, kitchen",
                "device": "onvif-uniquie-id",
                "location": "Peredovaya 111a"
            }
            <method:returnparam code="200" name = "stream" type="uid" desc="Уникальный идентификатор потока"/>
            <method:returnparam code="200" name = "enable" type="bool" desc="Разрешена иди запрещено поток"/>
            <method:returnparam code="200" name = "tracks" type="array" desc="Список каналов разрешенных для захвата вне зависимости существует канал в потоке или нет.">
                <page:list pre="enum-tracks_t"/>
            </method:returnparam>
            <method:returnparam code="200" name = "state" type="enum" desc="Состояния подключения к потоку">
                <page:list pre="enum-state_t"/>
            </method:returnparam>
            <method:returnparam code="200" name = "type" type="enum" desc="Тип потока, отношение к текущей ноде">
                <page:list>
                primary - Первичный поток (основной), медиасервер всегда захватывает этот поток
                secondary - Вторичный поток, медиасервер является резернвным этого потока. Если основной серерве станет недоступен, то вторичный сервер начнет захват этого потока.
                </page:list>
            </method:returnparam>
            <method:returnparam name="access.type" default="public" required="true" type="string" desc="Определяет тип авторизации клиентов при подключении к просмотру потока.">
                <page:list pre="enum-access_t"/>
            </method:returnparam>
            <method:returnparam name="access.user" default="" required="false" type="string" desc="Имя пользователя для Basic или Digest авторизации"/>
            <method:returnparam name="access.password" default="" required="false" type="string" desc="Пароль пользователя для Basic или Digest авторизации"/>
            <method:returnparam name="access.whitelist" default="[]" required="false" type="array" desc="Список разрешенных IP адресов с которых могут производится подключения к просмотру потока">
            Whitelist - является приоритетным параметром, если он задан, то всегда проверяется вхождение IP адреса подключения клиента, а затем авторизация.
            Возможно использование следующих форматов:<br>
                <u>192.168.1.100</u>, <u>192.168.1.100/24</u>, <u>192.168.1.100-192.168.1.105</u>
            </method:returnparam>
            <method:returnparam name="access.limit" default="0" required="false" type="int" desc="Ограничивание на максимальное количество одновременных подключений клиентов для просомтра потоков по всем видам протоколов."/>

            <method:returnparam name="source.source" type="url" desc="URL источника видеопотока"/>
            <method:returnparam name="source.stats" type="object" desc="Объект содержит статистику по потоку"/>
            <method:returnparam name="source.tracks" type="object" desc="Объект с подробной информацией о каждом канале потока."/>
            <method:returnparam name="tracks.enable" type="bool" desc="Захватывается ли этот канал. true указывает что канал присутствует и захватывается"/>
            <method:returnparam name="tracks.codec" type="string" desc="Название кодека потока"/>
            <method:returnparam name="dvr.enable" type="bool" desc="Разрешена ли запись и хранение DVR"/>
            <method:returnparam name="dvr.depth" type="seconds" desc="Глубина хранения архива"/>
            <method:returnparam name="dvr.capacity" type="bytes" desc="Разрешенное место для хранения DVR"/>
            <method:returnparam name="dvr.size" type="bytes" desc="Текущий размер занимаемый архивом. Значение является приблидительным"/>
            <method:returnparam name="dvr.from" type="timestamp" desc="Время начала интервала с которого есть DVR. Не учитывает разрывы DVR"/>
            <method:returnparam name="dvr.to" type="timestamp" desc="Время окончание интервала за который есть DVR"/>
            <method:returnparam name="dvr.duration" type="seconds" desc="Длительность записанного DVR без учета разрывов"/>
            <method:returnparam name="dvr.storage" type="string" desc="Корневой путь храения DVR"/>
            <method:returnparam code="200" name = "recording" type="enum" desc="Состояние записи DVR.">
                <page:list pre="enum-ondemand_t"/>
            </method:returnparam>
            <method:returnparam code="200" name = "reconnect.last" type="timestamp" desc="Время последней успешной попытки подключения к потоку"/>
            <method:returnparam code="200" name = "reconnect.next" type="timestamp" desc="Время когда будет осуществлена повторная поптыка подключения к потоку. Только если поток не активен"/>
            <method:returnparam code="200" name = "reconnect.count" type="int" desc="Количество попыток переподключений, с момента последнего разрыва соединений с потоком"/>
            <method:returnparam code="200" name = "reconnect.timeout" type="int" desc="Текущий интервал прогрессивного переподлключения"/>
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
</doc:page>