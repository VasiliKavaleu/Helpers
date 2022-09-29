

##### **To build .exe for Windows run command (only on Win OS)**

```
poetry run pyinstaller --onefile --runtime-tmpdir=. --add-data 'algorithms\ocr_data;algorithms\ocr_data' istar_analyzer.py
```

##### **To build for Linux run command (only on Linux OS)**

```
poetry run pyinstaller --onefile --add-data algorithms/ocr_data:algorithms/ocr_data --runtime-tmpdir=. istar_analyzer.py
```

Where:

  - the fisrt part of argument `--add-data` - `algorithms/ocr_data` - external data which must be included into binary file
 
  - the second `algorithms/ocr_data` wich folder should contain data inside binary
 
  - `--runtime-tmpdir=.` - temporary dir with data, it lives during binary executes 

The executable file is in the folder `dist`

For accessing external resources (which specified with `--add-data`) in python code you should use a helper:

```
import os
import sys


def get_resource_path(relative_path):
    """ Get absolute path to resource, works for dev and for PyInstaller 
    sys._MEIPASS includes temporary data only while binary executes
    """
    try:
        # PyInstaller creates a temp folder and stores path in _MEIPASS
        base_path = sys._MEIPASS
    except Exception:
        base_path = os.path.abspath(".")
    return os.path.join(base_path, relative_path)
```
