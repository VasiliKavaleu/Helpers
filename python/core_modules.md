```python
from itertools import (product, permutations, combinations, 
                      combinations_with_replacement, groupby, 
                      count, cycle, repeat)
import operator
```
```python
a = [1, 2]
b = [3, 4]

pr = product(a b)

print(list(pr))
# [(1, 3), (1, 4), (2, 3), (2, 4)]
```

```python
b = [1, 2, 3]
perm = permutations(b) # permutations(b, 2)

print(list(perm))
# [(1, 2, 3), (1, 3, 2), (2, 1, 3), (2, 3, 1), (3, 1, 2), (3, 2, 1)]
```
```python
c = [1, 2, 3]

comb = combinations(c, 2)

print(list(comb))
# [(1, 2), (1, 3), (2, 3)]

comb_wtr = combinations_with_replacement(c, 2)

print(list(comb_wtr))

# [(1, 1), (1, 2), (1, 3), (2, 2), (2, 3), (3, 3)]
```
```python
f = [1, 2, 3, 4]


acc = accumulate(f)

print(list(acc))
# [1, 3, 6, 10]

print(list(accumulate(f, func=operator.mul))
# [1, 2, 6, 24]
```
```python
g = [1, 2, 3, 4]

def smaller_then_3(x):
    return x < 3
    
group_obj = groupby(g, key=smaller_then_3)

for k, v in group_obj:
    print(k, list(v))
    
# True [1, 2]
# False [3, 4]


def grouper(item):
    return item["age"]

persons =[
    {"name": "Ten", "age": 25},
    {"name": "Dan", "age": 28},
    {"name": "Alex", "age": 27},
    {"name": "Fred", "age": 25}
    ]

data = sorted(persons, key=grouper)
group_obj = groupby(data, key=grouper)

for k, v in group_obj:
    print(k, list(v))

#  25 [{'name': 'Ten', 'age': 25}, {'name': 'Fred', 'age': 25}]
#  27 [{'name': 'Alex', 'age': 27}]
#  28 [{'name': 'Dan', 'age': 28}]
```
```python
for i in count(10):
    print(i)
    if i == 12:
        break
        
# 10
# 11
# 12

```
```python
e = [1, 2, 3]

for c in cycle(2):
  print(c)
  
# 1
# 2
# 3
# 1
# ... infinitely
```
```python
for r in repeat(2, 4): # 4 - times to repeat
  print(r)
  
# 2
# 2
# 2
# 2
```
