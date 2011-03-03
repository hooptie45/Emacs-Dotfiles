(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
(add-to-list 'load-path "~/elisp")

(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-dir (concat dotfiles-dir user-login-name))

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(add-to-list 'load-path user-specific-dir)

(if (file-exists-p system-specific-config) (load system-specific-config))

(require 'package)

(package-initialize)

(require 'starter-kit-elpa)

(menu-bar-mode)
(setq paredit-space-for-delimiter-predicates "")

(load "~/.emacs.d/elpa/paredit-20/paredit-autoloads")
(load "~/.emacs.d/elpa/paredit-20/paredit")

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'starter-kit-slime)
(require 'starter-kit-defuns)
(require 'starter-kit-misc)
(require 'starter-kit-yasnippet)
(require 'starter-kit-real-auto-save)
(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-perl)
(require 'starter-kit-ruby)
(require 'starter-kit-js)
(require 'starter-kit-bindings)
(require 'starter-kit-anything)
(require 'starter-kit-project)
(require 'recentf)

(if (file-exists-p user-specific-config) (load user-specific-config))
(if (file-exists-p user-specific-dir)
  (mapc #'load (directory-files user-specific-dir nil ".*el$")))

(load custom-file 'noerror)

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
      (insert-char ?- 77))
    )
  (line-move 1))

(ido-mode -1)
(menu-bar-mode)
(anything-mini)
(setq magit-git-executable "/usr/local/bin/git")

(defun my-backup-file-name (fpath)
  "Return a new file path of a given file path.
If the new path's directories does not exist, create them."
  (let (backup-root bpath)
    (setq backup-root "~/.emacs.d/emacs-backup")
    (setq bpath (concat backup-root fpath "~"))
    (make-directory (file-name-directory bpath) bpath)
    bpath))

(setq make-backup-file-name-function 'my-backup-file-name)
(defun semnav-up (arg)
  (interactive "p")
  (when (nth 3 (syntax-ppss))
    (if (> arg 0)
        (progn
          (skip-syntax-forward "^\"")
          (goto-char (1+ (point)))
          (decf arg))
      (skip-syntax-backward "^\"")
      (goto-char (1- (point)))
      (incf arg)))
  (up-list arg))

(defun extend-selection (arg &optional incremental)
  "Mark the symbol surrounding point.
Subsequent calls mark higher levels of sexps."
  (interactive (list (prefix-numeric-value current-prefix-arg)
                     (or (and transient-mark-mode mark-active)
                         (eq last-command this-command))))
  (if incremental
      (progn
        (semnav-up (- arg))
        (forward-sexp)
        (mark-sexp -1))
    (if (> arg 1)
        (extend-selection (1- arg) t)
      (if (looking-at "\\=\\(\\s_\\|\\sw\\)*\\_>")
          (goto-char (match-end 0))
        (unless (memq (char-before) '(?\) ?\"))
          (forward-sexp)))
      (mark-sexp -1))))
