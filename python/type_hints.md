### Аннотирование чисто позиционных и вариадических
параметров

```python
from typing import Optional

def tag(
  name: str,
  /,
  *content: str,
  class_: Optional[str] = None,
  **attrs: str,
  ) -> str:
 ...
```
`*content: str` == `tuple[str, ...]`

`**attrs: str` == `dict[str, str]`

`вид **attrs: float,` == `dict[str, float]`

---

### tuple

Существует три способа аннотировать тип кортежа:

  - кортежи как записи `tuple[str, float, str]`;
  - кортежи как записи с именованными полями;
 ```python
from typing import NamedTuple
from geolib import geohash as gh # type: ignore

PRECISION = 9

class Coordinate(NamedTuple):
  lat: float
  lon: float

def geohash(lat_lon: Coordinate) -> str:
  return gh.encode(*lat_lon, PRECISION)
  ```
 
  - кортежи как неизменяемые последовательности `tuple[int, ...]`.
 
 Именованные кортежи — такие же кортежи, как и обычные tuple, но каждый элемент кортежа имеет имя, по которому мы можем к нему обращаться.
 В Python есть именованные кортежи в составе пакета collections и в составе typing.
 Для указания полям кортежа типы - из typing.

### list

Обобщенная версия **list**. Полезна для аннотирования типов возвращаемых значений. Для аннотирования аргументов лучше использовать абстрактные типы коллекций, например **Sequence** или **Iterable**.

В **Sequence** можно обращаться к элементам по индексу.
**Iterable** подразумевает возможность итерироваться по контейнеру,

### dict

В общем случае в аннотациях типов параметров лучше использовать **abc.Mapping** (подойдут под это dict, defaultdict, ChainMap) или **abc.MutableMapping**, а не **dict**(или typing.Dict в унаследованном коде).
Тогда вызывающей стороне не нужно будет предоставлять объект, реализующий методы setdefault, pop и update, которые являются частью интерфейса MutableMapping, но не Mapping.

Словарь с Literal ключами:

`dict[Literal["longitude"] | Literal["latitude"], float]`

`dict[Literal["longitude", "latitude"], float]`

### yield

```python
from collections.abc import Iterator

RE_WORD = re.compile(r'\w+')


def tokenize(text: str) -> Iterator[str]:
  for match in RE_WORD.finditer(text):
    yield match.group().upper()
```

---

### Iterable

```python
from collections.abc import Iterable

FromTo = tuple[str, str]  

def zip_replace(text: str, changes: Iterable[FromTo]) -> str:
  # changes должен иметь тип Iterable[FromTo]; этото же самое,что Iterable[tuple[str,str]], но короче и легче воспринимается.

  for from_, to in changes:
    text = text.replace(from_, to)
    return text
```

Python 3.10 рекомендовано создавать алиасы:

```python
from typing import TypeAlias

FromTo: TypeAlias = tuple[str, str]
```

### TypeVar

```python
from collections.abc import Sequence
from random import shuffle
from typing import TypeVar

T = TypeVar('T')

def sample(population: Sequence[T], size: int) -> list[T]:
  if size < 1:
    raise ValueError('size must be >= 1')
  result = list(population)
  shuffle(result)
  return result[:size]
```

- если при вызове функции передается кортеж типа tuple[int, ...], который совместим с Sequence[int], то параметр-тип равен int, т. е. возвращаемое значение будет иметь тип list[int];
- если при вызове функции передается строка str, которая совместима с Sequence[str], то параметр-тип равен str, т. е. возвращаемое значение будет иметь тип list[str].

Тип TypeVar принимает дополнительные позиционные аргументы, ограничивающие параметр-тип.
```python
from collections.abc import Iterable
from decimal import Decimal
from fractions import Fraction
from typing import TypeVar

NumberT = TypeVar('NumberT', float, Decimal, Fraction)

def mode(data: Iterable[NumberT]) -> NumberT:
  ...
```

##### Связанный TypeVar

`bound` - необязательный именованный параметр. Он задает верхнюю границу допустимых типов.
Если имеем bound=Hashable, это означает, что параметр-тип может быть Hashable или любым его подтипом.

```python
from collections.abc import Hashable
from typing import TypeVar

HashableT = TypeVar('HashableT', bound=Hashable)
```

### Protocol
В теле протокола имеется одно или несколько определений методов, содержащих вместо тела многоточие ....
Тип *T* совместим с протоколом *P*, если *T* реализует все методы, определенные в *P* с такими же сигнатурами.

```python
from typing import Protocol, Any

class SupportsLessThan(Protocol):
  def __lt__(self, other: Any) -> bool: ...

LT = TypeVar('LT', bound=SupportsLessThan)

def top(series: Iterable[LT], length: int) -> list[LT]:
  ordered = sorted(series, reverse=True)
  return ordered[:length]
```

Главное преимущество типа протокола перед ABC – то, что для совместимости с типом протокола не нужно никакого специального объявления. 
Это позволяет создавать протоколы с использованием уже существующих типов или типов, реализованных в коде, который мы не контролируем.

### Callable
Для аннотирования параметров обратного вызова или вызываемыех объектов.


```
Callable[[ParamType1, ParamType2], ReturnType]
```

### NoReturn

Этот специальный тип используется только для аннотирования типов возвращаемых значений функций, которые вообще не возвращают управления.
Обычно они существуют, чтобы возбуждать исключение.

### TypedDict

```python
from typing import TypedDict

class Coordinates(TypedDict):
  longitude: float
  latitude: float
  
c = Coordinates(longitude=10, latitude=20)
```


# Enum

```python
from enum import Enum

class WeatherType(Enum):
  THUNDERSTORM = "Гроза"
  DRIZZLE = "Изморось"
  CLEAR = "Ясно"

print(WeatherType.CLEAR)        # WeatherType.CLEAR
print(WeatherType.CLEAR.value)  # Ясно
print(WeatherType.CLEAR.name)   # CLEAR
```
