(require 'company (concat dotfiles-dir "company/" "company.el"))

(require 'slime-company)
(setq company-show-numbers t)


;; '(company-auto-complete (quote (quote company-explicit-action-p)))
(setq company-backends (quote (slime-company-backend
                               company-elisp                           
                               company-nxml
                               company-css                               
                               company-semantic
                               company-clang
                               (company-gtags
                                company-etags
                                company-dabbrev-code
                                company-keywords)
                               company-files)))


(setq company-tooltip-limit 20)
(setq global-company-mode nil)

;; (defun test-comp ()
;;   (interactive)
;;   (let* ((cur (nth company-selection company-candidates))
;;          (parts (split-string cur "-")))
;;     (message "%s" (car parts))
;;     (insert (company-strip-prefix (car parts)))
;;     (setq company-selection-changed t)
;;     (company-complete-common)))

(defun company-elisp (command &optional arg &rest ignored)
  "A `company-mode' completion back-end for `emacs-lisp-mode'."
  (interactive (list 'interactive))
  (case command
    ('interactive (company-begin-backend 'company-elisp))
    ('prefix (and (eq (derived-mode-p 'emacs-lisp-mode) 'emacs-lisp-mode)
                  (company-grab-lisp-symbol)))
    ('candidates
     )
    ('meta (company-elisp-doc arg))
    ('doc-buffer (let ((symbol (intern arg)))
                   (save-window-excursion
                     (when (or (ignore-errors (describe-function symbol))
                               (ignore-errors (describe-variable symbol)))
                       (help-buffer)))))
    ('location (let ((sym (intern arg)))
                 (or (ignore-errors (find-definition-noselect sym nil))
                     (ignore-errors (find-definition-noselect sym 'defvar))
                     (ignore-errors (find-definition-noselect sym t)))))))

(provide 'starter-kit-company)

