
### Collection

|  |  | |
| --- | --- | --- |
| ChainMap | .maps, .new_child() |
| Counter | .elements(), .most_common ()|
| defaultdict | d.default_factory, d.clear(), d.copy(), d.fromkeys(itm [initial]), d.get(k, [default]), d.items(), d.keys(), d.pop(k, [default]), d.popitem(), d.setdefault(k,[default]), d.update(m, [**kargs]), d.values()  |
| deque | remove(), len(), .extend(), .append(), .extendleft(), .appendleft(), .pop(), .popleft(), .rotate() | Двухсторонняя очередь (потокобезопасна) |
| namedtuple | . _fields, ._asdict(), ._replace() | |
| OrderedDict | .move_to_end(), .popitem() | |
| dict | d.clear(), d.copy(), d.fromkeys(itm [initial]), d.get(k, [default]), d.items(), d.keys(), d.pop(k, [default]), d.popitem(), d.setdefault(k,[default]), d.update(m, [**kargs]), d.values() | |

### queue 
Модуль queue предоставляет структуру данных c дисциплиной обслуживания FIFO (first in, first out — “первым пришел — первым ушел”), пригодную для многопоточного программирования. Ее можно использовать для безопасного обмена данными между потоками-производителями и потоками-потребителями. 
Для вызывающего кода предусмотрена обработка блокировок, поэтому c одним экземпляром Queue может безопасно работать несколько потоков. Размер экземпляра Queue (количество содержащихся в нем элементов) можно ограничивать.

```python
import queue

q = queue.Queue()       # FIFO, .put(), .get(), .empty()
q2 = queue.LifoQueue()  # LIFO, .put(), .get(), .empty()
q3 =queue.PriorityQueue()

"""
В отличие от collections.deque, в случае переполнения элементы не удаляются из очереди, 
чтобы освободить место, а блокируется вставка новых элементов, 
т. е. программа ждет, пока какой-нибудь другой поток удалит элемент из очереди. 
Это полезно для ограничения общего числа работающих потоков.
"""

```
