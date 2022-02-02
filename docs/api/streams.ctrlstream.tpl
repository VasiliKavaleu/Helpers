<doc:page:ru toc="Aipix/Media server/Web API/Streams/CtrlStream" title="Streams.CtrlStream">
    <page:p>Управлене воспроизвденем и захватом потока. Состояние не сохраняется. Служит только для временного изменения состояние, после перезагрузки сервера сбрасывается в изначальное состояние</page:p>
    <api:method>
        <method:request type="GET" route="/streams/{stream-uid}/ctrl/"/>
        <method:param name="stream-uid" type="uid" desc="Уникальный идентификтор потока {@hint:uid}"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>

        <method:body type="json" desc="Объект с информацией о действиях которые необходимо произвести с потоком. Могут быть заданы только те параметры которые необходимы.">
            {
                "enable": true,
                "restart": true,
                "broadcast": true,
                "dvr": true,
                "timeout": 50,
                "reload": true
            }
            <method:bodyparam name = "enable" type="bool" desc="Запретить поток. Сервер отключается от источника, сбрасывает соединения всех клиентов. Перестает записывать DVR. Доступ к потоку невозможен ни для live, ни для dvr воспроизведения " required='true' />
            <method:bodyparam name = "restart" type="bool" desc="Перезапустить поток. Обывается текущее соединение с истоником, перезагружается dvr, очищается состояние потока и буферов"/>
            <method:bodyparam name = "broadcast" type="bool" desc="Прекратить вещание потока. Все клиенты отключаются, новые клиенты не могут подключиться для всопроизведения. DVR - продолжает записыватся."/>
            <method:bodyparam name = "reload" type="bool" desc="Перезагрузить индексы DVR."/>
            <method:bodyparam name = "dvr" type="bool" desc="Прекратить запись DVR. Прерывает запись DVR. Ранее сохраненный архив продолжает быть доступным. Если указан параметр timeout, то запись DVR возобновиться через указанный интервал"/>
            <method:bodyparam name = "timeout" type="seconds" desc="Интервал времени через который возобновиться запись DVR"/>
        </method:body>
        <method:return code="200" desc="Нет возвращаемых значений"/>
        <method:return code="404" desc="Поток с таким UID не найден"/>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>