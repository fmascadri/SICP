#lang racket

(require racket/trace)

(define list1 (list (list 1 2) (list 3 4)))

(define (fringe x)
  (cond ((null? x) '())
        ((not (pair? x)) (list x))
        (else (append (fringe (car x)) (fringe (cdr x))))))

(trace fringe)
  
  