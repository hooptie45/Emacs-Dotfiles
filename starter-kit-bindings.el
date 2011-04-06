


(require 'lazy-set-key)


(lazy-set-key '(
                ("H-r"         . replace-word)
                ("H-r"         . replace-word)
                ("M-x"         . anything-execute-extended-command)
                ("M-<return>"  . find-thing-at-point)
                ("s-."         . point-ring-insert)
                ("s-/"         . point-ring-next)
                ("s-,"         . point-ring-previous)
                ("C-s-<"       . point-ring-rotate-left)
                ("C-s->"       . point-ring-rotate-right)
                ("H-/"         . ad-Orig-anything-lisp-complete-symbol-partial-match)
                ("H-|"         . toggle-truncate-lines)
                ("C-x C-b"     . ibuffer)
                ("C-M-\\"      . indent-buffer)
                ("M-x"         . anything-execute-extended-command)
                ("C-s"         . isearch-forward-regexp)
                ("C-r"         . isearch-backward-regexp)
		("H-a"         . align-current)
		("C-H-<left>"  . doremi-window-width+)
		("C-H-<right>" . doremi-files-there)
		("C-H-<up>"    . doremi-files)
		("C-H-<down>"  . doremi-recent)
		("H-d t"       . doremi-color-themes+)
		("H-d h"       . doremi-window-height+)
                ("C-?"         . sel-disp)
                ("C-t"         . toggle-etp)
                ("H-d m"       . doremi-marks+)
		("H-d g"       . doremi-global-marks+)
		("H-s"         . fixup-whitespace)
		("M-z"         . dired-jump)
		("C-x g"       . magit-status)
		("<S-left>"    . windmove-left)
		("<S-right>"   . windmove-right)
		("<S-down>"    . windmove-down)
		("<S-up>"      . windmove-up)
                ([mouse-3]     . dired-jump)
                ("M-z"         . dired-jump)
                ("H-p"         . push-point)
                ("H-w"         . push-word)
                ("H-r"         . (lambda ()
                                   (interactive)
                                   (push-word ?r)))
                ("M->"         . pop-tag-mark)
                ("C-c C-k"     . (lambda ()
                                   (interactive)
                                   (at-each-point call-last-kbd-macro)))
                ("S-H-<left>"  . (lambda ()
                                   (interactive)
                                   (enlarge-window-horizontally -4)))
                ("S-H-<up>"    . (lambda ()
                                   (interactive)
                                   (unwind-protect
                                        (enlarge-window -2)
                                     (split-window-vertically))))
                ("S-H-<down>"  . (lambda ()
                                   (interactive)
                                   (unwind-protect
                                        (enlarge-window 2)
                                     (split-window-vertically))))

                )
              global-map
	      )

;; (lazy-set-key
;;  '(([down-mouse-3] . kill-this-buffer))
;;  image-mode-map
;;   )

;; (lazy-set-key
;;  '((122 . ibuffer-mark-compressed-file-buffers)
;;    (104 . ibuffer-mark-help-buffers)
;;    (101 . ibuffer-mark-dissociated-buffers)
;;    (47  . ibuffer-mark-dired-buffers)
;;    (114 . ibuffer-mark-read-only-buffers)
;;    (115 . ibuffer-mark-special-buffers)
;;    (117 . ibuffer-mark-unsaved-buffers)
;;    (109 . ibuffer-mark-modified-buffers)
;;    (77  . ibuffer-mark-by-mode)
;;    (42  . ibuffer-unmark-all))
;;  )
;; ibuffer-mode-map
;; )


(define-key dired-mode-map [mouse-3] 'dired-up-directory)
(define-key dired-mode-map (kbd "M-z") 'dired-up-directory)
(define-key paredit-mode-map (kbd "\\") 'self-insert-command)
(define-key paredit-mode-map (kbd "H-s") 'fixup-whitespace)


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
