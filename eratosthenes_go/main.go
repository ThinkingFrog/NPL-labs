package main

import "fmt"

func eratosthenesSieve(stop int) []int {
	grid := make([]int, 0, stop-1)

	for idx := 2; idx <= stop; idx++ {
		grid = append(grid, idx)
	}

	for primIdx := 0; primIdx < len(grid); primIdx++ {
		step := grid[primIdx]

		if step == 0 {
			continue
		}

		for secIdx := primIdx + step; secIdx < len(grid); secIdx += step {
			grid[secIdx] = 0
		}
	}

	filteredGrid := make([]int, 0, len(grid))
	for _, val := range grid {
		if val != 0 {
			filteredGrid = append(filteredGrid, val)
		}
	}

	return filteredGrid
}

func main() {
	stop := 100
	primes := eratosthenesSieve(stop)

	fmt.Printf("Prime numbers up to %d: %v\n", stop, primes)
}
