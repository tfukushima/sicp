;; Arithmetic Operations for Rational Numbers
(define (make-rat n d) (cons n d))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom Y))))

(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))

(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))

(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))


;; Examples of usage
(define one-half (make-rat 1 2))
(print-rat one-half)
(define one-third (make-rat 1 3))
(print-rat (add-rat one-half one-third))
(print-rat (mul-rat one-half one-third))
(print-rat (add-rat one-third one-third))

;; make-rat via gcd
(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (abs x)
  (if (<= x 0) (- x) x))

(define (make-rat n d)
  (cond ((and (< n 0) (< d 0)) (_make-rat (abs n) (abs d)))
        ((or (< n 0) (< d 0)) (_make-rat (- (abs n)) (abs d)))
        (else (_make-rat n d))))

(define (_make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))

(define (make-rat n d)
  (cons n d))

(define (numer x)
  (let ((g (gcd (car x) (cdr x))))
    (/ (car x) g)))

 (define (denom x)
   (let ((g (gcd (car x) (cdr x))))
     (/ (cdr x) g)))

