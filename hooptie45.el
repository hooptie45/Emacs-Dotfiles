
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
                        undo-tree
                        anything-config
                        anything-etags
                        anything-grep
                        anything-dabbrev-expand
                        anything-auto-install
                        point-ring
                        anything-el-swank-fuzzy
                        bookmark+-1
                        bookmark+
                        dired-x
                        buffer-ring
                        line-comment-banner
                        fastnav
                        wdired
			clojure-mode
                        etags-extension
                        cl
                        saveplace
                        ffap
                        uniquify
                        doremi-cmd
                        doremi
                        recentf
                        package
                        starter-kit-defuns
                        starter-kit-bindings
                        starter-kit-misc
                        starter-kit-registers
                        starter-kit-eshell
                        starter-kit-lisp
                        starter-kit-ruby
                        slime-init
                        
                        ))

(add-to-list 'load-path "~/.emacs")
(load "~/.emacs.d/vendor/color-theme-6.6.0/themes/color-theme-library")
(color-theme-clarity)
(let ((path))
  (setq path (concat "~/.gem/ruby/1.8/bin:"
                     "~/bin:"
                     "~/src/homebrew/bin:"
                     "/usr/local/bin:"
                     "/usr/bin:"
                     "/bin"))
  (setenv "PATH" path))

(setq ring-bell-function 'ignore)



(setq visual-bell nil)
(setq visible-bell nil)
;; Load path etc:




(add-to-list 'load-path "~/elisp")
(setq ring-bell-function 'ignore)


(setq visual-bell nil)
(setq visible-bell nil)
;; Load path etc:


(add-to-list 'load-path "~/elisp")


(setq-default dired-omit-files-p t) ; this is buffer-local variable
    (setq dired-omit-files "^\\.?#\\|^\\.$\\|~$\\|backups\\|trash\\|^.git$")



(setq custom-file (concat dotfiles-dir "custom.el"))
(load "package")



(load custom-file 'noerror)
(provide 'hooptie45)
(require 'simple)
(color-theme-nanarpuss)



