#lang racket

(require racket/trace)

(define (* a b)
  (mult-iter a b 0))

(define (mult-iter a b c)
  (cond ((or (= a 0) (= b 0))
         c)
        ((even? b)
         (mult-iter (double a) (halve b) c))
        (else
         (mult-iter a (- b 1) (+ c a)))))

(define (double a) (+ a a))

(define (halve a) (/ a 2))

(define (even? n)
  (= (remainder n 2) 0))

(trace mult-iter)