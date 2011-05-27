;;; starter-kit-registers.el --- Set up registers
;;
;; Part of the Emacs Starter Kit

;; Registers allow you to jump to a file or other location
;; quickly. Use C-x r j followed by the letter of the register (i for
;; init.el, r for this file) to jump to it.

;; You should add registers here for the files you edit most often.
(dolist (r `(

             (?i (file . ,(concat dotfiles-dir "init.el")))
             (?p (file . "~/.profile"))
             (?t (file . ,(concat dotfiles-dir "groups/color-theme-nanarpuss.el")))
             (?c (file . ,(concat dotfiles-dir "custom.el")))
             (?b (file . ,(concat dotfiles-dir "groups/starter-kit-bindings.el")))
             (?h (file . ,(concat dotfiles-dir "hooptie45.el")))
             (?r (file . ,(concat dotfiles-dir "groups/starter-kit-registers.el")))
             (?d (file . ,(concat dotfiles-dir "groups/starter-kit-defuns.el")))
             (?n (file . ,(concat dotfiles-dir "notes.org")))
             (?s ,(set-marker (make-marker) 1
                             (get-buffer-create "*scratch*"))))
         )
  
  (set-register (car r) (cadr r))
  )

(provide 'starter-kit-registers)
;;; starter-kit-registers.el ends here

