(provide 'custom-init-pom)

(defun make-pom ()
  (interactive)
  (switch-to-buffer (get-buffer-create "pom.xml"))
  (insert "pom"))


