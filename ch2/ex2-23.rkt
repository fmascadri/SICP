#lang sicp

(define (for-each proc items)
  (if (null? items)
      true
      ((lambda (x)
         (proc (car x))
         (for-each proc (cdr x))) items)))

