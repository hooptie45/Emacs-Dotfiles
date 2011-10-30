(setq org-protocol-protocol-alist nil)
(require 'org-protocol)
(setq org-protocol-protocol-alist nil)
(add-to-list 'org-protocol-protocol-alist
             '("Hello World"
               :kill-client t
            
               :protocol "spec"
               :function my-hello-world))
(defvar np-input nil)



(defun my-hello-world (d)
  "Doc for [yas] elisp error! Symbol's value as variable is void: my-hello-world"
  
  
  (setq np-input (push
                  (split-string d "###NP###")
                       np-input))

  nil
  )
(rspec-mode)
(provide 'starter-kit-protocols)
(sh "rspec font-family: ...")

