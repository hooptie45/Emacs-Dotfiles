
(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))

(add-to-list 'load-path "~/.emacs.d")

(add-to-list 'load-path (concat dotfiles-dir "/elpa-to-submit"))
(add-to-list 'load-path "~/elisp")
(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq package-user-dir (concat dotfiles-dir "elpa"))
(setq custom-file (concat dotfiles-dir "custom.el"))

(normal-top-level-add-subdirs-to-load-path )

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(setq system-specific-config (concat dotfiles-dir system-name ".el")
      user-specific-config (concat dotfiles-dir user-login-name ".el")
      user-specific-dir (concat dotfiles-dir user-login-name))

(add-to-list 'load-path user-specific-dir)

(if (file-exists-p system-specific-config) (load system-specific-config))


(require 'package)
(add-to-list 'package-archives
             '("marmalade" . 
               "http://marmalade-repo.org/packages/") t)
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

(server-start)
(menu-bar-mode)





(defun new-init (name)
  (interactive "sName: ")
  (find-file (concat dotfiles-dir "starter-kit-" name ".el"))
  (insert (concat "(provide 'starter-kit-") name ")"))


(require 'doremi-mac)
(require 'doremi-cmd)

  (anything-read-string-mode -1)
(put 'downcase-region 'disabled nil)

(require 'magit)

(require 'org)

(require 'org-protocol)
(setq org-capture-templates
  '(
     ("w" "" entry ;; 'w' for 'org-protocol'
       (file+headline "www.org" "Notes")
       "* %^{Title}\n\n  Source: %u, %c\n\n  %i")
     ;; other templates
    ))





(defadvice ido-prev-match (after ido-prev-match activate)
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
(global-set-key (kbd "C-k") 'kill-and-join-forward) 


(require 'imenu)

(defun ido-goto-symbol ()
  "Will update the imenu index and then use ido to select a symbol to navigate to"
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
	(symbol-names '()))
    (flet ((addsymbols (symbol-list)
             (when (listp symbol-list)
               (dolist (symbol symbol-list)
                 (let ((name nil) (position nil))
                   (cond
                     ((and (listp symbol) (imenu--subalist-p symbol))
                      (addsymbols symbol))
                     ((listp symbol)
                      (setq name (car symbol))
                      (setq position (cdr symbol)))
                     ((stringp symbol)
                      (setq name symbol)
                      (setq position (get-text-property 1 'org-imenu-marker symbol))))
                   (unless (or (null position) (null name))
                     (add-to-list 'symbol-names name)
                     (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
	   (position (cdr (assoc selected-symbol name-and-pos))))
      (if (markerp position)
	  (goto-char position) (goto-char (overlay-start position))))))



(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq comint-prompt-read-only t)
;(shell)



;;;;;;;;;;;;;;;

(setq backup-directory-alist
      '(("." . "~/.emacs-d/.emacs-backups")))
(setq version-control t)
(setq delete-old-versions 1)
(setq kept-new-versions 1000)
(setq kept-old-versions 1000)
(setq backup-by-copying t)
(add-hook 'before-save-hook 
          '(lambda ()
            (setq buffer-backed-up nil)))

(toggle-truncate-lines 1)
(setq-default truncate-lines t)
(setq-default truncate-partial-width-windows t)

;;;;;;;;;;;;;;;;;;

(defun pabbrev-expand-maybe-no-buffer()
  "Expand abbreviation, or run previous command.
If there is no expansion the command returned by
`pabbrev-get-previous-binding' will be run instead."
  (interactive)
  (if pabbrev-expansion
      (pabbrev-expand)
      (let ((prev-binding
             (pabbrev-get-previous-binding)))
        (if (and (fboundp prev-binding)
		 (not (eq prev-binding 'pabbrev-expand-maybe)))
	    (funcall prev-binding)))))


(require 'pabbrev )
(global-pabbrev-mode 1)
(setq pabbrev-read-only-error nil)
(require 'palette)
(require 'facemenu+)
(require 'rotate-text)



(require 'toolbox)


(require 'js2-mode-autoloads)



(setq IS-MON-P-W32 nil)
(setq IS-W32-P nil)
(setq IS-BUG-P-REMOTE nil)
(setq IS-BUG-P nil)
(setq *mon-emacs-root* "~/.emacs.d")








(load "starttls") 
(load-library "smtpmail")

(setq user-mail-address "hooptie45@gmail.com") 
(setq user-full-name "Shaun Hannah") 
;; Configure incoming mail (IMAP) 
(setq gnus-select-method '(nnimap "gmail" 
                           (nnimap-address "imap.gmail.com") 
                           (nnimap-server-port 993) 
                           (nnimap-authinfo-file "~/.imap-authinfo") 
                           (nnimap-stream ssl))) 
;; Configure outbound mail (SMTP) 
(setq smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil)) 
      smtpmail-smtp-server "smtp.gmail.com" 
      smtpmail-default-smtp-server "smtp.gmail.com" 
      send-mail-function 'smtpmail-send-it 
      message-send-mail-function 'smtpmail-send-it 
      smtpmail-smtp-service 587 
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "usern...@gmail.com" 
                                   nil)) 
      smtpmail-debug-info t 
      smtpmail-debug-verb t 
      ) 
(setq smtpmail-local-domain nil) 
(setq gnus-permanently-visible-groups "gmail") 
(executable-find starttls-program) 



