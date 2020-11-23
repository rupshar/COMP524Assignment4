(setq SAFETY_TABLE 
  (
    list (cons 13 (cons 30 30)) (cons 6 (cons 30 10)) (cons 27 (cons 30 50)) (cons 13 (cons 15 50)) (cons 13 (cons 120 10)) (cons 27 (cons 120 30)) (cons 6 (cons 15 30))
  )
)

(setq listDerivedSafe
  (lambda (distance duration exhalation)
    (funcall listDerivedSafeIteration distance duration exhalation SAFETY_TABLE)
  )
)
        

(setq listDerivedSafeIteration
  (lambda (distance duration exhalation safetyTable)
    (cond
      (
        (null safetyTable)
        nil
      )
      (
        t
        (progn
          (cond
            (
             (funcall listDerivedSafeCheck distance duration exhalation (car safetyTable))
             t
            )
            (
             t
             (funcall listDerivedSafeIteration distance duration exhalation (cdr safetyTable))
            )
          )
        )
      )
    )
  )
)

(setq listDerivedSafeCheck
  (lambda (distance duration exhalation safeTuple)
    (cond
      (
        (and (>= distance (car safeTuple)) (<= duration (car (cdr safeTuple))) (<= exhalation (cdr (cdr safeTuple))))
        t
      )
      (
        (or (<= distance (car safeTuple)) (>= duration (car (cdr safeTuple))) (>= exhalation (cdr (cdr safeTuple))))
        nil
      )
    )
  )
)
          
          
          
          
          
          
          
          