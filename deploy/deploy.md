
## Paths

#### Path to service file

```
sudo vim /etc/systemd/system/some-service-name.service
```

#### Path to **nginx** config

```
sudo vim /etc/nginx/sites-available/some-project
```

## Manade services

##### List services

```
systemctl list-units --type=service --all
```

##### Reload the systemctl daemon so that it can acknowledge the services which we made.

```
systemctl daemon-reload
```

##### Enable the service

```
systemctl enable some-service-name.service
```

##### Start service

```
systemctl start some-service-name.service
```

##### Restart service

```
systemctl restart some-service-name.service
```
or
```
service some-service-name restart
```


## Status

#### Status service

```
systemctl status some-service-name.service
```
or
```
service some-service-name status
```

#### View log service

```
journalctl -u some-service-name.service
```

#### Test socket

```
curl --unix-socket /run/gunicorn.sock localhost
```

List All Services 

```
service  --status-all
```


Symbolic link

```
sudo ln -s /etc/nginx/sites-available/myproject /etc/nginx/sites-enabled
```

## Run

Run Celery 

```
# where collector.celery: collector - file with celery instance
celery -A collector.celery worker --loglevel=info -f logs/celery.log
```

Run flower to monitoring Celery tasks

```
flower --broker=redis://redis:6379/0 --port=5555
```

##### List ssh keys

```
ll ~/.ssh/id_*.pub
```

##### View ssh keys
```
cat ~/.ssh/id_rsa.pub
```
