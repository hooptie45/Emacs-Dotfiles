

    (require 'real-auto-save)
    (add-hook 'text-mode-hook 'turn-on-real-auto-save)
(add-hook 'muse-mode-hook 'turn-on-real-auto-save)

(add-hook 'muse-mode-hook 'turn-on-real-auto-save)

(add-hook 'org-mode-hook 'turn-on-real-auto-save)
(add-hook 'coffee-mode-hook 'turn-on-real-auto-save)



    (setq real-auto-save-interval 5) ;; in seconds
(provide 'starter-kit-real-auto-save)
