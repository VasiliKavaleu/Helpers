<doc:page:ru toc="Aipix/Syntax" title="Syntax">
    <page:p>Получение информации о версии Media server</page:p>
    <api:method>
        <method:request type="POST" route="/api/server/{stream-uid}/version/{camera-uid}/{id}/"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:arg name="duration" required="false" type="timestamp" desc="Длительность воспроизведения DVR"/>
        <method:param name="stream-uid" type="uid" desc="Уникальный идентификтор потока {@hint:uid}"/>
        <method:param name="stream-uid" type="uid" desc="Уникальный идентификтор камеры {@hint:uid}"/>
        <method:return code="200" type="json" desc="Возвращает JSON объект с информацией о версии Media server">
        {
            "os": {
                "node": "yakubouski",
                "release": "5.10.60.1-microsoft-standard-WSL2",
                "sys": "Linux"
            },
            "version": {
                "branch": "dev",
                "build": "1.cef2342",
                "core": "3.x86_64",
                "number": "21.12.0.1",
                "product": "MediaServer"
            }
        }
            <method:returnparam code="200" name = "os.node" type="string" desc="Hostname сервера"/>
            <method:returnparam code="200" name = "os.release" type="string" desc="Версия операционной системы"/>
            <method:returnparam code="200" name = "os.sys" type="string" desc="Операционная система"/>
            <method:returnparam code="200" name = "version.branch" type="string" desc="Ветка исходного кода"/>
            <method:returnparam code="200" name = "version.build" type="string" desc="Номер сборки ПО"/>
            <method:returnparam code="200" name = "version.core" type="string" desc="Версия ядра ПО и архитектура"/>
            <method:returnparam code="200" name = "version.number" type="string" desc="Версия ПО"/>
            <method:returnparam code="200" name = "version.product" type="string" desc="Название программного обеспечения"/>
        </method:return>
        <method:return code="400" desc="цука уцкапукц"/>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
        <method:body type="json" desc="Возвращает JSON объект с информацией о версии Media server">
            {"appid": "test","ttl": 3600}
            <method:bodyparam name = "appid" type="string" desc="Идентификатор приложения для кого будет создан токен"/>
            <method:bodyparam name = "ttl" type="int" desc="Длительность действия токена в секундах.\n0 - время жизни токена не ограничено"/>
        </method:body>
    </api:method>
</doc:page:ru>