;; Evolved multiplication
(define (double x)
  (+ x x))

(define (even? n)
  (= (remainder  n 2) 0))

(define (halve n)
  (/ n 2))

(define (* a b)
  (*-iter a b 0))

(define (*-iter b counter product)
  (cond ((= (+ b counter) 0) 0)
        ((= counter 1) (+ product b))
        ((even? counter) (*-iter (double b) (halve counter) product))
        (else (*-iter b (- counter 1) (+ product b)))))