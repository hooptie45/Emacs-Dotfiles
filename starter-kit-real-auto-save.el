

    (require 'real-auto-save)
(add-hook 'text-mode-hook 'turn-on-real-auto-save)
(add-hook 'clojure-mode-hook 'turn-on-real-auto-save)
(add-hook 'emacs-lisp-mode-hook 'turn-on-real-auto-save)

    (add-hook 'muse-mode-hook 'turn-on-real-auto-save)



    (setq real-auto-save-interval 5) ;; in seconds
(provide 'starter-kit-real-auto-save)
