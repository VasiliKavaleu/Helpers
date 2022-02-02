<doc:page:ru toc="Aipix/Media server/Конфигурирование/Поток (stream.yaml)" title="Файл конфигруации потока (streams.yaml)">
    <page:p>Для начала захвата медиасервером потока, необходимо его правильно сконфигруировать. Каждый файл конйигурации должен содержать параметры одного потока.
        Путь к файлам конфигурации потока задается в параметре <b>server.media.streams</b> {@see:'Aipix/Media server/Конфигурирование/Cервер (server.yaml)'}.
    </page:p>
    <page:info>Сервер загружает из директории все файлы с расширением `.yaml`. Остальные файлы игнорирует.</page:info>
    <config:yaml>
        <yaml:param name="stream" required="true" default="(a-z, A-Z, 0-9, -, ., _){1,48}" type="uid" desc="Уникальный идентификатор потока в рамках одной инсталляции.">
            Строка максимльной длинны 48 допустимых символов 
        </yaml:param>
        <yaml:param name="source" required="true" default="" type="url" desc="URL подключения к потоку.">
            - <b>rtsp://[user:password]@host[:port]/...</b> - URL к которому сервер будет подключаться для захвата потока.
            - <b>publish://[user:password]@hostname[:port]/...</b> - URL на котром сервер будет ожидать подключения потока. {@see:'Aipix/Media server/Потоки видеокамер/Публикация RTSP потока'}
        </yaml:param>
        <yaml:param name="enable" default="true" required="false" type="bool" desc="Разрешает\Запрещает подключние к потоку">
            Сервер всегда загуржает конфигурацию {@hint:'своего потока'}. Если параметр установлен как <b>false</b>. То подключение к потоку не производится.
        </yaml:param>
        <yaml:param name="camera"  default="(a-z, A-Z, 0-9, -, ., _){1,48}" required="false" type="uid" desc="Уникальный идентификатор камеры в рамках одной инсталляции. {@see:'Aipix/Media server/Потоки видеокамер/Виртуальные камеры'}">
            Строка максимльной длинны 48 допустимых символов. Если параметр не указан, то будет взято занчение UID потока.
        </yaml:param>
        <yaml:param name="title"  default="" required="false" type="string" desc="Название камеры. Используется для отображения, в качестве имени скачиваемого видео и в API для улучшения восприятия">
            Если парамет не указан, то будет взят UID камеры.
        </yaml:param>
        <yaml:param name="subtitle"  default="" required="false" type="string" desc="Название потока камеры. Исползуется в качестве дополнительного названия к параметру названия потока."/>
        <yaml:param name="location"  default="" required="false" type="string" desc="Название расположения камеры. Используется как информационый параметр при отображении и в API."/>
        <yaml:param name="device"  default="" required="false" type="string" desc="Уникальный идентификатор физического устройства (приме: onvif device id)"/>
        <yaml:param name="tracks" required="true" default="[ video, audio ]" type="array" desc="Каналы RTSP потока, которые будет захватывать сервер. Если указанный канал не существует в исходном потоке, то подкюлчение к нему не производится.">
            Возможные значения типов каналов:
            - <b>video</b> - Канал видео данных. Отсутствие в исходном RSTP потоке канала video, приводит к отключение от потока и прекращение работы с ним. {@see:'Aipix/Media server/Потоки видеокамер/Поддерживаемые типы потоков'}
            - <b>audio</b> - Канал звуковых данных. Отсутствие в исходном RSTP потоке канала video, приводит к отключение от потока и прекращение работы с ним.
            - <b>events</b> - Разрешает серверу работать и хранить в DVR события потока. {@see:'Aipix/Media server/DVR/События'}
            - <b>application</b> - Разрешает серверу подключаться к onvif каналу потока.
        </yaml:param>
        <yaml:param name="broadcast" required="true" default="[ rtsp, hls ]" type="array" desc="Протоклы по которым клиенту разрешено подключаться к серверу для просмотро потока. (Указывается индивидуально для каждого потока)">
            Поддерживаемые типы протоколов:
           <page:list pre="enum-broadcast_t"/>
        </yaml:param>
        <yaml:param name="access.type" default="public" required="true" type="string" desc="Определяет тип авторизации клиентов при подключении к просмотру потока.">
            <page:list pre="enum-access_t"/>
        </yaml:param>
        <yaml:param name="access.auth.type" default="digest" required="false" type="enum" desc="Определяет тип web авторизации">
            <page:list pre="enum-webauth_t"/>
        </yaml:param>
        <yaml:param name="access.auth.user" default="" required="false" type="string" desc="Имя пользователя для Basic или Digest авторизации"/>
        <yaml:param name="access.auth.password" default="" required="false" type="string" desc="Пароль пользователя для Basic или Digest авторизации"/>
        <yaml:param name="access.whitelist" default="[]" required="false" type="array" desc="Список разрешенных IP адресов с которых могут производится подключения к просмотру потока">
        Whitelist - является приоритетным параметром, если он задан, то всегда проверяется вхождение IP адреса подключения клиента, а затем авторизация.
        Возможно использование следующих форматов:
            <u>192.168.1.100</u>, <u>192.168.1.100/24</u>, <u>192.168.1.100-192.168.1.105</u>
        </yaml:param>
        <yaml:param name="access.limit" default="0" required="false" type="int" desc="Ограничивает максимальное количество одновременных подключений клиентов для просомтра потоков по всем видам протоколов."/>
        <yaml:param name="dvr.enable" default="false" required="true" type="enum" desc="Разрешает\запрещает серверу записывать и хранить копию потока. {@see:Aipix/Media server/DVR/Обзор}">
            <page:list pre="enum-dvr_type_t"/>
        </yaml:param>
        <yaml:param name="dvr.location" default="" required="true" type="path" desc="Задает корневую директории хранения DVR. {@see:Aipix/Media server/DVR/Хранение DVR}"/>
        <yaml:param name="dvr.depth" default="" required="true" type="seconds" desc="Задает длительность хранения записи."/>
        <yaml:param name="dvr.capacity" default="" required="false" type="bytes" desc="Ограничивает размер дискового пространства для записей. Параметр информационный. Физических ограничений не накладывает."/>
        <yaml:param name="dvr.chunk" default="" required="false" type="seconds" desc="Задает длительность сегмента записи."/>
        
        <yaml:param name="reconnect.attempts" default="10" required="true" type="int" desc="Задает количество попыток переподключения к потоку в случае разрыва соединения. {@see:Aipix/Media server/Потоки видеокамер/Подключение к потоку}"/>
        <yaml:param name="reconnect.timeout" default="10" required="true" type="seconds" desc="Таймаут между попытками подключения к потоку"/>
        <yaml:param name="reconnect.interval" default="30m" required="true" type="seconds" desc="Максимальный интервал подключения к потоку"/>

        <yaml:param name="cluster.primary" default="" required="false" type="string" desc="Если включяена функция кластера {@see:Aipix/Media server/Конфигурирование/Cервер (server.yaml)}, то параметр задает имя хоста который является основнм для захвата потока"/>
        <yaml:param name="cluster.secondary" default="" required="false" type="string" desc="Задает имя хоста который является резервным для захвата потока, в случае недоступности основного хоста"/>
        <yaml:file name="Пример файла конфигурации (stream.yaml)">
