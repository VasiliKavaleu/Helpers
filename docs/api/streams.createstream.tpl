<doc:page:ru toc="Aipix/Media server/Web API/Streams/CreateStream" title="Streams.CreateStream">
    <page:p>Создание и конфигуриорвание потока на медиасервере.</page:p>
    <api:method>
        <method:request type="POST" route="/streams/"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:body type="json" desc="Объект с информацией о интервале получения событий">
            {
                "stream": "new-stream-uid",
                "source": "rtsp://admin:admin@192.168.7.34:554/Streaming/Channels/101",
                "tracks": ["video" , "audio" ],
                "broadcast": ["rtsp", "hls"],
                "enable": "true",
                "dvr": { 
                    "enable": "true", 
                    "location": "/storage", 
                    "depth": "3d", 
                    "capacity": "10G", 
                    "chunk": "2m" 
                },
                "access": { 
                    "type": "protected", 
                    "auth": { "type": "digest", "user": "admin", "password": "admin" }, 
                    "whitelist": [], 
                    "limit": 0 
                },
                "reconnect-attempts": 500,
                "reconnect-timeout": "10s",
                "reconnect-interval": "30m",
                "node-primary": "",
                "node-secondary": "node-host-2",
                "camera": "192-168-7-34",
                "title": "Camera-1",
                "subtitle": "HD",
                "device": "onvif-uniquie-id",
                "location": "Peredovaya 111a"
            }
            <method:bodyparam code="200" name = "stream" type="uid" desc="Уникальный идентификатор потока" required="true" />
            <method:bodyparam code="200" name = "source" type="url" desc="URL подключения к потоку или URL публикации потока {@see:Aipix/Media server/Конфигурирование/Поток (stream.yaml)}" required="true" />
            <method:bodyparam code="200" name = "tracks" type="array" desc="Список каналов разрешенных для захвата вне зависимости существует канал в потоке или нет.">
                <page:list pre="enum-tracks_t"/>
            </method:bodyparam>
            <method:bodyparam code="200" name = "broadcast" type="array" default="[ rtsp, hls ]" desc="Протоклы по которым клиенту разрешено подключаться к медиасерверу для просмотра потока.">
                <page:list pre="enum-broadcast_t"/>
            </method:bodyparam>
            <method:bodyparam code="200" name = "enable" type="bool" desc="Разрешена или запрещен поток. (Если запрещен, то воспроизведение и запись live и dvr недоступна)"/>

            <method:bodyparam name="dvr.enable" default="false" required="true" type="enum" desc="Разрешает\запрещает серверу записывать и хранить копию потока. {@see:Aipix/Media server/DVR/Обзор}">
                <page:list pre="enum-dvr_type_t"/>
            </method:bodyparam>
            <method:bodyparam name="dvr.location" default="" required="true" type="path" desc="Задает корневую директории хранения DVR. {@see:Aipix/Media server/DVR/Хранение DVR}"/>
            <method:bodyparam name="dvr.depth" default="" required="true" type="seconds" desc="Задает длительность хранения записи."/>
            <method:bodyparam name="dvr.capacity" default="" required="false" type="bytes" desc="Ограничивает размер дискового пространства для записей. Параметр информационный. Физических ограничений не накладывает."/>
            <method:bodyparam name="dvr.chunk" default="" required="false" type="seconds" desc="Задает длительность сегмента записи."/>
            <method:bodyparam name="access.type" default="public" required="true" type="string" desc="Определяет тип авторизации клиентов при подключении к просмотру потока.">
                <page:list pre="enum-access_t"/>
            </method:bodyparam>
            <method:bodyparam name="auth.type" default="digest" required="false" type="enum" desc="Определяет тип web авторизации">
                <page:list pre="enum-webauth_t"/>
            </method:bodyparam>
            <method:bodyparam name="auth.user" default="" required="false" type="string" desc="Имя пользователя для Basic или Digest авторизации"/>
            <method:bodyparam name="auth.password" default="" required="false" type="string" desc="Пароль пользователя для Basic или Digest авторизации"/>
            <method:bodyparam name="access.whitelist" default="[]" required="false" type="array" desc="Список разрешенных IP адресов с которых могут производится подключения к просмотру потока">
            Whitelist - является приоритетным параметром, если он задан, то всегда проверяется вхождение IP адреса подключения клиента, а затем авторизация.
            Возможно использование следующих форматов:<br>
                <u>192.168.1.100</u>, <u>192.168.1.100/24</u>, <u>192.168.1.100-192.168.1.105</u>
            </method:bodyparam>
            <method:bodyparam name="access.limit" default="0" required="false" type="int" desc="Ограничивает максимальное количество одновременных подключений клиентов для просомтра потоков по всем видам протоколов."/>
            <method:bodyparam code="200" name = "reconnect-attempts" type="int" desc="Количество попыток переподключений. Лимит последовательных попыток переподключения к потоку исчерпав который медиасервер пометит поток как недоступный и исключит из дальнейшего захвата. {@see:Aipix/Media server/Потоки видеокамер/Подключение к потоку}"/>
            <method:bodyparam code="200" name = "reconnect-timeout" type="seconds" desc="Прогрессивная временная задержка между попытками подключения"/>
            <method:bodyparam code="200" name = "reconnect-interval" type="seconds" desc="Максимальное значение прогрессивной задержки между подключениями"/>
            <method:bodyparam code="200" name = "node-primary" type="string" desc="Если доступна функциональность кластера, то параметр задает первичную ноду захвата потока"/>
            <method:bodyparam code="200" name = "node-secondary" type="string" desc="Если доступна функциональность кластера, то параметр задает вторичную (резервную) ноду захвата потока"/>
            <method:bodyparam code="200" name = "camera" type="uid" desc="Уникальный идентификатор виртуальной камеры"/>
            <method:bodyparam code="200" name = "title" type="string" desc="Информационный параметр название камеры"/>
            <method:bodyparam code="200" name = "subtitle" type="string" desc="Информационный параметр название потока"/>
            <method:bodyparam code="200" name = "device" type="string" desc="Информационный параметр идентификатор источника (к примеру Onvif device id)"/>
            <method:bodyparam code="200" name = "location" type="string" desc="Информационный параметр метсо расположения источника"/>
        </method:body>
        <method:return code="201" type="json" desc="Поток успешно создан"/>
        <method:return code="404" desc="Поток с таким UID не найден"/>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>