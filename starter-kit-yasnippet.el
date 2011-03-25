
(add-to-list 'load-path (concat dotfiles-dir "/yasnippet"))

(require 'yasnippet)

(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet/snippets")
(provide 'starter-kit-yasnippet)

