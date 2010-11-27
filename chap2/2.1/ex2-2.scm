;; Exerciese 2.2

;; Segment is like ((sx .  sy) . (ex . ey))
;; e.g.) (1 . 2) . (3 . 4))
(define (make-segment sx sy ex ey)
  (cons (cons sx sy) (cons ex ey)))

(define (start-segment s)
  (car s))
(define (end-segment s)
  (cdr s))

(define (x-point p)
  (car p))
(define (y-point p)
  (cdr p))

(define (mid a b)
  (/ (+ b a) 2))

(define (mid-segment s)
  (let ((sp (car s))
        (ep (cdr s)))
    (cons (mid (x-point sp) (x-point ep))
          (mid (y-point sp) (y-point ep)))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))
