;; Evolved exponentiation
(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (evlvd-expt b n)
  (evlvd-expt-iter b n 1))

(define (evlvd-expt-iter b counter product)
  (cond ((= counter 0) product)
        ((even? counter) (evlvd-expt-iter (square b) (/ counter 2) product))
        (else (evlvd-expt-iter b (- counter 1) (* product b)))))