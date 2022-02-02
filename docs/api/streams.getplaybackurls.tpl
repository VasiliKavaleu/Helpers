<doc:page:ru toc="Aipix/Media server/Web API/Streams/GetPlaybackUrls" title="Streams.GetPlaybackUrls">
    <page:p>
        Возвращает список URL для воспроизведения потока в различных форматах {@see:'Aipix/Media server/Потоки видеокамер/Воспроизведение потока'}. В зависимости от того какие параметры воспроизведения потока и протоколы установлены, может сожержать либо все URL либо часть.
    </page:p>
    <api:method>
        <method:request type="GET" route="/streams/{stream-uid}/urls/"/>
        <method:param name="stream-uid" type="uid" desc="Уникальный идентификтор потока {@hint:uid}"/>
        <method:arg name="token" required="false" type="string" desc="Токен авторизации API запросов. {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:return code="200" type="json" desc="Возвращает JSON объект с URL воспроизвдения. URL так же содержит токен на 1 час для потоков с типом авторизации private или логином праоллем для protected">
            {
                "rtsp_live": "rtsp://admin:admin@localhost:5554/live/192-168-7-36-101/",
                "rtsp_dvr": "rtsp://admin:admin@localhost:5554/dvr/192-168-7-36-101/?timestamp=0",
                "hls_live": "http://admin:admin@localhost:8080/live/192-168-7-36-101/playlist.m3u8/"
                "hls_dvr": "http://admin:admin@localhost:8080/dvr/192-168-7-36-101/playlist.m3u8?timestamp=0",
                "export_mp4": "http://admin:admin@localhost:8080/dvr/192-168-7-36-101/record.mp4?timestamp=0&duration=3600",
                "export_tar": "http://admin:admin@localhost:8080/dvr/192-168-7-36-101/archive.tar?timestamp=0&duration=3600",
                "preview": "http://admin:admin@localhost:8080/live/192-168-7-36-101/preview.mp4",
                "screenshot": "http://admin:admin@localhost:8080/dvr/192-168-7-36-101/screenshot.mp4?timestamp=0",
            }
            <method:returnparam code="200" name = "rtsp_live" type="url" desc="URL воспроизведения live потока по RTSP протоколу"/>
            <method:returnparam code="200" name = "rtsp_dvr" type="url" desc="URL воспроизведения dvr потока по RTSP протоколу. В последующем запросе небоходимо указать timestamp начала воспроизведения"/>
            <method:returnparam code="200" name = "hls_live" type="url" desc="URL воспроизведения live потока по HLS"/>
            <method:returnparam code="200" name = "hls_dvr" type="url" desc="URL воспроизведения dvr потока по HLS. В последующем запросе небоходимо указать timestamp начала воспроизведения"/>
            <method:returnparam code="200" name = "export_mp4" type="url" desc="URL для запроса экспорта DVR архива в MP4 файл"/>
            <method:returnparam code="200" name = "export_mp4" type="url" desc="URL для запроса экспорта DVR архива в TAR файл (позволяет экспортировать полность весь архив)"/>
            <method:returnparam code="200" name = "preview" type="url" desc="URL для запроса послендного кадра Live ( preview потока ). Кадр отдается в формате MP4"/>
            <method:returnparam code="200" name = "screenshot" type="url" desc="URL для запроса произвольного кадра DVR архива. Кадр отдается в формате MP4"/>
        </method:return>
        <method:return code="404" desc="Поток с таким UID не найден"/>
        <method:return code="403" desc="Ошибка авторизации. Неверный или отсутствует токен доступа к API {@see:Aipix/Media server/Web API/Authorization/CreateApiToken}"/>
        <method:example host="https://localhost:8080"/>
    </api:method>
</doc:page:ru>