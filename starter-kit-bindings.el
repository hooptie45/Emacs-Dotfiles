


(lazy-set-key '(
                ("s-." . point-ring-insert)
                ("s-/" . point-ring-next)
                ("s-," . point-ring-previous)
                ("C-s-<" . point-ring-rotate-left)
                ("C-s->" . point-ring-rotate-right)
                ("H-/" . ad-Orig-anything-lisp-complete-symbol-partial-match)
                ("H-|" . toggle-truncate-lines)
                ("C-x C-b" . ibuffer)
                ("C-M-\\" . indent-buffer)
                ("M-x" . anything-execute-extended-command)
                ("C-s" . isearch-forward-regexp)
                ("C-r" . isearch-backward-regexp)
		("H-a"         .  align-current)
		("C-H-<left>"  .  doremi-window-width+)
		("C-H-<right>" .  doremi-files-there)
		("C-H-<up>"    .  doremi-files)
		("C-H-<down>"  .  doremi-recent)
		("H-d t"       .  doremi-color-themes+)
		("H-d h"       .  doremi-window-height+)
		("H-d m"       .  doremi-marks+)
		("H-d g"       .  doremi-global-marks+)
		("H-s"         .  fixup-whitespace)
		("M-z"         .  dired-jump)
		("C-x g"       .  magit-status)
		("<S-left>"    .  windmove-left)
		("<S-right>"   .  windmove-right)
		("<S-down>"    .  windmove-down)
		("<S-up>"      .  windmove-up))

	      ))


;; ;; (define-key anything-map [down-mouse-1] nil)
;; ;; (define-key anything-map [down-mouse-1] nil)
;; ;; (define-key anything-map [mouse-1] nil)
;; ;; (global-unset-key [down-mouse-1])


;; ("S-H-<left>" . (lambda ()
;;                   (interactive)
;;                   (enlarge-window-horizontally -4)))

;; ("S-H-<up>" . (lambda ()
;;                 (interactive)                                                         
;;                 (unwind-protect
;;                      (enlarge-window -2)
;;                   (split-window-vertically))))



;; ("S-H-<down>"
;;  '(lambda ()
;;    (interactive)                                                         
;;    (unwind-protect
;;         (enlarge-window 2)
;;      (split-window-vertically))))

;;                                         ;(define-key slime-repl-mode-map (kbd "<down>") 'slime-repl-forward-input)
;; ("M->" pop-tag-mark)


;; (define-key yas/minor-mode-map (kbd "C-c i") 'yas-ins)

;; (my-keys


;; (defmacro my-keys (keys)

;;   `( ,@(loop

;;         for k in ,keys
;;         do (acons (car k) (cdr k) kl)
;;         return kl))
;;   )

;; ([mouse-3] dired-jump)
;; ("M-z" dired-jump)
;; ("H-p" push-point)
;; ("H-w" push-word)
;; ("H-r" (lambda () 
;;          (interactive)
;;          (push-word ?r)))

;; ("H-s" (lambda () 
;;          (interactive)
;;          (push-word ?s)))
;; ("H-r" replace-word)
;; ("H-r" replace-word)
;; ("C-c C-k" (lambda () 
;;              (interactive)
;;              (at-each-point call-last-kbd-macro)))
;; ("M-x" anything-execute-extended-command)
;; ("M-<return>" find-thing-at-point)
(define-key dired-mode-map [mouse-3] 'dired-up-directory)
(define-key dired-mode-map (kbd "M-z") 'dired-up-directory)
(define-key paredit-mode-map (kbd "\\") 'self-insert-command)
(define-key paredit-mode-map (kbd "H-s") 'fixup-whitespace)
;; ("C-?" sel-disp)
;; ("C-t" toggle-etp)


(defun find-thing-at-point ()
  (interactive)
  (let* ((thing (intern (thing-at-point 'sexp))))
    
    (let* ((km (current-local-map)))
      (define-key km
	(kbd "q") 'self-insert-command)
      (cond
       ((functionp thing) (find-function thing))
       
       ((boundp thing) (find-variable-other-window thing))
       (t (ffap))))))

(provide 'starter-kit-bindings)
