
Install 
```
sudo apt-get install vsftpd
```

Open config
```
vim /etc/vsftpd.conf
```

And add:

- `allow_writeable_chroot=YES` (allows orginize permissions for user which will be specified in list bellow)

- `listen=YES` (ftp server listen incomming connections)

- `write_enable=YES` (allows to write files on the server)

- `chroot_list_enable=YES` (enables list access)

- `chroot_list_file=/etc/vsftpd.chroot_list` (add path to list with users)

Open users access list (and add user name, ex. `ftpclient`)
```
vim /etc/vsftpd.chroot_list
```

Restart FTP service
```
service vsftpd restart
```

Connect to FTP server
```
ftp [IP]
```
