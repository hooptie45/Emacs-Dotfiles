;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit

;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Turn off mouse interface early in startup to avoid momentary display
;; You really don't need these; trust me.
;; Load path etc.

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

;; Load up ELPA, the package manager

(add-to-list 'load-path dotfiles-dir)

(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
(add-to-list 'load-path "~/elisp")
(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-dir (concat dotfiles-dir user-login-name))

(add-to-list 'load-path user-specific-dir)

(if (file-exists-p system-specific-config) (load system-specific-config))

(require 'package)

(package-initialize)
(require 'starter-kit-elpa)
(menu-bar-mode)
;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session
(setq paredit-space-for-delimiter-predicates "")
(load "~/.emacs.d/elpa/paredit-20/paredit-autoloads")
(load "~/.emacs.d/elpa/paredit-20/paredit")
(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)

(require 'recentf)

;; backport some functionality to Emacs 22 if needed

(if (file-exists-p user-specific-config) (load user-specific-config))
(if (file-exists-p user-specific-dir)
  (mapc #'load (directory-files user-specific-dir nil ".*el$")))
;; Load up starter kit customizations

(require 'starter-kit-defuns)

(require 'starter-kit-misc)
(require 'starter-kit-anything)

(require 'starter-kit-yasnippet)
(require 'starter-kit-real-auto-save)

(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-perl)
(require 'starter-kit-ruby)
(require 'starter-kit-js)
;; apply a function to all files in a dir

(require 'starter-kit-bindings)

(load custom-file 'noerror)

;; You can keep system- or user-specific customizations here




;;; init.el ends here

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
