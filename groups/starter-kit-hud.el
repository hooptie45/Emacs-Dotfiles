(defvar hud-last-buffer nil)
(defvar hud-last-window nil)
(defvar hud-window-height 20) ; percentage for shell-buffer window height
(defvar hud-window-position "bottom")

(defvar hud-internal-mode "repl")
(defvar hud-internal-mode-buffer ((lambda () 
                                    (buffer-name (get-buffer-create "*NP*")))))
(defvar hud-internal-mode-func '(lambda () (split-window (selected-window) 20 t)))
(defvar hud-init-fn '(lambda () 
                       (split-window (selected-window) 50 t)))
(defvar hud-internal-mode-shell "/bin/bash")

(defvar hud-internal-mode-list
  (list
                                        ; mode, buffer, function
   '("shell"     "*shell*"     '(lambda () (shell)))
   '("terminal"  "*terminal*"  '(lambda () (term hud-internal-mode-shell)))
   '("ansi-term" "*ansi-term*" '(lambda () (ansi-term hud-internal-mode-shell)))
   '("eshell"    "*eshell*"    '(lambda () (eshell)))
   '("repl" "*repl*" '(lambda () 
                        (slime-goto-connection)))))

(defun hud-set-window-height (number)
  (interactive "nInput the number for the percentage of \
selected window height (10-100): ")
  (setq hud-window-height number))

(defun hud-set-window-position (position)
  (interactive "sInput the position for hud (top|bottom): ")
  (setq hud-window-position position))

(defun hud-set-internal-mode (mode)
  (interactive "sInput your favorite mode (shell|terminal|ansi-term|eshell): ")
  (if (catch 'found
        (dolist (l hud-internal-mode-list)
          (if (string-match mode (car l))
              (progn
                (setq hud-internal-mode-buffer (nth 1 l))
                (setq hud-internal-mode-func (nth 2 l))
                (throw 'found t)))))
      t
    nil))

(defun hud-set-internal-mode-shell (shell)
  (interactive (list (read-from-minibuffer "Input your favorite shell:"
                                           hud-internal-mode-shell)))
  (setq hud-internal-mode-shell shell))

(defun hud ()
  (interactive)
  (save-excursion
    (progn
      (if (equal (buffer-name) hud-internal-mode-buffer)
          (hud-out)
        (hud-up)))))

(defun hud-up ()
  (let ((w (get-buffer-window hud-internal-mode-buffer)))
    (if w
        (select-window w)
      (progn
        
        (setq hud-last-buffer (buffer-name))
        (setq hud-last-window (selected-window))
        (if (not (eq hud-window-height 100))
            (progn
              (split-window (selected-window)
                            (if (string= hud-window-position "bottom")
                                (round (* (window-height)
                                          (/ (- 100 hud-window-height) 100.0)))
                              (round (* (window-height) (/ hud-window-height 100.0)))))
              (if (string= hud-window-position "bottom")
                  (other-window 1)
                (funcall (eval hud-init-fn)))))
        (if (not (get-buffer hud-internal-mode-buffer))
            (funcall hud-internal-mode-func)
          (switch-to-buffer hud-internal-mode-buffer)
          (funcall (eval hud-init-fn)))))))

(defun hud-out ()  
  (switch-to-buffer (first huds)))
(defun hud-i ()
  (let ((w (first huds)))
    (if w
        (delete-window w)
      (if (not (eq hud-window-height 100))
          (progn
            (push 
             (split-window (selected-window)
                           (if (string= hud-window-position "bottom")
                               (round (* (window-height)
                                         (/ (- 100 hud-window-height) 100.0)))
                             (round (* (window-height) (/ hud-window-height 100.0))))) huds)
            (if (string= hud-window-position "bottom")
                (other-window 1)
              (funcall (eval hud-init-fn))))))))

(provide 'hud)
(defvar huds nil)

;;; hud.el ends here.


