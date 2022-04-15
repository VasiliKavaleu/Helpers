
### Database migrations written in Go. Use as CLI or import as library. [migrate](https://github.com/golang-migrate/migrate)

##### For CLI

`curl -s https://packagecloud.io/install/repositories/golang-migrate/migrate/script.deb.sh | sudo bash`
`sudo apt-get update`
`sudo apt-get install -y migrate`

Create two empty files if migration (up/down)
`migrate create -ext sql -dir db/migration -seq init_schema`

Run migration
`migrate --path <path_to_migration_files> --database "<db_driver>://<user>:<password>@localhost:<port>/<name_db>?sslmode=disable" --verbose up`
