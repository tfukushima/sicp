;; Exercise 2.18
(define (reverse lis)
  (if (null? lis)
      ()
      (append (reverse (cdr lis)) (list (car lis)))))