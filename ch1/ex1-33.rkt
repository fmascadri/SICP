#lang racket

(require racket/trace)

(define (filtered-accumulate filter? combiner null-value term a next b)
  (if (filter? a)
      (if (> a b)
          null-value
          (combiner (term a)
                    (filtered-accumulate filter? combiner null-value term (next a) next b)))
      (filtered-accumulate filter? combiner null-value term (next a) next b)))
  
(trace filtered-accumulate)


(define (identity x) x)

(define (inc x) (+ x 1))

; -- Prime Exercise 1.23 --

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