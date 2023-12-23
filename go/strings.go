package main

import (
	"fmt"
	"unicode/utf8"
)

func main() {
	test_string()
}

func test_string() {
	s := "Hi 😊"

	fmt.Println("Lenght", utf8.RuneCountInString(s)) // 4

	// перебор rune которые являются алиасом int32
	for i, c := range s {
		fmt.Printf("Position %d of '%s' \n", i, string(c))
	}
	
	// Position 0 of 'H' 
	// Position 1 of 'i' 
	// Position 2 of ' ' 
	// Position 3 of '😊'
}