stream: stream-unique-id # straem UID max 48 symbol ( a-z, A-Z, 0-9, -, ., _ )
source: rtsp://admin:admin@192.168.7.34:554/Streaming/Channels/101 # stream rtsp source url
enable: false # enable\disable stream capture ( true\false on-demand default: true )
camera: camera-unique-id # optional virtual camera binding
title: Camera Kitchen # optional Camera pretty name
subtitle:  # optional Stream pretty name
location: # optional Camera location
device: # optional device ID ( onvif )
tracks: [ video, audio, events, application ] # enabled rtsp channels [ video, audio, events, application ]
broadcast: [ rtsp, hls ] # enabled restreaming protocols [ rtsp, hls, mse, webrtc ]
access:
    type: protected # support of public (is default), private (use token), protected (use auth)
    auth: # credentials for protected type authorization ( basic or digest )
        type: digest # protected authorization type ( basic or digest )
        user: admin
        password: admin
    whitelist: [] # suport single, range and net mask format [ "127.0.0.0/24","172.1.1.10-172.1.1.45", "192.168.1.1" ]
    limit: 0 # limit number of client connections. 0 or empty for unlimit
dvr:
  enable: false # enable\disable stream recording ( false, true, ondemand ( by start/stop event ) )
  location: /storage/ # root dvr location directory
  depth: 3d # duration of dvr keeping
  capacity: 10G # limit of dvr size
  chunk: 2m # chunk duration 
reconnect:
  attempts: 500 # number of reconnects, before turn off stream
  timeout: 10s # timeout before reconnect attempt
  interval: 30m # maximum timeout interval for progressive reconnect scheme
cluster:
  primary: # hostname
  secondary: # secondary hostname"
        </yaml:file>
    </config:yaml>
</doc:page:ru>