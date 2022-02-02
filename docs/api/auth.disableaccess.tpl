<doc:page:ru toc="Aipix/Media server/Web API/Authorization/DisableAccess" title="Authorization.DisableAccess">
    <page:p>Запрещает или разрешает любой вид авторизации подключений клиентов для воспроизведения потков</page:p>
    <api:method>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:request type="PUT" route="/auth/disable/"/>
        <method:return code="200" type="json" desc="Нет возвращаемого ответа"/>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
        <method:body type="json" desc="Объект с токеном для проверки">
            {"disable": true}
            <method:bodyparam name = "disable" required="true" type="bool" desc="Заперщает\разрешает авторизацию"/>
        </method:body>
    </api:method>
</doc:page:ru>