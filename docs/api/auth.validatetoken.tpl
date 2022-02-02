<doc:page:ru toc="Aipix/Media server/Web API/Authorization/ValidateToken" title="Authorization.ValidateToken">
    <page:p>Проверяем токен авторизации (воспроизведения потока или доступа к API) на корректность и параметры</page:p>
    <api:method>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:request type="PUT" route="/auth/token/validate/"/>
        <method:return code="200" type="json" desc="Возвращает JSON строку с токеном доступа к API">
            {
                "stream": "",
                "expire": 1637335523,
                "valid": false,
                "owner": "test"
            }
            <method:returnparam code="200" name = "stream" type="uid" desc="Идентификатор потока для которого был создан токен"/>
            <method:returnparam code="200" name = "expire" type="timestamp" desc="Время истечения срока жизни токена"/>
            <method:returnparam code="200" name = "valid" type="bool" desc="Является ли токен действующим"/>
            <method:returnparam code="200" name = "owner" type="string" desc="Для какого пользователя или приложения был выписан токен"/>
        </method:return>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
        <method:body type="json" desc="Объект с токеном для проверки">
            {"token": "LBvBjeUSrmJLP-NkZwbnWzhOMfVP7CHN1Fc24mhaHAA~"}
            <method:bodyparam name = "token" required="true" type="string" desc="Токен"/>
        </method:body>
    </api:method>
</doc:page:ru>