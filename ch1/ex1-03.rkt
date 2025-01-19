#lang sicp

(define (square x) (* x x))

(define (sum-of-squares x y) (+ (square x) (square y)))

(define (>= x y)
  (or (> x y) (= x y)))

(define (sum-of-squares-two-largest a b c)
  (cond ((and (>= a b) (>= b c)) (sum-of-squares a b))
        ((and (>= b a) (>= c a)) (sum-of-squares b c))
        (else (sum-of-squares a c)))      
  )