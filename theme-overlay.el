(defun mk-ol (prop)
  
  (let ((ol (make-overlay (line-beginning-position) (line-end-position))))
    (overlay-put ol 'face prop)
    ol))


(defun each-face ()
    (interactive)
    (let* ((l ((save-excursion ))))))

(defun color-ol ()
    (interactive)
  (let* ((f (next-list)))
    (mk-ol f)
    ))
(defun next-list ()
    (forward-list)
    (save-excursion  (progn (down-list 4)
                            (thing-at-point 'sexp))))
