#lang racket

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (xor a b)
  (not (equal? a b)))

(define (make-rat n d)
  (let ((g (abs (gcd n d))))
    (if (xor (< n 0) (< d 0)) ; negative rational
        (cons (/ (* -1 (abs n)) g) (/ (abs d) g)) ; normalized to numer negative
        (cons (/ (abs n) g) (/ (abs d) g))))) ; abs ensures for positve rationals both num and den are positive

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))