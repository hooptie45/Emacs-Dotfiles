(add-hook 'shell-mode-hook
          (lambda ()
            (lazy-set-key '(("C-k" . (lambda ()
                                       (interactive)
                                       (kill-new (concat "\n" (anything-get-selection)))
                                       (anything-next-line)))

                            ("<ESC>" . (lambda ()

                                         (interactive)
                                         
                                         (anything-keyboard-quit)
                                         (anything-kill-buffers)))
                            ("C-<up>" . comint-previous-input)

                            ("<up>" . comint-previous-input)                                                                                                
                            ("<down>" . comint-next-input))
                          shell-mode-map)))

(add-hook 'coding-hook 'company-mode)
(dired-details-install)
(setq-default dired-details-hidden-string "=> ")

(add-hook 'dired-load-hook 'dired-omit-mode)
(add-hook 'dired-load-hook 'dired-details-activate)
(add-hook 'dired-mode-hook
          (lambda ()
            (lazy-set-key '(("<left>" . dired-up-directory)
                            ("<down>" . comint-next-input)
                            ("<right>" . dired-tree-down))
            
                          dired-mode-map)))

(lazy-unset-key '("<down>"
                              "<right>")
                          dired-mode-map)
(add-hook 'dired-mode-hook
          (lambda ()
            
            (lazy-set-key '(("<left>" . dired-up-directory)
                            ("M-i" . (lambda () (setq dired-omit-files (concat dired-omit-files (dired-file-name-at-point)))))
                            ("<down>" . dired-next-line)
                            ("<right>" . dired-find-file))

                          
                          dired-mode-map)))


(setq dired-trivial-filenames "^\\.\\.?$\\|^#\\|\\~$")

(add-hook 'dired-load-hook 'dired-details-activate)

(setq dired-load-hook nil)
(setq dired-mode-hook nil)


(setq dired-find-subdir t)

(setq dired-omit-files)
(provide 'starter-kit-hooks)
