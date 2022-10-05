## Функционально-ориентированная стратегия

```python
from collections.abc import Sequence
from dataclasses import dataclass
from decimal import Decimal
from typing import Optional, Callable, NamedTuple


class Customer(NamedTuple):
  name: str
  fidelity: int
    
    
class LineItem(NamedTuple):
  product: str
  quantity: int
  price: Decimal
    
  def total(self):
    return self.price * self.quantity
  
  
@dataclass(frozen=True)
class Order: # контекст
  customer: Customer
  cart: Sequence[LineItem]
  promotion: Optional[Callable[['Order'], Decimal]] = None
      
  def total(self) -> Decimal:
    totals = (item.total() for item in self.cart)
    return sum(totals, start=Decimal(0))
  
  def due(self) -> Decimal:
    if self.promotion is None:
      discount = Decimal(0)
    else:
      discount = self.promotion(self)
    return self.total() - discount
 
  def __repr__(self):
    return f'<Order total: {self.total():.2f} due: {self.due():.2f}>'

  

def fidelity_promo(order: Order) -> Decimal:
  """5%-ная скидка для заказчиков, имеющих не менее 1000 баллов лояльности"""
  if order.customer.fidelity >= 1000:
    return order.total() * Decimal('0.05')
  return Decimal(0)


def bulk_item_promo(order: Order) -> Decimal:
  """10%-ная скидка для каждой позиции LineItem, в которой заказано
  не менее 20 единиц"""
  discount = Decimal(0)
  for item in order.cart:
    if item.quantity >= 20:
      discount += item.total() * Decimal('0.1')
  return discount


def large_order_promo(order: Order) -> Decimal:
  """7%-ная скидка для заказов, включающих не менее 10 различных позиций"""
  distinct_items = {item.product for item in order.cart}
  if len(distinct_items) >= 10:
    return order.total() * Decimal('0.07')
  return Decimal(0)
```
---

## Выбор наилучшей стратегии 

```python
promos = [fidelity_promo, bulk_item_promo, large_order_promo]

def best_promo(order: Order) -> Decimal:
  """Вычислить наибольшую скидку"""
  return max(promo(order) for promo in promos)
```

#### **Поиск стратегий**

##### Поиск в текущем модуле

```python
from decimal import Decimal
from strategy import Order
from strategy import (
  fidelity_promo, bulk_item_promo, large_order_promo
)

promos = [promo for name, promo in globals().items()
                    if name.endswith('_promo') and
                    name != 'best_promo'
         ]
```

##### Поиск стратегий в модуле promotions

```python
from decimal import Decimal
import inspect
from strategy import Order
import promotions

promos = [func for _, func in inspect.getmembers(promotions, inspect.isfunction)]
```

#### **Паттерн Стратегия, дополненный декоратором**

```python
Promotion = Callable[[Order], Decimal]

promos: list[Promotion] = []

def promotion(promo: Promotion) -> Promotion:
  promos.append(promo)
  return promo

def best_promo(order: Order) -> Decimal:
  """Вычислить наибольшую скидку"""
  return max(promo(order) for promo in promos)

@promotion
def fidelity(order: Order) -> Decimal:
  """5%-ная скидка для заказчиков, имеющих не менее 1000 баллов лояльности"""
  if order.customer.fidelity >= 1000:
    return order.total() * Decimal('0.05')
  return Decimal(0)
```
