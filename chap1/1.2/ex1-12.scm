(define (pascal-triangle n)
  (cond ((= n 1) '(1))
	((= n 2) '(1 1))
	(else (cons 1 (pascal-generator (pascal-triangle(- n 1)))))))


(define (pascal-generator list)
  (if (null? (cdr list)) list
      (cons (+ (car list) (car (cdr list))) (pascal-generator (cdr list)))))