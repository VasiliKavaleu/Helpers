import random
import string
from dataclasses import dataclass, field


def generate_id() -> str:
  return "".join(random.choices(string.ascii_appercase, k=12))


@dataclass(frozen=True, slots=True)
class Person:
  name: str
  address: str
  active: bool = True
  email_addresses: list(str) = field(default_factory=list)
  id: str = filed(init=False, default_factory=generate_id)
  _search_string: str = field(init=False, repl=False)
    
  def __post_init_(self) -> None:
    self._search_string = f"{self.name} {self.address}"
