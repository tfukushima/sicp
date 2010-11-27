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
(define (width x) (/ (- (upper-bound x) (lower-bound x)) 2))
(define (sum-width x y) (+ (width x) (width y)))
(define (sub-width x y) (+ (width x) (width y)))

;; Exercise 2.10
(define (div-interval x y)
  (if (= y 0) (error "divided by zero.")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))
;; Exercise 2.11
(define (mul-interval-rev x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (cond ((and (and (> (lower-bound x) 0) (> (lower-bound y) 0))
                (and (> (upper-bound x) 0) (> (upper-bound y) 0)))
           (make-interval p1 p4))
          ((and (and (> (lower-bound x) 0) (< (lower-bound y) 0))
                (and (> (upper-bound x) 0) (> (upper-bound y) 0)))
           (make-interval p1 p4))
          ((and (and (> (lower-bound x) 0) (< (lower-bound y) 0))
                (and (> (upper-bound x) 0) (< (upper-bound y) 0)))
           (make-interval p4 p1))
          ((and (and (< (lower-bound x) 0) (> (lower-bound y) 0))
                (and (> (upper-bound x) 0) (> (upper-bound y) 0)))
           (make-interval p4 p1))
          ((and (and (< (lower-bound x) 0) (< (lower-bound y) 0))
                (and (> (upper-bound x) 0) (> (upper-bound y) 0)))
           (make-interval (min p2 p3) (max p1 p4)))
          ((and (and (< (lower-bound x) 0) (< (lower-bound y) 0))
                (and (> (upper-bound x) 0) (< (upper-bound y) 0)))
           (make-interval p4 p1))
          ((and (and (< (lower-bound x) 0) (> (lower-bound y) 0))
                (and (< (lower-bound x) 0) (> (upper-bound y) 0)))
           (make-interval p2 p3))
          ((and (and (< (lower-bound x) 0) (< (lower-bound y) 0))
                (and (< (lower-bound x) 0) (> (upper-bound y) 0)))
           (make-interval p3 p2))
          ((and (and (< (lower-bound x) 0) (< (lower-bound y) 0))
                (and (< (lower-bound x) 0) (< (upper-bound y) 0)))
           (make-interval p1 p4)))))
           
(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))
(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))
(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

;; Exercise 2.12
(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100))))
(define (percent i)
  (/ (center i) (width i)))

;; Exercise 2.13
(define (div-interval-rev x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
                (add-interval r1 r2)))
(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
                  (add-interval (div-interval one r1)
                                (div-interval one r2)))))