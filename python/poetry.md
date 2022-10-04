Install the defined dependencies

```
poerty install
```

Initialize proj

```
poetry init
```

Info about poetry virtualenv

```
poetry env info
```

Show poetry dependency tree

```
poetry show --tree
```

Add new lib (with --dev (-D) install for dev)

```
poetry add <package-name>
``` 

Remove lib

```
poetry remove <package-name>
```

Run 

```
poetry run python <main.py>
```

The contents of project’s.lock file should be exported to requirements.txt.

```
poetry export -f requirements.txt > requirements.txt
```
or
```
poetry export -f requirements.txt —output reqtest.txt —without-hashes
```

Import requirements.txt (project libraries) inside poetry

```
poetry add $( cat requirements.txt )
```
