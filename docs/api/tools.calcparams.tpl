<doc:page:ru toc="Aipix/Media server/Web API/Tools/CalcParams" title="Tools.CalcParams">
    <page:p>Позволяет получить информацию о утилите расчета битрейт и размере хранения DVR {@see:Aipix/Media server/Утилиты/Расчет битрейта}</page:p>
    <api:method>
        <method:request type="GET" route="/api/tools/calc/"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:return code="200" type="json" desc="Возвращает JSON объект с параметрами калькулятора и их возможными значениями">
        {
            "codecs": ["H.264","H.265","MPEG4","MJPEG","RAW"],
            "quality": [["high","High"],["..."]],
            "resolutions": [["352x240","352x240 (CIF NTSC)"],["..."]],
            "complexity": [["low","Low (33%)"],["..."]],
            "movement": [["very_low","Very Low (15%)"],["..."]]
        }
        <method:returnparam code="200" name = "codecs" type="array" desc="Типы видеокодеков поддерживаемые калькулятором для расчета"/>
        <method:returnparam code="200" name = "quality" type="array" desc="Параметр определяет качество сжатия видеопотока кодеком"/>
        <method:returnparam code="200" name = "resolutions" type="array" desc="Возможные разрешения видопотока. При расчете можно указать любой размер."/>
        <method:returnparam code="200" name = "complexity" type="array" desc="Параметр сложности сцены видиопотока"/>
        <method:returnparam code="200" name = "movement" type="array" desc="Параметр определяет динамичность сцены видеопотока"/>
        </method:return>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>