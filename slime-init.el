(provide 'slime-init)
(add-to-list 'load-path "~/slime")
(add-to-list 'load-path "~/slime/contrib")
(require 'slime)
(require 'slime-fancy)

(slime-setup '(slime-fancy slime-repl inferior-slime))
