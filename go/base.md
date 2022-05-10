

List files whose formatting differs from gofmt's

```
gofmt -l .
```

Format go files

```
gofmt -s -w .
```

Adds any missing module requirements necessary to build the current module’s packages and dependencies

```
go mod tidy -v
```
