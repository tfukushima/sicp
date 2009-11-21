(define (sum3 x y z)
  (if (< x y)
      (if (< x z) (+ y z) (+ x y))
      (if (< y z) (+ x z) (+ x y))))
