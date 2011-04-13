(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'hyper)
(setq mac-function-modifier 'super)
(find-file "~/.emacs.d/init.el")
(setq dotfiles-dir "~/.emacs.d/")
(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'load-path "~/elisp/")
(normal-top-level-add-subdirs-to-load-path)
(require 'paredit)
(require 'color-theme)
(require 'color-theme-nanarpuss)
(color-theme-nanarpuss)
(require 'find-func-extension)
(require 'find-func+)
(require 'align (concat dotfiles-dir "align.el"))

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
(require 'dired-details)
(require 'starter-kit-yasnippet)
(require 'starter-kit-real-auto-save)
(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-perl)
(require 'starter-kit-ruby)
(require 'starter-kit-js)
(require 'starter-kit-bindings)
(require 'hooptie45)
(server-start)
(menu-bar-mode)
(anything-read-string-mode -1)


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
      '((".*" . "~/.emacs.d/.emacs-backups")))

(setq version-control t)

(setq kept-new-versions 1000)
(setq kept-old-versions 1000)
(setq backup-by-copying t)
(setf my-ignore-dirs  (list "loaddefs.el " "Trash" "vendor" ".git" "SVN" ".svn" "save" "swank" "slime" "elpa" "snippets" "backups"
                            "emacs-backup" "trash" "emacs-ide" "emacs-nav" "~" "#" "auto-save-list" "elc" "places"
                            "elpa-to-submit/jabber/jabber.info" "thumbs" "oddmuse" ".newsrc-dribble" ".nnmail-cache"
                            "#.newsrc-dribble#" ".svn" ".DS_Store" "image-dired" "elim" "session" "tramp" "history"
                            "anything-c-adaptive-history" "trash" "yasnippet" "/js.js" "ido/.ido.last" "frequencies"))
(add-hook 'before-save-hook 
          '(lambda ()
            (setq buffer-backed-up nil)))


(setf findr-skip-directory-regexp (regexp-opt my-ignore-dirs))
(setf grep-find-ignored-directories (regexp-opt my-ignore-dirs))
(setf slime-close-all-parens-in-sexp)
(setf vc-ignore-vc-files)
(setf ido-ignore-directories-merge)
(setf ido-ignore-buffers)
(setf iswitchb-buffer-ignore)


(setf grep-find-ignored-directories (regexp-opt my-ignore-dirs))
(setf hippie-expand-verbose nil)
(buffer-enable-undo)
(setf another-line-p t)
(global-undo-tree-mode)
(setq hippie-expand-try-functions-list     
      (quote (try-expand-dabbrev
              try-expand-line-all-buffers
              try-complete-lisp-symbol
              try-complete-lisp-symbol-partially
              yas/hippie-try-expand
              try-expand-dabbrev-from-kill
              try-expand-all-abbrevs
              try-expand-dabbrev-all-buffers
              try-expand-list-all-buffers
              try-expand-dabbrev-visible
              try-expand-whole-kill)))
(setq mode-line-in-non-selected-windows t)


(global-set-key (kbd "H-l") '(lambda (p) 
                              (interactive "d")
                              
                              (cl-prettyprint (thing-nearest-point 'defun))
                              (describe-text-properties p)))



(defun np-theme-add (pos)
  (interactive "d")
  
  (if (or (text-properties-at pos) (overlays-at pos))
      (nanarpuss-help-window-open (face-at-point) (face-attr-construct (face-all-attributes (or (get-char-property pos  'read-face-name)
                                                                             (get-char-property pos 'face)))))
      (message "BLANK")))


(defun foreground-color-at-point ()
  "Return the foreground color of the character after point."
  ;; `face-at-point' alone is not sufficient.  It only gets named faces.
  ;; Need also pick up any face properties that are not associated with named faces.
  (let ((face (or (face-at-point)
                  (get-char-property (point) 'read-face-name)
                  (get-char-property (point) 'face))))

    (cond ((and face (symbolp face))
           (let ((value (face-foreground face nil 'default)))
             (if (member value '("unspecified-fg" "unspecified-bg"))
                 nil
                 value)))
          ((consp face)
           (cond ((memq 'foreground-color face) (cdr (memq 'foreground-color face)))
                 ((memq ':foreground face) (cadr (memq ':foreground face)))))
          (t nil))))
