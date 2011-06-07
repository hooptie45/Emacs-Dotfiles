(provide 'starter-kit-buffers)

(if (some (lambda (f)
            (locate-dominating-file (buffer-file-name) f)) '("project.clj" "init.el")
            )
    t)
