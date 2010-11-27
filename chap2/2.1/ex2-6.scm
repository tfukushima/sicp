;; Exercise 2.6

;; 0 := \f x -> x
(define zero (lambda (f) (lambda (x) x)))

;; (add-1 zero)
;; \f x -> f (zero f) x
;; \f x -> f ((\f x -> x) f) x
;; \f x -> f x
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; 1 := \f x -> f x
(define one (lambda (f) (lambda (x) (f x))))

;; 2 := \f x -> f (f x)
(define two (lambda (f) (lambda (x) (f (f x)))))

;; General adder
;; e.g)
;; (add-x zero zero)
;; \f x y -> ((zero f) ((zero f) x))
;; \f x y -> (((\f x -> x) f) (((\f x -> x) f) x))
;; \f x y -> x
;;
;; (add-x zero one)
;; \f x y -> ((zero f) ((one f) x))
;; \f x y -> (((\f x -> x) f) (((\f x -> f x) f) x))
;; \f x y -> (((\f x -> f x) f) x)
;; \f x y -> f x
(define (add-x n m)
  (lambda (f) (lambda (x) (lambda (y) ((m f) ((n f) x))))))
