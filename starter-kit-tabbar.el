(require 'tabbar)
(tabbar-mode 1)
(tabbar-mwheel-mode 1)

(defadvice ido-find-file)

(provide 'starter-kit-tabbar)
;;; starter-kit-defuns.el ends here



 (defadvice my-ido-find-file (around ido-find-file)
       "Insert an empty line when moving up from the top line."
       (kill-buffer " *anything-complete*"))



