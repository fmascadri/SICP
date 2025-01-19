#lang racket

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch m)
  (car m))

(define (right-branch m)
  (cdr m))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (cdr b))

(define b1 (make-branch 1 1))
(define b2 (make-branch 0.5 2))
(define m1 (make-mobile b1 b2))

(define (branch-weight b)
  (if (pair? (branch-structure b))
      (total-weight (branch-structure b))
      (branch-structure b)))

(define (total-weight m)
  (+ (branch-weight (left-branch m))
     (branch-weight (right-branch m))))
  
(define (torque b)
  (* (branch-weight b) (branch-length b)))

(define (balanced? m)
  (and (= (torque (left-branch m))
          (torque (right-branch m)))
       (if (pair? (branch-structure (left-branch m)))
           (balanced? (branch-structure (left-branch m)))
           #t)
       (if (pair? (branch-structure (right-branch m)))
           (balanced? (branch-structure (right-branch m)))
           #t)))
           
