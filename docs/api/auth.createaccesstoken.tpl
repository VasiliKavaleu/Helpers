<doc:page:ru toc="Aipix/Media server/Web API/Authorization/CreateAccessToken" title="Authorization.CreateAccessToken">
    <page:p>Создание OAuth токена для воспроизведения потока с типом доступа Private {@see:'Aipix/Media server/Потоки видеокамер/Воспроизведение потока'}.</page:p>
    <page:info>Метод не проверяет наличие потока на сервере, что позволяет сгенировать токен для воспроизведения потока на любом другом сервере с одинаковым secret {@see:Aipix/Media server/Конфигурирование/Cервер (server.yaml)}</page:info>
    <api:method>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:request type="POST" route="/auth/token/access/"/>
        <method:return code="200" type="json" desc="Возвращает JSON строку с токеном доступа к API">
            "5pNZXnaNf3w_x6I6AkeeXYXPejw8u47erHTwSNVOejgEjJp4~"
        </method:return>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
        <method:body type="json" desc="Параметры генерации токена воспроизведения потока">
            {"userid": "test","streamid": "test","ttl": 3600}
            <method:bodyparam name = "userid" required="true" type="string" desc="Идентификатор пользователя для кого генерируется токен"/>
            <method:bodyparam name = "streamid" required="true" type="uid" desc="UID потока доступ к которому необходимо предоставить доступ">
            <page:info>В параметре <u>streamid</u> возможно указать <b>*</b>, в этом случае доступ будет предоставлен к любому private потоку</page:info>
            </method:bodyparam>
            <method:bodyparam name = "ttl" required="true" type="int" desc="Длительность действия токена в секундах.\n0 - время жизни токена не ограничено"/>
        </method:body>
    </api:method>
</doc:page:ru>