
(require 'anything)
(require 'anything-config)
(load "~/elisp/anything-startup.el")
;; (define-key anything-map  (kbd "<tab>") 'anything-select-action)
;; (define-key clojure-mode-map (kbd "M-/")
;; 'slime-fuzzy-complete-symbol)
(defvar anything-source-port
  '((name . "Mac Port List")
    (init . anything-port-init)
    (candidates-in-buffer)
    (display-to-real . anything-c-top-display-to-real)
    (persistent-action . (lambda (port) (anything-c-top-sh (format "/opt/local/bin/port info %s" port))))
    (action
     ("Install" . (lambda (port) (anything-port-actions port :action 'install)))
     ("UnInstall" . (lambda (port) (anything-port-actions port :action 'uninstall)))
     )))

(defun anything-port-actions (port &key action)
  "thisandthat."
  (ansi-term (getenv "SHELL") "+Anything MacPort Actions")
  (term-line-mode)
  (let* (end 
         (beg (point-min))                  
         (port-cmd "sudo -p Password: /opt/local/bin/port %s %s")
         (command (format port-cmd (symbol-name action) port)))
    
    (goto-char (point-max))
    (insert command)
    (setq end (point))

    (if (yes-or-no-p  (format "Really %s %s?" (symbol-name action) port))
      (progn
        (term-char-mode)
        (term-send-input))
      (delete-region beg end) (term-send-eof) (kill-buffer))))


(defun anything-port ()
  "thisandthat."
  (interactive)
  (let (a)
    
    (anything-other-buffer 'anything-source-port "*anything MacPorts*")))
(defun anything-port-init ()
  "thisandthat."
  (interactive)
  
  (let ((port-cmd "/opt/local/bin/port list")
        (buff (anything-candidate-buffer 'global)))
    (with-current-buffer buff 
      (call-process-shell-command port-cmd nil (current-buffer)))))


(provide 'starter-kit-anything)
