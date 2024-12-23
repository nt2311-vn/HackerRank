package main

import (
	"fmt"
	"math"
)

func miniMaxSum(arr []int64) {
	total := int64(0)

	for _, num := range arr {
		total += int64(num)
	}

	list := []int64{}

	for _, num := range arr {
		list = append(list, total-int64(num))
	}

	min, max := int64(math.MaxInt64), int64(0)

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
	miniMaxSum([]int64{793810624, 895642170, 685903712, 623789054, 468592370})
}
