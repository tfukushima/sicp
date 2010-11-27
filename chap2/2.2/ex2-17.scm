;; Exercise 2.17
(define (last-pair lis)
  (if (null? (cdr lis))
      (car lis)
      (last-pair (cdr lis))))