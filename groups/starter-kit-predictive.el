(provide 'starter-kit-predictive)
(setq predictive-auto-learn t)
(defun company-predictive (command &optional arg &rest ignored)
  "A `company-mode' completion back-end using ispell."
  (interactive (list 'interactive))
  (case command
    ('interactive (company-begin-backend 'company-predictive))
    ('prefix (thing-at-point 'word))
    ('candidates (predictive-complete arg 10))
    ('ignore-case t)))
