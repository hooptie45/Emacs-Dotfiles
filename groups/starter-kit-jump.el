;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (defvar hud-last-buffer nil)                                              ;;
;; (defvar hud-last-window nil)                                              ;;
;; (defvar hud-window-height 20) ; percentage for shell-buffer window height ;;
;; (defvar hud-window-position "bottom")                                     ;;
;;                                                                           ;;
;; (defvar hud-internal-mode "repl")                                         ;;
;; (defvar hud-internal-mode-buffer "*NP*")                                  ;;
;; (defvar hud-internal-mode-func '(lambda () ))                             ;;
;; (defvar hud-internal-mode-shell "/bin/bash")                              ;;
;;                                                                           ;;
;; (recentf-open-files)                                                      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun jump-cancel-dialog (&rest ignore)
  "Cancel the current dialog.
IGNORE arguments."
  (interactive)
  (kill-buffer (current-buffer))
  (message "Dialog canceled"))

(defun new-jump-buf ()
  (interactive)
  (let* ((current (current-buffer))
         (np (get-buffer-create "* NP*"))
         (bl (loop for i from 1 to 10
                for b in recentf-list 
                collect b)))
    (with-current-buffer np

      (let* ((inhibit-read-only t))
        (erase-buffer)
        (remove-overlays)
        (setq widget-demo-current name)
        (erase-buffer)
        (mapc (lambda (b)
                (progn (widget-insert "\n")
                       (widget-create 'file-link
                                    
                                      :value b
                                      :tag (file-name-nondirectory b))) ) bl) 
        (widget-setup)
        (pop-to-buffer np))
      
      )))

  (provide 'starter-kit-jump)

;;; hud.el ends here.

