package main

import "fmt"

func eratosthenesSieve(stop int) []int {
	divisors := make([]int, stop+1)
	primes := make([]int, 0)

	for i := 2; i <= stop; i++ {
		if divisors[i] == 0 {
			divisors[i] = i
			primes = append(primes, i)
		}

		for j := 0; j < len(primes) && primes[j] <= divisors[i] && i*primes[j] <= stop; j++ {
			divisors[i*primes[j]] = primes[j]
		}
	}

	return primes
}

func main() {
	stop := 100
	primes := eratosthenesSieve(stop)

	fmt.Printf("Prime numbers up to %d: %v\n", stop, primes)
}
