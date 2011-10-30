;;; starter-kit-registers.el --- Set up registers
;;
;; Part of the Emacs Starter Kit

;; Registers allow you to jump to a file or other location
;; quickly. Use C-x r j followed by the letter of the register (i for
;; init.el, r for this file) to jump to it.

;; You should add registers here for the files you edit most often.
(dolist (r `((?i (file . ,(concat dotfiles-dir "init.el")))
             (?p (file . "~/.zshrc"))
             (?t (file . ,(concat dotfiles-dir "groups/color-theme-nanarpuss.el")))
             (?u (file . ,(concat dotfiles-dir "custom.el")))
             (?b (file . ,(concat dotfiles-dir "groups/starter-kit-bindings.el")))
             (?g (file . ,(concat dotfiles-dir "groups/")))
             (?h (file . ,(concat dotfiles-dir "hooptie45.el")))
             (?r (file . ,(concat dotfiles-dir "groups/starter-kit-registers.el")))
             (?d (file . ,(concat dotfiles-dir "groups/starter-kit-defuns.el")))
             (?n (file . ,(concat org-default-notes-file)))
             (?V (file . ,(concat dotfiles-dir "vendor")))
             (?D (file . ,(concat (expand-file-name "~/") "DEV")))
             (?O (file . ,(concat "~/" "org")))
             (?o (file . ,(concat "~/" "org/notes.org")))
             (?R (file . ,(concat "~/" "DEV/Ruby")))
             (?N (file . ,(concat "~/" "DEV/Node")))
             (?Y (file . ,(concat "~/" "DEV/YUI")))
             (?J (file . ,(concat "~/" "DEV/CLJ")))
             (?L (file . ,(concat "~/" "Downloads")))
             (?C (file . ,(concat "~/" "DEV/Capp")))
             (?c (file . ,(concat "~/" "cedet/semantic")))
             (?s ,(set-marker (make-marker) 1
                              (get-buffer-create "*scratch*")))
             (?S (file . ,(concat "~/" "src/")))))
  
  (set-register (car r) (cadr r)))

(setq magit-save-some-buffers 'dontask)




(file-exists-p (concat (expand-file-name "~/")))
(provide 'starter-kit-registers)
;;; starter-kit-registers.el ends here
