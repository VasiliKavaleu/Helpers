
##### Install on Ubuntu
`sudo snap install sqlc`

Create sqlc.yaml file for configuration of sqlc in current dir

`sqlc init` 

Structure of sqlc.yaml:

```
version: "1"
packages:
  - name: "db"
    path: "./db/sqlc"
    queries: "./db/query/" 
    schema: "./db/migration/"
    engine: "postgresql"
    emit_json_tags: true
    emit_prepared_queries: false
    emit_interface: true
    emit_exact_table_names: false
    emit_empty_slices: true
```

Where: 
 - `emit_json_tags` if true generate json tags in struct
 - `queries` from this folder will be generated go func for entities


Generate Go files (models.go, db.go, account.sql.go)

`sqlc generate`

- models.go - describe models in DB
- account.sql.go - Go code for working with DB (based on info from config `queries` folder)
