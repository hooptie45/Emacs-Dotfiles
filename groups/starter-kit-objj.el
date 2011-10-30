(provide 'starter-kit-objj)
(defun np-objj-load-members ()
  "Doc for [yas] elisp error!"
  (interactive)
  (let ((found))
    
    

    (save-excursion
      (re-search-backward "@implementation")
      
      
      (progn
        (while (re-search-forward "\\w+ \\(\\w+\\);" nil t)
          (progn
            (kill-new (match-string 1))
            (push (match-string 1) found)))
        ))
    found))
