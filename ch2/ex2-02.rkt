#lang sicp

(define (make-segment start-point end-point) (cons start-point end-point))

(define (start-point segment) (car segment))

(define (end-point segment) (cdr segment))

(define (make-point x y) (cons x y))

(define (x-point point) (car point))

(define (y-point point) (cdr point))

(define (print-point p)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment segment)
  (make-point (average (x-point (start-point segment))
                       (x-point (end-point segment)))
              (average (y-point (start-point segment))
                       (y-point (end-point segment)))))

(define (average x y) (/ (+ x y) 2.0))