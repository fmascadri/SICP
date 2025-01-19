#lang racket

(require racket/trace)

(define (same-parity x . y)
  (define parity (if (even? x) even? odd?))
  (trace-define (same-parity-with-list x l)
    (if (null? l)
        '()
        (if (parity (car l))
            (cons (car l) (same-parity-with-list x (cdr l)))
            (same-parity-with-list x (cdr l)))))
  (if (null? y)
      (list x)
      (cons x (same-parity-with-list x y))))

(define (even? n)
  (= (remainder n 2) 0))

(define (odd? n)
  (not (even? n)))

