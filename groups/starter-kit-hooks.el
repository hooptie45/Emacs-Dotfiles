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
<<<<<<< HEAD
=======

>>>>>>> configs
(setq-default dired-details-hidden-string "=> ")

(add-hook 'dired-load-hook 'dired-omit-mode)
(add-hook 'dired-load-hook 'dired-details-activate)
(add-hook 'dired-mode-hook
          (lambda ()
            (lazy-set-key '(("<left>" . dired-up-directory)
                            ("<down>" . comint-next-input)
                            ("<right>" . dired-tree-down))
<<<<<<< HEAD
            
                          dired-mode-map)))

(lazy-unset-key '("<down>"
                              "<right>")
                          dired-mode-map)
(add-hook 'dired-mode-hook
          (lambda ()
            
=======
                          
                          dired-mode-map)))

(lazy-unset-key '("<down>"
                  "<right>")
                dired-mode-map)
(add-hook 'dired-mode-hook
          (lambda ()
            (dired-omit-mode)
>>>>>>> configs
            (lazy-set-key '(("<left>" . dired-up-directory)
                            ("M-i" . (lambda () (setq dired-omit-files (concat dired-omit-files (dired-file-name-at-point)))))
                            ("<down>" . dired-next-line)
                            ("<right>" . dired-find-file))

                          
                          dired-mode-map)))

<<<<<<< HEAD
=======
(add-hook 'dired-mode-hook
          (lambda ()
            (dired-omit-mode)
            ))
>>>>>>> configs

(setq dired-trivial-filenames "^\\.\\.?$\\|^#\\|\\~$")

(add-hook 'dired-load-hook 'dired-details-activate)

<<<<<<< HEAD
=======

>>>>>>> configs
(setq dired-load-hook nil)
(setq dired-mode-hook nil)


(setq dired-find-subdir t)

(setq dired-omit-files)
<<<<<<< HEAD
(provide 'starter-kit-hooks)
=======




(defun bh-choose-header-mode ()
  (interactive)
  (if (string-equal (substring (buffer-file-name) -2) ".h")
      (progn
        ;; OK, we got a .h file, if a .m file exists we'll assume it's
                                        ; an objective c file. Otherwise, we'll look for a .cpp file.
        (let ((dot-m-file (concat (substring (buffer-file-name) 0 -1) "m"))
              (dot-cpp-file (concat (substring (buffer-file-name) 0 -1) "cpp")))
          (if (file-exists-p dot-m-file)
              (progn
                (objc-mode))
            (if (file-exists-p dot-cpp-file)
                (c++-mode)))))))

(add-hook 'find-file-hook 'bh-choose-header-mode)


(add-hook 'coffee-mode-hook '(lambda ()
                               (progn
                                 (setq coffee-debug-mode t)
                                 (and (file-exists-p (buffer-file-name))
                                      (file-exists-p (coffee-compiled-file-name))
                                      (coffee-cos-mode t))
                                 (define-key coffee-mode-map (kbd "C-c v") 'coffee-compile-buffer)
                                 (define-key coffee-mode-map (kbd "C-c C-c C-c") 'coffee-compile-buffer)

                                 
                                 
                                 (define-key coffee-mode-map (kbd "C-M-x") 'coffee-compile-region)
                                 (set (make-local-variable 'tab-width) 2))))


(add-hook 'js2-mode-hook '(lambda () 
                            (progn
                              (define-key js2-mode-map (kbd "C-c C-c C-c")
                                '(lambda () 
                                   (interactive)
                                   (if 
                                       (string= coffee-compiled-buffer-name (buffer-name))
                                       (kill-buffer))
                                   ))
                              (define-key js2-mode-map (kbd "C-c C-c C-c")
                                '(lambda () 
                                   (interactive)
                                   (if 
                                       (string= coffee-compiled-buffer-name (buffer-name))
                                       (kill-buffer)
                                     )
                                   ))
                              (define-key js2-mode-map (kbd "C-M-x")
                                '(lambda () 
                                   (interactive)
                                   (if 
                                       (string= coffee-compiled-buffer-name (buffer-name))
                                       (kill-buffer)
                                     )
                                   )))))






(provide 'starter-kit-hooks)
(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)
(add-to-list 'load-path (concat dotfiles-dir "vendor/org-mode/lisp"))

(setq dired-mode-hook
      '(
        (lambda nil
          (define-key dired-mode-map
            (kbd "<return>")
            'dired-find-alternate-file)
          (define-key dired-mode-map
            (kbd "^")
            (lambda nil
              (interactive)
              (find-alternate-file "..")))
          (define-key dired-mode-map
            (kbd "M-z")
            (lambda nil
              (interactive)
              (find-alternate-file "..")))
          (define-key dired-mode-map
            [mouse-3]
            (lambda nil
              (interactive)
              (find-alternate-file ".."))))
        dired-extra-startup
        (lambda nil
          (dired-details-hide))
        (lambda nil
          (dired-omit-mode 1))))

(setq  ido-enable-regexp t
       ido-show-dot-for-dired t
       ido-ignore-directories '("\\`CVS/")
       ido-enable-flex-matching t
       ido-auto-merge-delay-time 10)

(setq *after-select-window-hooks* nil)

(defun b4-save (f)
  "DOCSTRING"
  (interactive)
  

  )

(add-hook 'coding-hook
 	  (lambda () (subword-mode -1)))
(setq change-major-mode-hook nil)


>>>>>>> configs
