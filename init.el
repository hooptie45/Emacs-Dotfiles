(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'hyper)
(setq mac-function-modifier 'super)
(find-file "~/.emacs.d/init.el")
(setq dotfiles-dir "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d")
(normal-top-level-add-subdirs-to-load-path)
(normal-top-level-add-subdirs-to-load-path)
(require 'paredit)
(require 'hooptie45)
(require 'color-theme)
(require 'color-theme-nanarpuss)
(color-theme-nanarpuss)
(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'paredit)
(require 'starter-kit-defuns)
(require 'clojure-mode)
(require 'starter-kit-misc)
(require 'anything)
(require 'anything-config)
(require 'lazy-set-key)

(require 'starter-kit-yasnippet)
(require 'starter-kit-real-auto-save)
(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-perl)
(require 'starter-kit-ruby)
(require 'starter-kit-js)
(require 'starter-kit-bindings)

(server-start)
(menu-bar-mode)
(anything-read-string-mode -1)
(defadvice ido-prev-match (before ido-prev-match activate)
  (let* ((sym  (intern (car ido-cur-list)) obarray ))
    (cond ((functionp sym)
           (describe-function sym))
          ((boundp sym)
           (if (> 10000 (length (format "%s" sym)))
               (describe-variable sym))))))

(defadvice ido-next-match (after ido-next-match activate)
  (let* ((sym  (intern (car ido-cur-list)) obarray ))
    (cond ((functionp sym)
           (describe-function sym))
          ((boundp sym)
           (if (> 10000 (length (format "%s" sym)))
               (describe-variable sym))))))

(require 'magit)

 
(defadvice yank-pop (after indent-region activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode
                                c-mode c++-mode objc-mode
                latex-mode plain-tex-mode))
      (let ((mark-even-if-inactive t))
        (indent-region (region-beginning) (region-end) nil))))

(defun kill-and-join-forward (&optional arg)
  "If at end of line, join with following; otherwise kill line.
    Deletes whitespace at join."
  (interactive "P")
  (if (and (eolp) (not (bolp)))
      (delete-indentation t)
    (kill-line arg)))



(require 'imenu)
(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq comint-prompt-read-only t)

(setq backup-directory-alist
      '(("." . "~/.emacs.d/.emacs-backups")))
(setq version-control t)
(setq delete-old-versions 1)
(setq kept-new-versions 1000)
(setq kept-old-versions 1000)
(setq backup-by-copying t)
(add-hook 'before-save-hook 
          '(lambda ()
            (setq buffer-backed-up nil)))





