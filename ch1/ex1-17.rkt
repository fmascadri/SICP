#lang racket

(require racket/trace)

(define (* a b)
  (mult a b))

(define (mult a b)
  (cond ((or (= a 0) (= b 0))
         0)
        ((even? b)
         (mult (double a) (halve b)))
        (else
         (+ a (mult a (- b 1))))))

(define (double a) (+ a a))

(define (halve a) (/ a 2))

(define (even? n)
  (= (remainder n 2) 0))

(trace mult)
        