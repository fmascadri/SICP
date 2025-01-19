#lang racket

(require racket/trace)

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))

(trace count-leaves)

(define list1 (cons (list 1 2) (list 3 4)))