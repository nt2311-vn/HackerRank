package main

import "fmt"

func plusMinus(arr []int32) {
	pos, neg, zero := 0, 0, 0
	total := float64(len(arr))

	for _, num := range arr {
		if num == 0 {
			zero++
		} else if num > 0 {
			pos++
		} else {
			neg++
		}
	}

	fmt.Printf("%.6f\n", float64(pos)/total)
	fmt.Printf("%.6f\n", float64(neg)/total)
	fmt.Printf("%.6f\n", float64(zero)/total)
}

func main() {
	plusMinus([]int32{-4, 3, -9, 0, 4, 1})
}
