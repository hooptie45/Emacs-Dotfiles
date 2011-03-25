
(global-set-key (kbd "s-.") 'point-ring-insert)
(global-set-key (kbd "s-/") 'point-ring-next)
(global-set-key (kbd "s-,") 'point-ring-previous)
(global-set-key (kbd "C-s-<") 'point-ring-rotate-left)
(global-set-key (kbd "C-s->") 'point-ring-rotate-right)
(global-set-key (kbd "H-/") 'ad-Orig-anything-lisp-complete-symbol-partial-match)

;(define-key slime-repl-mode-map (kbd "<up>") 'slime-repl-backward-input)
;(define-key slime-repl-mode-map (kbd "<down>") 'slime-repl-forward-input)
(global-set-key (kbd "M->") 'pop-tag-mark)

;; (define-key yas/minor-mode-map (kbd "C-c i") 'yas-ins)
(define-key global-map  (kbd "H-d h") 'doremi-window-height+)
(define-key global-map  (kbd "C-H-<left>") 'doremi-window-width+)
(define-key global-map  (kbd "C-H-<right>") 'doremi-files-there)
(define-key global-map  (kbd "C-H-<up>") 'doremi-files)
(define-key global-map  (kbd "C-H-<down>") 'doremi-recent)


(define-key global-map  (kbd "H-d t") 'doremi-color-themes+)
(define-key global-map  (kbd "H-d h") 'doremi-window-height+)
(define-key global-map  (kbd "H-d m") 'doremi-marks+)
(define-key global-map  (kbd "H-d g") 'doremi-global-marks+)
(define-key global-map  (kbd "H-s") 'fixup-whitespace)
(define-key global-map  (kbd "M-z") 'dired-jump)
(define-key global-map  (kbd "C-x g") 'magit-status)

(define-key global-map  (kbd "<S-left>") 'windmove-left)
(define-key global-map  (kbd "<S-right>") 'windmove-right)
(define-key global-map  (kbd "<S-down>") 'windmove-down)
(define-key global-map  (kbd "<S-up>") 'windmove-up)

(global-set-key [mouse-3] 'dired-jump)
(global-set-key (kbd "M-z") 'dired-jump)
(define-key dired-mode-map [mouse-3] 'dired-up-directory)
(global-set-key (kbd "H-p") 'push-point)
(global-set-key (kbd "H-w") 'push-word)
(global-set-key (kbd "H-r") (lambda () 
                              (interactive)
                              (push-word ?r)))
(global-set-key (kbd "H-s") (lambda () 
                              (interactive)
                              (push-word ?s)))
(global-set-key (kbd "H-r") 'replace-word)
(global-set-key (kbd "H-r") 'replace-word)
(global-set-key (kbd "C-c C-k") (lambda () 
                              (interactive)
                              (at-each-point 'call-last-kbd-macro)))


(define-key global-map (kbd "C-x f") 'recentf-ido-find-file)
(define-key dired-mode-map (kbd "M-z") 'dired-up-directory)

(provide 'starter-kit-bindings)
