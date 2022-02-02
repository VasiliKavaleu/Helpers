<doc:page:ru toc="Aipix/Media server/Web API/Streams/Events/GetEvents" title="Streams.GetEvents">
    <page:p>Получить список событий за определнный период. Данный метод возвращает только информацию о событии. Данные события не возвращаются</page:p>
    <api:method>
        <method:request type="GET" route="/streams/{stream-uid}/events/"/>
        <method:param name="stream-uid" type="uid" desc="Уникальный идентификтор потока {@hint:uid}"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>

        <method:body type="json" desc="Объект с информацией о интервале получения событий">
            {
                "from": 1639492695,
                "to": 1639592695
            }
            <method:bodyparam name = "from" type="timestamp" desc="Начало интервала периода получения событий. Обзательный параметр " required='true' />
            <method:bodyparam name = "to" type="timestamp" desc="Окончание интервала. Параметр не является обязательным. Если не указан то будут получены события до настоящего времени"/>
        </method:body>
        <method:return code="200" type="json" desc="Возвращает JSON массив со списком событий">
            [
                {
                    "event": "motion-detect",
                    "type": "start | stop | checkpoint",
                    "timestamp": 19231231,
                    "dts": 23132323
                }
            ]
            <method:returnparam name = "event" type="string" desc="Название события." required='true' />
            <method:returnparam name = "type" type="enum" desc="Тип события">
                <page:list>
                    start - тип извещающий о начале события
                    stop - окончание события. (Порядок и типы не рагламентируются. Остаются на усмотрение потребителя и поставщика события)
                    checkpoint - контрольная точка ( можно интерпритировать как одновременный start\stop)
                </page:list>
            </method:returnparam>
            <method:returnparam name = "timestamp" type="timestamp" desc="Время наступления события." required='true' />
            <method:returnparam name = "dts" type="int" desc="Параметр привязки события к конкретному кадру видеопотока" required='false' />
        </method:return>
        <method:return code="404" desc="Поток с таким UID не найден"/>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>