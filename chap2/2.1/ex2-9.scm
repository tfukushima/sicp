;; interval
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))
;; make interval
(define (make-interval a b) (cons a b))
;; Exercise 2.7
;; Selectors for upper-bound and lower-bound
(define (lower-bound x) (car x))
(define (upper-bound x) (cdr x))

;; Exercise 2.8
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

;; Exercise 2.9
(define (width x) (/ (- (cdr x) (car x)) 2))
;; (width (add-interval x y)) = (+ (width x) (+ width x))
(define (sum-width x y) (+ (width x) (width y)))
;; (width (sub-interval x y)) = (+ (width x) (+ width x))
(define (sub-width x y) (sum-width x y))
