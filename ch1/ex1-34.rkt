#lang racket

(require racket/trace)

(define (square x) (* x x))

(define (f g) (g 2))

(trace f)


