<doc:page:ru toc="Aipix/Media server/Web API/Streams/GetPreview" title="Streams.GetPreview">
    <page:p>Возвращает превью видеопотока в формате data:video/mp4;base64. Может быть использовано для вставки в html тэг img.</page:p>
    <api:method>
        <method:request type="GET" route="/streams/{stream-uid}/preview/"/>
        <method:param name="stream-uid" type="uid" desc="Уникальный идентификтор потока {@hint:uid}"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:return code="200" type="raw" desc="Base64 строка в формате video/mp4;base64">
            "data:video/mp4;base64,AAAAJGZ0eXBpc29tAAAAAWlzb21tcDQyYXZjMWRhc2hpc281AAACkm1vb3YAAABsbXZoZAAAAADd5iTw3eYk8AAAA...."
        </method:return>
        <method:return code="404" desc="Поток с таким UID не найден"/>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>