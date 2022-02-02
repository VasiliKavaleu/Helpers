<doc:page:ru toc="Aipix/Media server/Web API/Authorization/CreateApiToken" title="Authorization.CreateApiToken">
    <page:p>Создание OAuth токена для доступа к Web API. Каждый метод API, за исключением данного метода, должен содержать токен авторизации запроса, либо в параметре <u>token</u>, либо в заголовке запроса <u>Authorization</u></page:p>
    <page:info>Этот метод может быть вызван только с сервера где установлен медиасервер. Hostname в URL запросе, всегда должен быть <u>localhost</u> или <u>IP адрес</u> локального сетевого интерфейса</page:info>
    <api:method>
        <method:request type="POST" route="/auth/token/api/"/>
        <method:return code="200" type="json" desc="Возвращает JSON строку с токеном доступа к API">
            "5pNZXnaNf3w_x6I6AkeeXYXPejw8u47erHTwSNVOejgEjJp4~"
        </method:return>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
        <method:body type="json" desc="Параметры генерации токена доступа">
            {"appid": "test","ttl": 3600}
            <method:bodyparam name = "appid" required="true" type="string" desc="Идентификатор приложения для кого будет создан токен"/>
            <method:bodyparam name = "ttl" required="true" type="int" desc="Длительность действия токена в секундах.\n0 - время жизни токена не ограничено"/>
        </method:body>
    </api:method>
</doc:page:ru>