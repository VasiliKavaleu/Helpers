package main

import (
	"fmt"
)

// 0x00        | 0x01		| oxo2
// value(100)  | ptrValue(0x00) | ptrValue(0x01)

// указатель в качестве значения содержит адрес переменной ptrValue(0x00)

// int8 value = 100
// int8* ptrValue &value
// int8** ptrPtrValue = &ptrValue

type Person struct {
	name string
	age  int8
}

func main() {
	person := &Person{
		name: "Ivan",
		age:  35,
	}
	fmt.Println(person.name)
	// changePerson(&person)
	changePerson2(person)
	fmt.Println(person.name)
}

func changePerson(person **Person) {
	*person = &Person{
		name: "V",
		age:  30,
	}
}

func changePerson2(person *Person) {
	*person = Person{
		name: "V2",
		age:  30,
	}
}
