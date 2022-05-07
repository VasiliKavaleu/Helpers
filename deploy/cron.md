### Cron Usage

List all tasks of current user

```
crontab -l
```

Add tasks to cron config

```
crontab -e
```

List cron logs

```
cat /var/log/syslog | grep CRON
```

### Example 

Add exec file for task

```
sudo vim /usr/local/bin/script.sh
```

Which containing:

```
#!/bin/bash
echo $(date) >> /var/log/testcron.log
```

Make script executable

```
sudo chmod ugo+x /usr/local/bin/script.sh
```

Add task in cron by adding in cron config:

```
* * * * * /usr/local/bin/script.sh
```

[Helper for combination tasks date](https://crontab.guru/)
