
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode)))

(defun emacs-init-files-git (file)
  
  (let (ret)
   (condition-case ex
       (progn
         (load file nil)
         (setq ret t))
     ('error
      (progn
        (message "errors!!! %s" ex)

        (setq ret nil))))
   ret))

(provide 'starter-kit-dired)
