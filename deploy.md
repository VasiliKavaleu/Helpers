
Create service file

`sudo vim /etc/systemd/system/celery.service`

Reload the systemctl daemon so that it can acknowledge the services which we made.

`systemctl daemon-reload`

Enable the service

`systemctl enable celery.service`

Start service

`systemctl start celery.service`

Status service

`systemctl status celery.service`

Path to **nginx** config

`sudo vim /etc/nginx/sites-available/myproject`

Symbolic link

`sudo ln -s /etc/nginx/sites-available/myproject /etc/nginx/sites-enabled`
