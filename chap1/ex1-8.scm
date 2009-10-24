;; procedures for square root

(define (square x) (* x x))

(define (good-enough-square? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (average x y)
  (/ (+ x y) 2))

(define (improve-square guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough-square? guess x)
      guess
      (sqrt-iter (improve-square guess x)
		 x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))


;; procedures for cube root

(define (cube x) (* x x x))

(define (good-enough-cube? guess x)
  (< (abs (- (cube guess) x)) 0.001))

(define (improve-cube guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cbrt-iter guess x)
  (if (good-enough-cube? guess x)
      guess
      (cbrt-iter (improve-cube guess x)
	       x)))

(define (cbrt x)
  (cbrt-iter 1.0 x))

;; generic procedures for X root
(define (good-enough? proc)
  (lambda (guess x)
    (< (abs (- (cube guess) x)) 0.001)))

(define (improve proc)
  (lambda (guess x)
    (proc guess x)))

(define (root-for proc)
  (proc 1.0 x))