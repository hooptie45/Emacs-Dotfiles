(load "starter-kit-defuns-builtin.el")

(defun replace-in-defun (s)
  (interactive "sReplace with: ")

  (replace-w-in-r (thing-nearest-point 'sexp)
	    (car kill-ring)
	    (bounds-of-thing-nearest-point 'defun)))

(defun get-word-at-mark ()
  (interactive)
  (save-excursion
    (progn
      (goto-char (car mark-ring))
      (word-at-point))))

(defun clear-reg (r)
  (interactive "cRegister: ")
  (set-register r nil))

(defun push-reg (r v)
  (set-register r (cons v (get-register r))))

(defun pop-reg (r)
  (interactive "cRegister: ")
  (let ((reg (get-register r)))
    (progn
      (set-register r (cdr reg))
      (message "%s -> %s" (car reg) (cdr reg))
      (car reg))))


(defun my-comment ()
  (interactive)
  (save-excursion
    (kill-region (point-at-bol) (point-at-eol))
    (progn               
      (insert ";; ")
      (insert-char ?- 77)
      (newline)
      (insert ";; |") (yank)
      (newline)
      (insert ";; ")
      (insert-char ?- 77)----------------------------------------------------------------------------------------------------------------------------------------------------------)
    )
  (line-move 1))


(defun push-point (&optional r)
  
  (interactive)
  (push-reg (or r ?p) (point))
  )

(defun push-word ()

  (interactive "cRegister: ")
  (push-reg r (thing-nearest-point 'word))
  (message "%s" (get-register r)))

(defun push-f (r f)
  (interactive)
  (push-reg r f)
  (message "%s" (get-register r)))


(defun replace-all (str)
  (interactive "sReplace (REG) with (REG): ")
  (un wind-protect 
      (save-excursion
	(beginning-of-defun)
	(narro w-to-defun)
	(let* ((treg (split-string str " "))
	       (search (pop-reg (string-to-char (substring str 0 1))))
	       (replace (pop-reg (string-to-char (substring str 1 2)))))


	  (while (re-search-for ward search nil t)
	    (let ((r (bounds-of-thing-nearest-point 'word)))
	      (delete-region (car r) (cdr r))
	      (insert replace)))))
      (widen)))



(defun where ()
  (if mark-active
      (cons (region-beginning) (region-end))
      (cons (point) (point))))

(defun mark-search (str)
  (interactive "sSearch: ")
  (clear-reg ?p)
  (save-excursion
    (goto-char (point-min))
    (while (re-search-for ward str nil t)
      (push-point)))
  (vie w-register ?p))

(defun at-each-point (f)
  (save-excursion 
    (mapc (lambda (p) 
	    (goto-char (pop-reg ?p))
	    (funcall f)) (get-register ?p))))

(defun erv ()
  (interactive)
  (require 'server)
  (when (and (functionp 'server-running-p) (not (server-running-p)))
    (server-start)))

(defun replace-w-in-r (w-f s r-f) 
  (save-excursion 
    (let ((w w-f)
          (bounds r-f))
      (let ((text (buffer-substring-no-properties
                   (car bounds)
                   (cdr bounds))))
        (with-temp-buffer
          (insert text)
          (kill-ne w text)
          (goto-char (point-min)) 
          (while (re-search-for ward w nil t)
            (replace-match s nil nil)) 
          (kill-ne w
                   (buffer-substring-no-properties
                    (point-min)
                    (point-max))))))))

(defun np-define-key (key)
  (interactive "k")
  (let ((commands nil))
    (let ((com (mapatoms (lambda (a)
			   (if (commandp a)
			       (push (symbol-name a) commands)))
			 obarray)))) 
    (let ((cmd (ido-completing-read (concat "(" (format " %s " key) "): ") commands)))
      (message "%s" cmd)
      (define-key (current-local-map) key (intern cmd)))))

(defun delete-all-overlays ()
  "DOCSTRING"
  (interactive)
  (let* ((overlays (car (overlay-lists)))) 
    (mapc (lambda (o) 
	    (delete-overlay o))
	  overlays)))



(defun ido-commands ()
  (interactive)
  (let ((fn (ido-completing-read "C: " (let ((candidates '(lambda nil
                                                           (let
                                                               (commands)
                                                             (mapatoms
                                                              (lambda
                                                                  (a)
                                                                (if
                                                                 (commandp a t)
                                                                 (push
                                                                  (symbol-name a)
                                                                  commands))))
                                                             (sort commands 'string-lessp)))))
                                         (funcall
                                          candidates)))))

    
    (funcall (intern fn))))

(defun ido-lookup ()
    (interactive)
    )
(require 'thing-opt)

(global-set-key (kbd "H-z") 'zone)
(global-set-key (kbd "H-z") 'zone)
(global-set-key (kbd "H-x") 'execute-extended-command)
(global-set-key (kbd "M-x") 'ido-commands)
(global-set-key (kbd "H-f") 'ido-fun)
(global-set-key (kbd "H-v") 'ido-var)





(defun ido-fun ()
  (interactive)
  (let ((fn (ido-completing-read "C: " (let ((candidates '(lambda nil
                                                           (let
                                                               (commands)
                                                             (mapatoms
                                                              (lambda
                                                                  (a)
                                                                (if
                                                                 (functionp a)
                                                                 (push
                                                                  (symbol-name a)
                                                                  commands))))
                                                             (sort commands 'string-lessp)))))
                                         (funcall
                                          candidates)))))
    
    (describe-function (intern fn))))

(defun ido-maps ()
  (interactive)
  (let ((fn (ido-completing-read "C: " (remove-if 'null (mapcar (lambda (a) 
                                                                  (if
                                                                   (and
                                                                    (string-match-p "map$" (symbol-name a))
                                                                    (not (commandp a t))
                                                                    (not (functionp a)))
                                                                   (symbol-name a))) obarray)))))
    

    (insert fn)))


(defun ido-var ()
  (interactive)
  (let ((fn (ido-completing-read "C: " (let ((candidates (lambda nil
                                                           (sort
                                                            (all-completions "" obarray 'boundp)
                                                            'string-lessp))))
                                         (funcall candidates))
                                 )))
    
    (describe-variable (intern fn))))




(provide 'starter-kit-defuns)

;;; starter-kit-defuns.el ends here
  
  

(defun add-to-defuns ()
  "DOCSTRING"
  (interactive)
  (let* ((bnds (bounds-of-thing-nearest-point 'defun))
         (start (car bnds))
         (end (cdr bnds))
         (text (buffer-substring start end)))
    (save-excursion 
      (set-buffer "starter-kit-defuns.el")
      (goto-char (point-max))
      (insert text))))


(defun ctp () "collect trailing parens"
       ;; bunches the `dangling parens' in your code up into the useless and unnatural
       ;; position expected by the lisp community.  Depends on font-lock to avoid
       ;; moving a trailing paren onto the end of a comment.
       (interactive)
       (save-excursion 
         (mark-defun)
         (indent-region (point) (mark))
           
         (while (re-search-forward "^\\s *)" nil t)
           (end-of-line 0)
           (if (eq 'font-lock-comment-face (get-char-property (1-(point)) 'face))
               (end-of-line 2)
               (delete-indentation -1))
           (beginning-of-line 2))))


(defun toggle-etp ()
  (interactive)
  (narrow-to-defun)
  (save-excursion    
    (beginning-of-defun)
    (if (re-search-forward " )" nil t)
        (ctp)
        (etp)))
  (widen)
  t)






(defun etp () "Expands trailing parens"
       ;; This function ignores parens within quotes and comments only if

       ;; font-lock is turned on.  If the closing paren is on the same line as
       ;; the open then leave it there otherwise give it it's own line.  The
       ;; trailing parens won't be lined up in the same column with the opening
       ;; paren unless you have my mod for calculate-lisp-indent installed too.
       (interactive)
       (save-excursion
         (mark-defun)
         (indent-region (point) (mark))
         
         (while (re-search-forward ")" nil t)
           (if (not (or (eq 'font-lock-comment-face (get-char-property (1- (point)) 'face))
                        (eq 'font-lock-string-face (get-char-property (1- (point)) 'face))
                        (looking-back "^\\s-*)")
                        )
                    )
               (let ((pos1 (line-beginning-position)))
                 (if (save-excursion
                       (condition-case () (goto-char (scan-sexps (point) -1)) (error nil))
                       (eq pos1 (line-beginning-position))
                       )
                     () ;do nothing if unbalanced or open on same line
                     (backward-char)
                     (newline-and-indent)
                     (goto-char pos1)
                     )
                 )
               )
           )
         )
       )



(global-set-key (kbd "C-z") 'undo)




(define-key paredit-mode-map (kbd "\\") 'self-insert-command)
(define-key paredit-mode-map (kbd "H-s") 'fixup-whitespace)
(define-key global-map (kbd "C-?") 'sel-disp)
(global-set-key (kbd "C-t") 'toggle-etp)
