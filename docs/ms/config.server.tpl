<doc:page:ru toc="Aipix/Media server/Конфигурирование/Cервер (server.yaml)" title="Конфигурирование Media server (server.yaml)">
    <p>Перед запуском медиасервера необходимо отредактирровать параметры запуска в файле <b>server.yaml</b> ( по умолчанию находится в каталоге /opt/aipix/media-server/ )</p>
    <config:yaml>
        <yaml:param name="server.media.threads" default="3" required="true" values="1...N" type="int" desc="Количество системных потоков для обработки подключений к потокам видеокамер."/>
        <yaml:param name="server.media.streams" default="streams/" required="true" type="string" desc="Расположение файлов конфигурации потоков. {@see:Aipix/Media server/Конфигурирование/Поток (stream.yaml)}"/>
        <yaml:param name="server.media.storages" default="[ /storage ]" type="array" 
            desc="Массив строк содержащий пути где может быть сохранен DVR потоков.\nДанный параметр используется как информацуионный при вызове метода {@see:Aipix/Media server/Web API/Server/GetDrives}"/>
        <yaml:param name="server.broadcast.rtsp" default="{ listen: *:5554, threads: 1 }" required="true" type="object" desc="Разрешает серверу вещать потоки по протоколу {@hint:RTSP}">
            <b>listen</b> - имеет формат {iface}:{port}. iface - сетевой интерфейс. port - сетевой порт на котором будут ожидаться подключения клиентов по RTSP протоколу
            <b>threads</b> - количество системных потоков которые будут обслуживать подлюкчения RTSP клиентов. Если количество потоков = 0, то сервер запрещает подключение по протоколу RTSP
        </yaml:param>
        <yaml:param name="server.broadcast.publish" default="{ listen: *:7554, threads: 0 }" required="true" type="object" 
            desc="Разрешает серверу принимать подключения по RTSP протоколу. {@hint:RTSP-Publishing}">
            <b>listen</b> - имеет формат {iface}:{port}. iface - сетевой интерфейс. port - сетевой порт на котором будут ожидаться подключения по RTSP протоколу
            <b>threads</b> - количество системных потоков которые будут обслуживать подлюкчения. Если количество потоков = 0, то сервер запрещает публикацию по протоколу RTSP
        </yaml:param>
        <yaml:param name="server.broadcast.web" default="{ listen: *:8080, threads: 2 }" required="true" type="object" 
            desc="Разрешает серверу принимать подключения по Web протоколам воспроизведения видеоконтента. {@hint:HLS, MSE, WebRTC}">
            <b>listen</b> - имеет формат {iface}:{port}. iface - сетевой интерфейс. port - сетевой порт на котором будут ожидаться подключения по Web протоколам
            <b>threads</b> - количество системных потоков которые будут обслуживать подлюкчения. Если количество потоков = 0, то сервер запрещает подключение по Web протоколам.
        </yaml:param>
        <yaml:param name="server.broadcast.ssl" default="false" type="bool | object" 
            desc="Включает или отключает поддержку SSL\TLS соединения по Web протоколам. ">
            <b>false</b> - Отключает поддержку SSL\TLS.
            <b>true</b> - Включает поддержку защищенного соединения. Генеририрует {@hint:"Self-signed"} сертификат.
            <b>{ cert: filename, key: filename }</b> - cert - содержит путь к файлу сертификата SSL, key - путь к private ключу SSL сертификата.
        </yaml:param>
        <yaml:param name="server.broadcast.whitelist" default="false" type="array" 
            desc="Определяет список разрешенных IP адресов с которых можно осуществлять подключения к Media server.">
            Возможно использование следующих форматов:
            <u>192.168.1.100</u>, <u>192.168.1.100/24</u>, <u>192.168.1.100-192.168.1.105</u>
        </yaml:param>
        <yaml:param name="server.token.secret" default="null" type="string" desc="Задает seed для создание токена доступа. Рекомендуется использовать случайно сгенерированную последовательность более 32 символов."/>
        <yaml:param name="server.token.ttl" default="3600" type="seconds" desc="Необязательный параметр определяющий время жизни токена доступа, в случае если он не указан в запросе"/>
        <yaml:param name="server.hostname.hostname" default="" type="string" desc="Позволяет указать hostname, который будет использоваться сервером. Если не указан, то будет взят из /etc/hostname"/>
        <yaml:param name="server.events.collector" default="embedded" type="enum" 
            desc="Определяет параметр где будут храниться события потока, такие как события видеоаналитики, onvif либо события генерируемые через вызов API {@see:Aipix/Media server/Web API/Streams/Events/TriggerEvent}">
            Возможные значения
            <b>embedded</b> - События будут храниться в локально в записи DVR.
        </yaml:param>
        <yaml:param name="controller.dsn" default="" type="string" desc="Задает endpoint на который будут отправляться события медиасервера {@see:Aipix/Media server/Мониторинг/События медиасервера}">
            Если значения не указано или не поддерживается протокол, то события не будут отправляться. Поддерживаемые типы endpoint:
            <b>http://</b>, <b>https://</b>
        </yaml:param>
        <yaml:param name="controller.events" default="[ up, state, stream, cluster ]" type="array" desc="Список событий которые будут отправляться контроллеру">
            Если значения не указано или не поддерживается протокол, то события не будут отправляться. Поддерживаемые типы endpoint:
            <b>up</b> - сервер стал доступен после перезагрузки
            <b>state</b> - изменилось состояние сервера
            <b>stream</b> - события связанные с изменением состояние потока. {@see:"Aipix/Media server/Мониторинг/События потока"}.
            <b>cluster</b> - события кластера. {@see:"Aipix/Media server/Мониторинг/Кластер"}.
        </yaml:param>
        <yaml:param name="web.enable" default="[ api, cpanel ]" type="array" desc="Включает поддержку web модулей расширения медиасервера">
            <b>api</b> - Разрешает вызов Web API ( {@see:Aipix/Media server/Модули/Web API} )
            <b>cpanel</b> - Добавляет поддержку панели управления медиасервера ({@see:Aipix/Media server/Модули/Tехнологическая панель})
        </yaml:param>
        <yaml:param name="web.listen" default="*:8081" type="string" desc="Назначает интерфейс и порт на котором будут доступны подключения клиентов к Web модулям API и CPanel"/>
        <yaml:param name="web.ssl" default="false" type="bool | object" 
            desc="Включает или отключает поддержку SSL\TLS соединения">
            <b>false</b> - Отключает поддержку SSL\TLS.
            <b>true</b> - Включает поддержку защищенного соединения. Генеририрует {@hint:"Self-signed"} сертификат.
            <b>{ cert: filename, key: filename }</b> - cert - содержит путь к файлу сертификата SSL, key - путь к private ключу SSL сертификата.
        </yaml:param>
        <yaml:param name="web.api.module" default="module/api.v3.lua" type="string" desc="Путь LUA скрипту модуля Web API"/>
        <yaml:param name="web.api.route" default="/api" type="string" desc="Маршрут запросов к Web API"/>
        <yaml:param name="web.api.whitelist" default="[]" type="array" desc="Определяет список разрешенных IP адресов с которых можно осуществлять подключения к Web API"/>
        <yaml:param name="web.api.dvr" default="protect" type="enum" desc="Запрещает удаление DVR при удалении потока через Web API. Вне зависимости от параметра переданного при вызове API"/>
        <yaml:param name="web.cpanel.module" default="module/cpanel.default.lua" type="string" desc="Путь LUA скрипту модуля CPanel"/>
        <yaml:param name="web.cpanel.route" default="/cpanel" type="string" desc="Маршрут запросов к панели управления медиасервера"/>
        <yaml:param name="web.cpanel.whitelist" default="[]" type="array" desc="Определяет список разрешенных IP адресов с которых можно осуществлять подключения к CPanel"/>
        <yaml:param name="web.cpanel.auth" default="none" type="enum" desc="Определяет тип авторизации пользователя в CPаnel">
            <b>none</b> - Авторизация в CPanel отключена.
            <b>basic</b> - Basic авторизация по имени пользователя и паролю.
            <b>digest</b> - Digest авторизация по имени пользователя и паролю.
        </yaml:param>
        <yaml:param name="web.cpanel.users" type="object" desc="Имя пользователя и пароль для входа в панель управления. ( для Basic и Digest авторизации)">
            Логин  определяет права пользователя в панели управления.
            <b>admin</b> - password
            <b>root</b> - ...
        </yaml:param>
        <yaml:param name="cluster.enable" default="false" required="true" type="bool" desc="Включает поддержку кластера в медиасервере {@see:'Aipix/Media server/Мониторинг/Кластер'} "/>
        <yaml:param name="cluster.id" default="0" type="int" required="true"  desc="Числовой идентификатор кластера"/>
        <yaml:param name="cluster.node" default="0" type="int" required="true" desc="Идентификатор текущей ноды сервера."/>
        <yaml:param name="cluster.hosts" default="" type="string or array" required="true" desc="Список сопоставлений вторичных Id нод кластера и hostname.">
            Если задана как string, то воспринимается как имя файла в формате yaml, в котром определен массив объектов сопоставлений Id ноды и hostname. 
            Если array то воспринимается как массив объектов сопоставлений Id ноды и hostname.
        </yaml:param>
        <yaml:param name="cluster.healthcheck.warming-up" default="10s" type="seconds" required="true" desc="Время в течении которого ноды кластера могут не отсылать ping после растарта. Чем больше потоков тем больше времени необходимо на 'разогрев' ноды"/>
        <yaml:param name="cluster.healthcheck.retries" default="5" type="int" required="true" desc="Количество пропущеных попыток ping, прежде чем текущая нода сочтет недоступным вторичные ноды кластера"/>
        <yaml:param name="cluster.healthcheck.interval" default="10s" type="seconds" required="true" desc="Интервал между запросами ping"/>
        <yaml:file name="Пример файла конфигурации (server.yaml)">
