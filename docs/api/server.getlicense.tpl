<doc:page:ru toc="Aipix/Media server/Web API/Server/GetLicense" title="Server.GetLicense">
    <page:p>Получить информацию и сведения о лицензии медиасервера</page:p>
    <api:method>
        <method:request type="GET" route="/api/server/license/"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:return code="200" type="json" desc="Возвращает JSON объект со сведениями и ограничениями лицензии {@see:Aipix/Media server/Лицензирование/Обзор}">
        {
            "expireDate": 0,
            "supportTo": 1648220453,
            "for": "NavekSoft",
            "type": "Service Provider",
            "serial": "03-83-029334",
            "issueDate": 1630940453,
            "updateTo": 1646492453,
            "limitations": {
                "storage": 0,
                "time": false,
                "controller": false,
                "bitrate": 0,
                "api": false,
                "cluster": false,
                "streams": 0,
                "cpanel": false,
                "cpu": 0
            }
        }
        <method:returnparam code="200" name = "expireDate" type="timestamp" desc="Дата истечения лицензии. Если 0, то срок действия лицензии не ограничен"/>
        <method:returnparam code="200" name = "supportTo" type="timestamp" desc="Дата истечения срока поддержки данной версии ПО"/>
        <method:returnparam code="200" name = "updateTo" type="timestamp" desc="Дата истечения срока обновлений данной версии ПО."/>
        <method:returnparam code="200" name = "issueDate" type="timestamp" desc="Дата выдачи лицензии"/>
        <method:returnparam code="200" name = "for" type="string" desc="Кому выдана лицензия"/>
        <method:returnparam code="200" name = "type" type="string" desc="Тип лицензии"/>
        <method:returnparam code="200" name = "serial" type="string" desc="Серийный номер лицензии"/>
        <method:returnparam code="200" name = "limitations.storage" type="bytes" desc="Ограничение накладываемое лицензией на размер хранения DVR. 0 - без ограничений"/>
        <method:returnparam code="200" name = "limitations.time" type="array" desc="Ограничение на ежедневные часы работы ПО {@see:Aipix/Media server/Лицензирование/Ограничения}. false - без ограничений "/>
        <method:returnparam code="200" name = "limitations.controller" type="bool" desc="Доступна возможность настраивать контроллер"/>
        <method:returnparam code="200" name = "limitations.bitrate" type="bps" desc="Ограничение накладываемое лицензией на суммарный битрейт захвата всех потоков (первичных и вторичных)"/>
        <method:returnparam code="200" name = "limitations.api" type="bool" desc="Доступна возможность вызова Web API"/>
        <method:returnparam code="200" name = "limitations.cpanel" type="bool" desc="Доступна возможность включения технологической панели и ее кастомизация"/>
        <method:returnparam code="200" name = "limitations.cluster" type="bool" desc="Доступна функция кластера"/>
        <method:returnparam code="200" name = "limitations.streams" type="int" desc="Ограничение на общее количество потоков обслуживаемых сервером"/>
        <method:returnparam code="200" name = "limitations.cpu" type="int" desc="Ограничение на колчество ядер CPU используемых медиасервером"/>
        </method:return>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>