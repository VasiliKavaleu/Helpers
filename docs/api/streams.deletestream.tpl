<doc:page:ru toc="Aipix/Media server/Web API/Streams/DeleteStream" title="Streams.DeleteStream">
    <page:p>Прекращение обработки потока и удаление с сервера. Существует взможность удалить в том числе и записей DVR, однако удаление DVR может быть заблокировано на уровне конфигурации медиасервера {@see:Aipix/Media server/Конфигурирование/Cервер (server.yaml)}</page:p>
    <page:info>Конфигурационный файл потока не удаляется с сервер, а переименовывается. В случае необходимости его можно восстановить вручном режиме</page:info>
    <api:method>
        <method:request type="DELETE" route="/streams/{stream-uid}/"/>
        <method:param name="stream-uid" type="uid" desc="Уникальный идентификтор потока {@hint:uid}"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:body type="json" desc="Объект с информацией о действиях которые необходимо произвести с потоком. Могут быть заданы только те параметры которые необходимы.">
            {
                "dvr": "erase"
            }
            <method:bodyparam name = "dvr" type="enum" desc="Указывает какие действия необходимо сделать с записями DVR">
                <page:list>
                keep - сохранить DVR. В дальнейшем освободить место можно только вручном режиме на самом сервере.
                erase - стереть DVR и освободить место
                </page:list>
            </method:bodyparam>
        </method:body>
        <method:return code="200" desc="Нет возвращаемых значений"/>
        <method:return code="404" desc="Поток с таким UID не найден"/>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>