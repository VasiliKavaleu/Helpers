<doc:page:ru toc="Aipix/Media server/Web API/Server/GetVersion" title="Server.GetVersion">
    <page:p>Получение информации о версии Media server</page:p>
    <api:method>
        <method:request type="GET" route="/api/server/version/"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
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
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>