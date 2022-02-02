<doc:page:ru toc="Aipix/Media server/Web API/Streams/Events/TriggerEvent" title="Streams.TriggerEvent">
    <page:p>Оповестить поток о наступившем внешнем событии. В зависиомсти от конфигурации потока, событие со всеми даными может быть сохранено и проиндексировано в DVR. {@see:Aipix/Media server/DVR/События}</page:p>
    <api:method>
        <method:request type="PUT" route="/streams/{stream-uid}/events/"/>
        <method:param name="stream-uid" type="uid" desc="Уникальный идентификтор потока {@hint:uid}"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:body type="json" desc="Объект с информацией о событии">
            {
                "event": "motion-detect",
                "type": "start | stop | checkpoint",
                "timestamp": 19231231,
                "dts": 23132323,
                "dvr_record": true,
                "dvr_period": 60,
                "data":{
                    "rect": [0,0,10,10],
                    "type": "line-crossing"
                }
            }
            <method:bodyparam name = "event" type="string" desc="Название события. Обязательный параметр." required='true' />
            <method:bodyparam name = "type" type="enum" desc="Тип наступившего события">
                <page:list>
                    start - тип извещающий о начале события
                    stop - окончание события. (Порядок и типы не рагламентируются. Остаются на усмотрение потребителя и поставщика события)
                    checkpoint - контрольная точка ( можно интерпритировать как одновременный start\stop)
                </page:list>
            </method:bodyparam>
            <method:bodyparam name = "timestamp" type="timestamp" desc="Время наступления события. Обязательный параметр." required='true' />
            <method:bodyparam name = "dts" type="int" desc="Необязательный параметр привязки события к конкретному кадру видеопотока" required='false' />
            <method:bodyparam name = "dvr_record" type="bool" desc="Определяет нужно ли записывать DVR с получением события в случаае если DVR записывается по требованию  {@see:Aipix/Media server/DVR/Запись по событиям}" required='false' />
            <method:bodyparam name = "dvr_period" type="seconds" desc="Длительность записи DVR по событию, если не прищло другое уведомление с признаком начала записи." required='false' />
            <method:bodyparam name = "data" type="any" desc="Произвольные данные которые могут быть сохранены и впоследствии полученые совместно с событием. Формат данных определяется только потребителем и поставщиком события" required='false' />
        </method:body>
        <method:return code="201" desc="Событие создано и зафиксировано"/>
        <method:return code="404" desc="Поток с таким UID не найден"/>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>