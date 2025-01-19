#lang sicp

(define (reverse x)
  (if (null? x)
      '()
  (append (reverse (cdr x)) (list (car x)))))

(define (deep-reverse x)
  (cond ((null? x) nil)
        ((not (pair? x)) x)
        (else (append (deep-reverse (cdr x)) (list (deep-reverse (car x)))))))

(define list1 (list 1 2 (list 3 4) 5 (list 6 7)))