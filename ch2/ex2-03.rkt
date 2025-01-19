#lang sicp

(define (square x) (* x x))

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

(define (perimeter-rect r)
  (* 2 (+ (width-rect r) (height-rect r))))

(define (area-rect r)
  (* (width-rect r) (height-rect r)))

(define (distance-point p1 p2)
  (sqrt
   (+ (square (- (x-point p2) (x-point p1)))
      (square (- (y-point p2) (y-point p1))))))

(define (dot-product p1 p2)
  (+ (* (x-point p1) (x-point p2))
     (* (y-point p1) (y-point p2))))

(define (add-vector v1 v2)
  (make-point (+ (x-point v1) (x-point v2))
              (+ (y-point v1) (y-point v2))))

(define (sub-vector v1 v2)
  (make-point (- (x-point v1) (x-point v2))
              (- (y-point v1) (y-point v2))))

(define tolerance 0.00001)

(define (orthogonal? v1 v2)
  (< (abs (dot-product v1 v2)) tolerance))

(define (make-rect p1 p2 p3)
  (if (orthogonal? (sub-vector p2 p1) (sub-vector p3 p1))
      (cons p1 (cons p2 p3))
      (error "Points should make a rectangle.")))

(define (p1-rect r) (car r))
(define (p2-rect r) (car (cdr r)))
(define (p3-rect r) (cdr (cdr r)))

; Interface
(define (height-rect r) (distance-point (p1-rect r) (p2-rect r)))
(define (width-rect r) (distance-point (p1-rect r) (p3-rect r)))