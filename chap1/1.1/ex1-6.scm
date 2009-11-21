(define (new-if predicate then-clause else-caluse)
  (cond (predicate then-clause)
	(eles else-caluse)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
	  guess
	  (sqrt-iter (improve guess x)
		     x)))