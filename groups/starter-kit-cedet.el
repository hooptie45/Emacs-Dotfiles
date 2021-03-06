;;; starter-kit-cedet.el --- addfdf


;;; Commentary:
;; 

(require 'cedet)
(require 'semantic)
(require 'srecode)
;;; Code:

(global-srecode-minor-mode 1)

(setq semantic-load-enable-semantic-debugging-helpers t)

(provide 'starter-kit-cedet)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; emacs-rc-cedet.el ---

;; Copyright (C) 2003 Alex Ott
;;
;; Author: alexott@gmail.com
;; Keywords:
;; Requirements:
;; Status: not intended to be distributed yet



(require 'cedet)

;; (semantic-load-enable-excessive-code-helpers)
;; (semantic-load-enable-semantic-debugging-helpers)

;; (setq senator-minor-mode-name "SN")
;; (setq semantic-imenu-auto-rebuild-directory-indexes 1)
;; (global-srecode-minor-mode 1)
;; (global-semantic-mru-bookmark-mode 1)

;; (require 'semantic-decorate-include)

;; ;; gcc setup
;; (require 'semantic-gcc)

;; ;; smart complitions

;; (setq-mode-local c-mode semanticdb-find-default-throttle
;;                  '(project unloaded system recursive))
;; (setq-mode-local c++-mode semanticdb-find-default-throttle
;;                  '(project unloaded system recursive))
;; (setq-mode-local erlang-mode semanticdb-find-default-throttle
;;                  '(project unloaded system recursive))
(setq-mode-local objc-mode semanticdb-find-default-throttle
                 '(project recursive unloaded system ))

(require 'eassist)

;; customisation of modes
(defun alexott/cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  ;;
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)

  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  )
(add-hook 'semantic-init-hooks 'alexott/cedet-hook)
(add-hook 'c-mode-common-hook 'alexott/cedet-hook)
(add-hook 'lisp-mode-hook 'alexott/cedet-hook)
(add-hook 'scheme-mode-hook 'alexott/cedet-hook)
(add-hook 'emacs-lisp-mode-hook  'alexott/cedet-hook)
(add-hook 'erlang-mode-hook 'alexott/cedet-hook)
(add-hook 'objc-mode-hook 'alexott/cedet-hook)
(add-hook 'objj-mode-hook 'alexott/cedet-hook)

(defun alexott/c-mode-cedet-hook ()
  (local-set-key [(control return)] 'semantic-ia-complete-symbol-menu)
  (local-set-key "\C-c?" 'semantic-ia-complete-symbol)
  ;;
  (local-set-key "\C-c>" 'semantic-complete-analyze-inline)
  (local-set-key "\C-c=" 'semantic-decoration-include-visit)

  (local-set-key "\C-cj" 'semantic-ia-fast-jump)
  (local-set-key "\C-cq" 'semantic-ia-show-doc)
  (local-set-key "\C-cs" 'semantic-ia-show-summary)
  (local-set-key "\C-cp" 'semantic-analyze-proto-impl-toggle)
  
  (local-set-key "." 'semantic-complete-self-insert)
  (local-set-key ">" 'semantic-complete-self-insert)
  (local-set-key "\C-ct" 'eassist-switch-h-cpp)
  (local-set-key "\C-xt" 'eassist-switch-h-cpp)
  (local-set-key "\C-ce" 'eassist-list-methods)
  (local-set-key "\C-c\C-r" 'semantic-symref)
  (local-set-key (kbd "M-m") 'eassist-list-methods)
  )
(add-hook 'c-mode-common-hook 'alexott/c-mode-cedet-hook)

;; hooks, specific for semantic
(defun alexott/semantic-hook ()
  ;; (semantic-tag-folding-mode 1)
  (imenu-add-to-menubar "TAGS")
  )
(add-hook 'semantic-init-hooks 'alexott/semantic-hook)

(custom-set-variables
 '(semantic-idle-scheduler-idle-time 1)
 '(semantic-self-insert-show-completion-function
   (lambda nil (semantic-ia-complete-symbol-menu (point))))
 '(global-semantic-tag-folding-mode t nil (semantic-util-modes)))
(global-semantic-folding-mode 1)





;;
;; (semantic-add-system-include "/opt/local/include" 'c++-mode)
;; (semantic-add-system-include "/opt/local/include" 'c-mode)
;; (semantic-add-system-include "~/src/cappuccino" 'objc-mode)

;;
(defun my-c-mode-common-hook ()
  (define-key c-mode-base-map (kbd "M-o") 'eassist-switch-h-cpp)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


(define-key lisp-mode-shared-map (kbd "M-m") 'eassist-list-methods)

(provide 'starter-kit-cedet)

;;; starter-kit-cedet.el ends here
