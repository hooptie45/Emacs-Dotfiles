(provide 'starter-kit-slime)
(setq slime-protocol-version 'ignore) 

(add-hook 'slime-repl-mode-hook 'clojure-mode-font-lock-setup)
(add-to-list 'load-path (concat dotfiles-dir "vendor/org-mode/lisp"))

