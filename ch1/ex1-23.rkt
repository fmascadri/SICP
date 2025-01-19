#lang sicp

(define (search-for-primes start-range end-range)
  (if (even? start-range)
      (search-for-primes (+ 1 start-range) end-range)
      (cond ((> start-range end-range)
             (newline)
             (display "End test."))
            (else (timed-prime-test start-range)
                  (search-for-primes (+ 2 start-range) end-range))))) 

(define (next-odd n)
  (if (even? n) (+ n 1)
      (+ n 2)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

(define (next test-divisor)
  (if (= test-divisor 2) (+ test-divisor 1)
      (+ test-divisor 2)))

(define (divides? a b)
  (= (remainder b a) 0))

(define (square x) (* x x))

(define (even? x)
  (= (remainder x 2) 0))


