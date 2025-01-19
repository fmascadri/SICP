#lang racket

(require racket/trace)

(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

(define list1 (list 1 2 3 4))
(define list2 (list 5 6 7 8))


(define (last-pair x)
  (define (next x) (cdr x))
  (if (null? (next x))
      (car x)
      (last-pair (cdr x))))

(define (reverse x)
  (if (null? x)
      '()
  (append (reverse (cdr x)) (list (car x)))))

(trace reverse)