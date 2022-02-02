<doc:page:ru toc="Aipix/Media server/Web API/Tools/CalcBitrate" title="Tools.CalcBitrate">
    <page:p>Расчитывает приблизительные параметры битрейта и размера хранения DVR в зависимости от указанных значений калькулятора {@see:Aipix/Media server/Утилиты/Расчет битрейта}</page:p>
    <api:method>
        <method:request type="POST" route="/api/tools/calc/"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:return code="200" type="json" desc="Возвращает JSON объект с расчитанными значениям">
        {
            "frame": 14311,
            "bandwidth": 2948066,
            "storage": 955173384000
        }
        <method:returnparam code="200" name = "frame" type="bytes" desc="Средний размер одного сжатого кадра."/>
        <method:returnparam code="200" name = "bandwidth" type="bps" desc="Утилизируемое значение полосы пропускания канала"/>
        <method:returnparam code="200" name = "storage" type="bytes" desc="Расчетное значение места занимаемого DVR при его хранении"/>
        </method:return>
        <method:body type="json" desc="Объект определяющий значений параметров для расчета">
            {"resolution": "1920x1080","codec": "H.265","quality": "good","complexity": "average","movement": "average","fps": 25,"hours": 24,"days": 30,"audio": true}
            <method:bodyparam name = "resolution" type="string" desc="Разрешение кадра видеопотока в формате `Ширина`x`Высота`.\nВозможно указание произвольной высоты и ширины кадра."/>
            <method:bodyparam name = "codec" type="enum" desc="Один из поддерживаемых калькулятором кодеков. (см. параметр codecs в методе CalcParams)"/>
            <method:bodyparam name = "quality" type="enum" desc="Одно из возможных значений качества сжатия. (см. параметр quality в методе CalcParams)"/>
            <method:bodyparam name = "complexity" type="enum" desc="Одно из возможных значений сложности сцены. (см. параметр complexity в методе CalcParams)"/>
            <method:bodyparam name = "quality" type="enum" desc="Одно из возможных значений качества динамичности сцены. (см. параметр quality в методе CalcParams)"/>
            <method:bodyparam name = "fps" type="int" desc="Количество кадров в секунду видеопотока"/>
            <method:bodyparam name = "hours" type="int" desc="Количество часов ежедневной записи (хранения) DVR. Необязательный параметр"/>
            <method:bodyparam name = "days" type="int" desc="Количество дней хранения DVR. Необязательный параметр"/>
            <method:bodyparam name = "audio" type="bool" desc="Наличие аудиоканала"/>
        </method:body>
        <method:return code="400" desc="Некорректный запрос. Тело или значения переданные в запросе неверны."/>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>