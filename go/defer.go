package main

import "fmt"

func main() {
	test_defer()
}

func test_defer() {
	var i1 = 10
	var k = 20
	var i2 = &k

	// аргументы учитываются на момент объявления defer
	defer printInt("i1", i1)                   // копируется значение переменной
	defer printInt("i2 as value", *i2)         // копируется значение переменной, разименовали и скопировали 20
	defer printIntPointer("i2 as pointer", i2) // копия указателя

	i1 = 1010
	*i2 = 2020
	// все передается по значению
	// i2 as pointer=2020
	// i2 as value=20
	// i1=10
}

func printInt(v string, i int) {
	fmt.Printf("%s=%d \n", v, i)
}

func printIntPointer(v string, i *int) {
	fmt.Printf("%s=%d \n", v, *i)
}
