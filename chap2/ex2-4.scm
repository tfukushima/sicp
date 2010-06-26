;; exercise 2.4

;; (_cons 1 2) -> (lambda (m) (m 1 2))
(define (_cons x y)
  (lambda (m) (m x y)))

;; (_car (_cons 1 2))
;; -> ((_cons 1 2) (lambda (p q) p))
;; -> ((lambda (m) (m 1 2)) (lambda (p q) p))
;; -> ((lambda (p q) p) 1 2)
;; -> 1
(define (_car z)
  (z (lambda (p q) p)))

;; (_cdr (_cons 1 2))
;; -> ((_cons 1 2) (lambda (p q) q))
;; -> ((lambda (m) (m 1 2)) (lambda (p q) q))
;; -> ((lambda (p q) q) 1 2)
;; -> 2
(define (_cdr z)
  (z (lambda (p q) q)))