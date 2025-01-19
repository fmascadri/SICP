#lang racket

(require racket/trace)

(define (fast-exp b n)
  (fast-exp-iter b n 1))

(define (fast-exp-iter b n a)
  (cond ((= n 0)
         a)
        ((even? n)
         (fast-exp-iter (* b b) (/ n 2) a))
        (else
         (fast-exp-iter b (- n 1) (* a b)))))

(trace fast-exp-iter)