server:
    media:
        threads: 3
        streams: streams/
        storages: [ /storage, /storage2/ ]
    broadcast:
        rtsp: { listen: "*:5554", threads: 1 }
        publish: { listen: "*:7554", threads: 0}
        web: { listen: "*:8080", threads: 2}
        ssl: false # or true - self signed certificate will be generated, or { cert: filename, key: filename }
        whitelist: []
    token: { secret: null, ttl: 3600 }
    hostname: localhost
    events: {
        collector: embedded
    }

controller:
    dsn: # http[s]://, ws://, mysql://, rabbitmq://, tarantool://
    events: [ up, state, stream, cluster ]

web: 
    enable: [ api, cpanel ] # or
    listen: "*:8081"
    ssl: false # or true - self signed certificate will be generated, or { cert: filename, key: filename }
    api: 
        module: module/api.v3.lua
        route: /api
        whitelist: []
        dvr: protect # disable erase DVR via API call
    cpanel: 
        module: module/cpanel.default.lua
        route: /cpanel
        whitelist: []
        auth: none # basic, digest, token
        users:
            admin: password
            root:
            user:
            guest:

cluster:
    enable: false
    id: 100
    node: 1001
#    hosts: hosts.yaml
    hosts: 
        -1001: node_host_name-1
        -1002: node_host_name-2
    healthcheck: { warming-up: 10s, retries: 5, interval: 10s }
        </yaml:file>
    </config:yaml>
</doc:page:ru>