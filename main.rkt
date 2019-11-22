#lang racket

; (product.sym sym sos): S X SL -> LL
; returns cartesian product of sym with sos
(define product.sym
  (lambda (sym sos)
    (if (null? sos)
        (list)
        (cons (list sym (car sos)) (product.sym sym (cdr sos))))))

; (product sos1 sos2): SL X SL -> LL
; returns cartesian product of sos1 with sos2
; : size(sos1)=0 -> ()
; : else         -> (append (product.sym sos1[0] sos2) (product sos1[1..end] sos2))
(define product
  (lambda (sos1 sos2)
    (if (null? sos1)
        (list)
        (append (product.sym (car sos1) sos2) (product (cdr sos1) sos2)))))
