(lazy-set-key
 '(("<mouse-2>" . dired-mouse-find-file))
 dired-mode-map)

(lazy-set-key
 '(("H-e"         . dabbrev-expand)
   ("H-r"         . replace-word)
   ("H-r"         . replace-word)
   ("M-/"         . company-complete)
   ("H-="         . (lambda () 
                      (interactive)
                      (paredit-blink-paren-match t)))
   ("M-x"         . execute-extended-command)
   ("M-<return>"  . find-thing-at-point)
   ("s-."         . point-ring-insert)
   ("s-/"         . point-ring-next)
   ("s-,"         . point-ring-previous)
   ("H-t"         . toggle-truncate-lines)
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
   ("C-z"         . ibuffer)
   ("C-x C-e"     . eval-last-sexp)
   ("C-H-<down>"  . doremi-recent)
   ("C-x f"     . recentf-ido-find-file)
   ("C-x C-f"     . anything-mini)   
   ("H-d t"       . doremi-color-themes+)
   ("H-d h"       . doremi-window-height+)
   ("C-?"         . sel-disp)
   ("C-t"         . toggle-etp)
   ("H-d m"       . doremi-marks+)
   ("H-d g"       . doremi-global-marks+)
   ("H-s"         . fixup-whitespace)
   ("M-z"         . dired-jump)
   ("C-x g"       . magit-status)
   ("s-s"         . shell)
   ("<S-left>"    . windmove-left)
   ("<S-right>"   . windmove-right)
   ("<S-down>"    . windmove-down)
   ("<S-up>"      . windmove-up)
   ([mouse-3]     . dired-jump)
   ("M-z"         . dired-jump)
   ("H-p"         . push-point)
   ("M-j"         . jump-to-register)
   ("H-w"         . shell-to-here)
   ("M->"         . pop-tag-mark)
   ("H-r"         . anything-show-kill-ring)
   ("H-r"         . anything-show-kill-ring)
   ("H-r"         . anything-show-kill-ring)
   ("H-r"         . anything-show-kill-ring)
   ("H-r"         . anything-show-kill-ring)

   ("s-f" . ns-toggle-fullscreen)
   ("s-1"         . recentf-open-most-recent-file-2)
   ("s-2"         . recentf-open-most-recent-file-1)
   ("s-3"         . recentf-open-most-recent-file-3)
   ("s-4"         . recentf-open-most-recent-file-4)
   ("s-5"         . recentf-open-most-recent-file-5)
   ("s-6"         . recentf-open-most-recent-file-6)
   ("s-7"         . recentf-open-most-recent-file-7)
   ("s-8"         . recentf-open-most-recent-file-8)
   ("s-9"         . recentf-open-most-recent-file-9)
   ("s-0"         . recentf-open-most-recent-file-0)

   
   ))

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

(lazy-set-key
 '(("C-x C-e" . slime-eval-last-expression)
   ("C-c C-v" . slime-eval-buffer))
 clojure-mode-map)


(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cr" 'org-remember)
(global-set-key "\C-cj" 'org-journal-entry)




(lazy-set-key
 '(("C-n"   . company-select-next)
   ("C-p"   . company-select-preious)
   ("C-d"   . company-show-doc-buffer)
   ("C-v"   . company-show-location)
   ("C-g"   . (lambda ()
                (interactive)
                (company-abort)))
   ("<ESC>" . (lambda ()
                (interactive)
                (company-abort)))
   ("H-z"   . (lambda ()
                (interactive)
                (test-comp))))
 company-active-map)

(lazy-set-key
 '(("<ESC>" . keyboard-escape-quit))
 minibuffer-local-map)

(require 'ido)

;; (lazy-set-key
;;  '(("<ESC>" . keyboard-escape-quit))
;;  ido-common-completion-map)

;; (lazy-set-key
;;  '(("<ESC>" . keyboard-escape-quit))
;;  ido-file-completion-map)

(lazy-set-key
 '(("<left>" . dired-prev-dirline)
   ("<right>" . dired-next-dirline)
   ("q" . dired-unmark-all-marks)
   
   )
 dired-mode-map)
(lazy-set-key
 '(("H-j s" . rails-find:stylesheets)
   ("H-j j" . rails-find:javascripts)
   ("H-j g" . rails-find:migrate)
   ("H-j i" . rails-find:config)
   ("H-j c" . rails-find:controller)
   ("H-j v" . rails-find:view)
   ("H-j a" . rails-find:layout)
   ("H-j m" . rails-find:models)
   ("H-j l" . rails-goto-file-on-current-line))
 rails-minor-mode)

(provide 'starter-kit-bindings)

