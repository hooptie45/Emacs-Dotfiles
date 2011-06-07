(defun find-thing-at-point ()
  (interactive)
  (let* ((thing (intern (thing-at-point 'sexp))))
    (let* ((km (current-local-map)))
      
      (cond
       ((functionp thing) (find-function thing))

       ((boundp thing) (find-variable-other-window thing))
       (t (ffap))))))

(defun am-looking-at ()
  "Doc for [yas] elisp error!"
  (interactive)
  (let ((s (read-string "char: ")))
    (message "%s" (looking-at s))
    ))

(defun text-thing (tap)
  "Doc for [yas] elisp error!"
  (loop
   for thing in tap
   collect (buffer-substring-no-properties (car thing) (cdr thing))))

(defun convert-to-lazy ()
  "Doc for [yas] elisp error!"
  (interactive)
  (pp (while
          (push )))
  (loop while (not (null v))
	with v = (extact-keys)
	collect v into r
	finally (pp r)))



(require 'lazy-set-key)
(require 'hippie-exp)

(lazy-set-key
 '(("<mouse-2>" . dired-mouse-find-file))
 dired-mode-map)

(lazy-set-key
 '(
   ("H-e" . anything-emms)
   ("H-r"         . replace-word)
   ("H-r"         . replace-word)
   ("M-/" . company-complete)
   ("H-=" . (lambda () 
              (interactive)
              (paredit-blink-paren-match t)))
   ("M-x"         . anything-execute-extended-command)
   ("M-<return>"  . find-thing-at-point)
   ("s-."         . point-ring-insert)
   ("s-/"         . point-ring-next)
   ("s-,"         . point-ring-previous)
   ("H-t" . toggle-truncate-lines)
   ("C-s-<"       . point-ring-rotate-left)
   ("C-s->"       . point-ring-rotate-right)
   ("H-/"         . ad-Orig-anything-lisp-complete-symbol-partial-match)
   ("H-|"         . toggle-truncate-lines)
   ("C-x C-b"     . ibuffer)
   ("C-M-\\"      . indent-buffer)
   ("C-s"         . isearch-forward-regexp)
   ("C-r"         . isearch-backward-regexp)
   ("H-a"         . align-current)
   ("C-H-<left>"  . doremi-window-width+)
   ("C-H-<right>" . doremi-files-there)
   ("C-H-<up>"    . doremi-files)
   ("C-z" . ibuffer)
   ("C-x C-e" . eval-last-sexp)
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
   ("s-s" . shell)

   ("<S-left>"    . windmove-left)
   ("<S-right>"   . windmove-right)
   ("<S-down>"    . windmove-down)
   ("<S-up>"      . windmove-up)
   ([mouse-3]     . dired-jump)
   ("M-z"         . dired-jump)
   ("H-p"         . push-point)
   ("M-j" . jump-to-register)
   ("H-w"         . push-word)
   ("M-/" . company-complete)
   ("M->"         . pop-tag-mark)
   ("H-r" . anything-show-kill-ring)))

(lazy-set-key
 '(("M-/" . company-complete)
   ("M-d" . slime-documentation))
 
 clojure-mode-map)

(lazy-set-key
 '(("M-/" . company-complete)
   ("M-d" . slime-documentation))
 
 slime-mode-map)
(lazy-set-key
 '(("C-n"   . company-select-next)
   ("C-p"   . company-select-previous)
   ("C-d"   . company-show-doc-buffer)
   ("C-v"   . company-show-location)
   ("C-g"   . (lambda ()
                (interactive)
                (company-abort)))
   ("<ESC>" . (lambda ()
                (interactive)
                (company-abort)))
   ("H-z"     . (lambda ()
                  (interactive)
                  (test-comp))))
 company-active-map)

;; (lazy-set-key
;;  '(("C-x C-e" . slime-eval-last-expression)
;;    ("C-c C-v" . slime-eval-buffer))
;;  clojure-mode-map)

;; (lazy-set-key
;;  '(("C-x C-e" . slime-eval-last-expression))
;;  slime-repl-mode-map)



(lazy-set-key '(("C-k" . (lambda ()
                           (interactive)
                           (kill-new (concat "\n" (anything-get-selection)))
                           (anything-next-line)))
                ("."  (lambda ()
                        (interactive)
                        (kill-append (concat "\n" (anything-get-selection)) nil)
                        (anything-next-line))))
              anything-map)


(define-key paredit-mode-map (kbd "\\") 'self-insert-command)


(provide 'starter-kit-bindings)
