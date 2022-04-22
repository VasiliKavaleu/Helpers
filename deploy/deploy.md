
Create service file

`sudo vim /etc/systemd/system/celery.service`

Reload the systemctl daemon so that it can acknowledge the services which we made.

`systemctl daemon-reload`

Enable the service

`systemctl enable celery.service`

Start service

`systemctl start celery.service`

Restart service

`systemctl restart celery.service`

Status service

`systemctl status celery.service`

List All Services 

`service  --status-all`

Path to **nginx** config

`sudo vim /etc/nginx/sites-available/myproject`

Symbolic link

`sudo ln -s /etc/nginx/sites-available/myproject /etc/nginx/sites-enabled`

Run Celery 

```
# where collector.celery: collector - file with celery instance
celery -A collector.celery worker --loglevel=info -f logs/celery.log
```

Run flower to monitoring Celery tasks

`flower --broker=redis://redis:6379/0 --port=5555`
