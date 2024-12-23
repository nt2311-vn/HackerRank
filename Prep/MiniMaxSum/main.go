package main

import (
	"fmt"
	"math"
)

func miniMaxSum(arr []int32) {
	total := int32(0)

	for _, num := range arr {
		total += num
	}

	list := []int32{}

	for _, num := range arr {
		list = append(list, total-num)
	}

	min, max := int32(math.MaxInt32), int32(0)

	for _, num := range list {
		if num < min {
			min = num
		}

		if num > max {
			max = num
		}
	}

	fmt.Printf("%d %d\n", min, max)
}

func main() {
}
