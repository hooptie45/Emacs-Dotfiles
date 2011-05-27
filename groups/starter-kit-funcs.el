(provide 'starter-kit-funcs)

(defun new-init (name)
  (interactive "sName: ")
  (find-file (concat dotfiles-dir "custom-inits" ".el"))
  (insert (concat "\n(require 'custom-init-") name ")\n")
  (find-file (concat dotfiles-dir "custom-init-" name ".el"))
  (insert (concat "(provide 'custom-init-") name ")"))
