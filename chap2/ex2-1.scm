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
