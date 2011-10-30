
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'hyper)
(setq mac-function-modifier 'super)

(setq ring-bell-function 'ignore)

(add-to-list 'exec-path "/opt/local/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "~/bin")
(add-to-list 'exec-path "/opt/bin")
(add-to-list 'exec-path "/usr/bin")

(setq visual-bell nil)
(setq visible-bell nil)
;; Load path etc:  
(add-to-list 'load-path "~/elisp")

(mapc '(lambda (f)
         (require f)) '(
			wdired
                        anything
                        dired+
                        doremi
                        thing-cmds

                        anything-config
                        dired-x
                        wdired
                        cl
                        ffap
                        uniquify
                        recentf
                        package
                        starter-kit-defuns
                        starter-kit-bindings
                        starter-kit-misc
                        starter-kit-registers
                        starter-kit-eshell
                        starter-kit-lisp
                        ))




(load custom-file 'noerror)
(provide 'hooptie45)
(require 'simple)
