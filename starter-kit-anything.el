
(require 'anything)
(require 'anything-config)
(load "~/elisp/anything-startup.el")
(define-key anything-map  (kbd "<tab>") 'anything-execute-persistent-action)
(define-key clojure-mode-map (kbd "M-/") 'slime-fuzzy-complete-symbol)
(provide 'starter-kit-anything)
