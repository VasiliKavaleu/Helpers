
### Collection

|  |  | |
| --- | --- | --- |
| ChainMap | .maps, .new_child() |
| Counter | .elements(), .most_common ()|
| defaultdict ||
| deque | remove(), len(), .extend(), .append(), .extendleft(), .appendleft(), .pop(), .popleft(), .rotate() | Двухсторонняя очередь (потокобезопасна) |
| namedtuple | . _fields, ._asdict(), ._replace() | |
| OrderedDict | .move_to_end(), .popitem() |

### queue 
Модуль queue предоставляет структуру данных c дисциплиной обслуживания FIFO (first in, first out — “первым пришел — первым ушел”), пригодную для многопоточного программирования. Ее можно использовать для безопасного обмена данными между потоками-производителями и потоками-потребителями. 
Для вызывающего кода предусмотрена обработка блокировок, поэтому c одним экземпляром Queue может безопасно работать несколько потоков. Размер экземпляра Queue (количество содержащихся в нем элементов) можно ограничивать.

```python
import queue

q = queue.Queue()       # FIFO, .put(), .get(), .empty()
q2 = queue.LifoQueue()  # LIFO, .put(), .get(), .empty()
q3 =queue.PriorityQueue()

```
