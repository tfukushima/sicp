;; Naive multiplication
(define (double x)
  (+ x x))

(define (even? n)
  (= (remainder  n 2) 0))

(define (halve n)
  (/ n 2))

(define (* a b)
  (cond ((= (+ a b) a) 0)
        ((= b 1) a)
        ((even? b) (* (double a) (halve b)))
        (else (+ a (* a (- b 1))))))
