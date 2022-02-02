#lang racket

; (list.cartesian-product-sym sym sos): S X SL -> LL
; returns cartesian product of sym with sos
(define list.cartesian-product-sym
  (lambda (sym sos)
    (if (null? sos)
        (list)
        (cons (list sym (car sos)) (list.cartesian-product-sym sym (cdr sos))))))

; (list.cartesian-product sos1 sos2): SL X SL -> LL
; returns cartesian product of sos1 with sos2
; : size(sos1)=0 -> ()
; : else         -> (append (list.cartesian-product-sym sos1[0] sos2) (list.cartesian-product sos1[1..end] sos2))
(define list.cartesian-product
  (lambda (sos1 sos2)
    (if (null? sos1)
        (list)
        (append (list.cartesian-product-sym (car sos1) sos2) (list.cartesian-product (cdr sos1) sos2)))))
