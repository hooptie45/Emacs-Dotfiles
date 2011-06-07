;; ;; Part of the Emacs Starter Kit
;; ;;
;; ;; This is the first thing to get loaded.
;; ;;
;; ;; "Emacs outshines all other editing software in approximately the
;; ;; same way that the noonday sun does the stars. It is not just bigger
;; ;; and brighter; it simply makes everything else vanish."
;; ;; -Neal Stephenson, "In the Beginning was the Command Line"

;; ;; Turn off mouse interface early in startup to avoid momentary display
;; ;; You really don't need these; trust me.

(setq mac-option-modifier 'hyper)
(setq mac-command-modifier 'meta)
(setq mac-function-modifier 'super)
(setq dotfiles-dir "~/.emacs.d/")
(mapc (lambda (f)
        (add-to-list 'load-path f))
      '(".emacs-backups"
        "vendor/clojure-mode"
        "auto-complete"
        "auto-complete/dict" "auto-complete/doc"
        "auto-complete/etc"
        "auto-save-list"
        "cedet"
        "cedet/cogre"
        "cedet/cogre/templates"
        "cedet/cogre/tests"
        "cedet/common"
        "cedet/common/icons"
        "cedet/contrib"
        "cedet/ede"
        "cedet/ede/templates"
        "cedet/eieio"
        "cedet/semantic"
        "cedet/semantic/bovine"
        "cedet/semantic/ctags"
        "cedet/semantic/doc"
        "cedet/semantic/symref"
        "cedet/semantic/tests"
        "cedet/semantic/wisent"
        "cedet/speedbar"
        "cedet/srecode"
        "cedet/srecode/templates"
        "cedet/tests"
        "clang"
        "company"
        "elpa"
        "elpa/applescript-mode-20090321"
        "elpa/archives"
        "elpa/archives/ELPA"
        "elpa/archives/gnu"
        "elpa/c-eldoc-0.6"
        "elpa/clojure-mode-1.7.1"
        "elpa/company-0.5"
        "elpa/dired-isearch-0.3"
        "elpa/elisp-depend-0.4.1"
        "elpa/emms-3.0"
        "elpa/eproject-0.4"
        "elpa/js2-mode-20090814"
        "elpa/magit-0.8.1"
        "elpa/org-20110428"
        "elpa/slime-20100404"
        "elpa/slime-repl-20100404"
        "elpa/swank-clojure-1.1.0"
        "elpa/tempo-snippets-0.1.5"
        "elpa-to-submit"
        "emacs-wiki-files"
        "eproject"
        "groups"
        "semanticdb"
        "snippets"
        "snippets/c++-mode"
        "snippets/c-mode"
        "snippets/cc-mode"
        "snippets/clojure-mode"
        "snippets/cperl-mode"
        "snippets/csharp-mode"
        "snippets/css-mode"
        "snippets/emacs-lisp-mode"
        "snippets/erlang-mode"
        "snippets/f90-mode"
        "snippets/html-mode"
        "snippets/html-mode/header"
        "snippets/html-mode/list"
        "snippets/html-mode/meta"
        "snippets/html-mode/table"
        "snippets/latex-mode"
        "snippets/markdown-mode"
        "snippets/nxml-mode"
        "snippets/nxml-mode/header"
        "snippets/nxml-mode/meta"
        "snippets/objc-mode"
        "snippets/perl-mode"
        "snippets/python-mode"
        "snippets/rst-mode"
        "snippets/ruby-mode"
        "snippets/ruby-mode/collections"
        "snippets/ruby-mode/control structure"
        "snippets/ruby-mode/definitions"
        "snippets/ruby-mode/general"
        "snippets/scala-mode"
        "snippets/snippet-mode"
        "snippets/sql-mode"
        "snippets/text-mode"
        
        
        "vendor"
        "vendor/coffee-mode"
        "vendor/coffee-mode/examples"
        "vendor/color-theme"
        "vendor/color-theme/themes"
        "vendor/cucumber"
        "vendor/cucumber/snippets"
        "vendor/cucumber/snippets/feature-mode"
        "vendor/jade-mode"
        "vendor/jump.el"
        "vendor/jump.el/test"
        "vendor/jump.el/test/jump-fake-app"
        "vendor/jump.el/test/jump-fake-app/animals"
        "vendor/jump.el/test/jump-fake-app/foods"
        "vendor/predictive"
        "vendor/predictive/html"
        "vendor/predictive/latex"
        "vendor/predictive/texinfo"
        "vendor/pycomplexity"
        "vendor/pycomplexity/grammar"
        "vendor/pycomplexity/tests"
        "vendor/pycomplexity/tests/manual"
        "vendor/rinari"
        "vendor/rinari/doc"
        "vendor/rinari/test"
        "vendor/rinari/test/rails-app"
        "vendor/rinari/test/rails-app/app"
        "vendor/rinari/test/rails-app/app/controllers"
        "vendor/rinari/test/rails-app/app/helpers"
        "vendor/rinari/test/rails-app/app/models"
        "vendor/rinari/test/rails-app/app/views"
        "vendor/rinari/test/rails-app/app/views/example"
        "vendor/rinari/test/rails-app/app/views/units"
        "vendor/rinari/test/rails-app/config"
        "vendor/rinari/test/rails-app/config/environments"
        "vendor/rinari/test/rails-app/config/initializers"
        "vendor/rinari/test/rails-app/db"
        "vendor/rinari/test/rails-app/doc"
        "vendor/rinari/test/rails-app/log"
        "vendor/rinari/test/rails-app/public"
        "vendor/rinari/test/rails-app/public/images"
        "vendor/rinari/test/rails-app/public/javascripts"
        "vendor/rinari/test/rails-app/script"
        "vendor/rinari/test/rails-app/script/performance"
        "vendor/rinari/test/rails-app/script/process"
        "vendor/rinari/test/rails-app/test"
        "vendor/rinari/test/rails-app/test/fixtures"
        "vendor/rinari/test/rails-app/test/functional"
        "vendor/rinari/test/rails-app/test/unit"
        "vendor/rinari/util"
        "vendor/rinari/util/test"
        "vendor/rspec-mode"
        "vendor/ruby-complexity"
        "vendor/textmate.el"
        "vendor/yasnippet-0.6.1c"
        "vendor/yasnippet-0.6.1c/snippets"
        "vendor/yasnippet-0.6.1c/snippets/text-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/cc-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/cc-mode/c++-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/cc-mode/c-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/cc-mode/csharp-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/cc-mode/objc-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/css-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/emacs-lisp-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/erlang-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/f90-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/html-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/latex-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/markdown-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/nxml-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/perl-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/perl-mode/cperl-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/python-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/rst-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/ruby-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/scala-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/snippet-mode"
        "vendor/yasnippet-0.6.1c/snippets/text-mode/sql-mode"
        "vendor/yasnippet.el"
        "vendor/yasnippet.el/snippets"
        "vendor/yasnippet.el/snippets/text-mode"
        "vendor/yasnippet.el/snippets/text-mode/cc-mode"
        "vendor/yasnippet.el/snippets/text-mode/cc-mode/c++-mode"
        "vendor/yasnippet.el/snippets/text-mode/cc-mode/c-mode"
        "vendor/yasnippet.el/snippets/text-mode/css-mode"
        "vendor/yasnippet.el/snippets/text-mode/emacs-lisp-mode"
        "vendor/yasnippet.el/snippets/text-mode/erlang-mode"
        "vendor/yasnippet.el/snippets/text-mode/f90-mode"
        "vendor/yasnippet.el/snippets/text-mode/html-mode"
        "vendor/yasnippet.el/snippets/text-mode/javascript-mode"
        "vendor/yasnippet.el/snippets/text-mode/latex-mode"
        "vendor/yasnippet.el/snippets/text-mode/markdown-mode"
        "vendor/yasnippet.el/snippets/text-mode/nxml-mode"
        "vendor/yasnippet.el/snippets/text-mode/objc-mode"
        "vendor/yasnippet.el/snippets/text-mode/objj-mode"
        "vendor/yasnippet.el/snippets/text-mode/org-mode"
        "vendor/yasnippet.el/snippets/text-mode/perl-mode"
        "vendor/yasnippet.el/snippets/text-mode/python-mode"
        "vendor/yasnippet.el/snippets/text-mode/rst-mode"
        "vendor/yasnippet.el/snippets/text-mode/ruby-mode"
        "vendor/yasnippet.el/snippets/text-mode/sass-mode"
        "vendor/yasnippet.el/snippets/text-mode/scala-mode"
        "vendor/yasnippet.el/snippets/text-mode/snippet-mode"
        "vendor/yasnippet.el/snippets/text-mode/sql-mode"
        "vendor/yasnippet.el/snippets/text-mode/textile-mode"
        "yasnippet"
        "yasnippet/snippets"
        "yasnippet/snippets/emacs-lisp-mode"))

(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(setq ring-bell-function 'ignore)
(setq visual-bell nil)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
(setq visual-bell nil)
(setq visible-bell nil)
(server-start )
(find-file "~/.emacs.d/init.el")
(load "~/.emacs.d/package.el")
(package-initialize)

(add-to-list 'load-path "~/.emacs")
(add-to-list 'load-path "~/.emacs.d/groups")
(add-to-list 'load-path "~/.emacs.d/emacs-wiki-files")
(add-to-list 'load-path "~/.emacs.d/vendor")


                                        ;(load "~/.emacs.d/vendor/color-theme-6.6.0/themes/color-theme-library")
                                        ;(color-theme-clarity)

(let ((path))
  (setq path (concat "~/.gem/ruby/1.8/bin:"
                     "~/bin:"
                     "/Users/hooptie45/.rvm/gems/ruby-1.8.7-p334/bin:"
                     "~/src/homebrew/bin:"
                     "/usr/local/bin:"
                     "/usr/bin:"
                     "/opt/local/bin:"
                     "/bin"))
  (setenv "PATH" path))



(require 'company "~/.emacs.d/company/company.el")

(require 'yari)

(load-file (concat dotfiles-dir "vendor/rinari/util/" "jump.el/jump.el"))
(require 'starter-kit-company)

(setq-default dired-omit-files-p t) ; this is buffer-local variable
(setq dired-omit-files "^\\.?#\\|^\\.$\\|~$\\|backups\\|trash\\|^.git$")


;; (defconst package-archive-base "http://tromey.com/elpa/"
;;   "Base URL for the package archive.
;; Ordinarily you should not need to edit this.
;; The default points to ELPA, the Emacs Lisp Package Archive.
;; Note that some code in package.el assumes that this is an http: URL.")
;; 




;; (add-to-list 'load-path "~/.emacs.d/predictive")
;; (add-to-list 'load-path "~/.emacs.d/auto-complete")

;; (add-to-list 'load-path "~/.emacs.d/company")
;; (add-to-list 'load-path "~/.emacs.d/elpa/emms-3.0")
(add-to-list 'load-path "~/elisp/")



(scroll-bar-mode -1)
(require 'color-theme)
(load "~/.emacs.d/color-theme-nanarpuss.el")
(color-theme-nanarpuss)
(require 'emms)
(require 'emms-player-mplayer)
(require 'emms-setup)

(require 'emms-setup)
(require 'emms-streams)








(emms-all)

(require 'find-func-extension)
(require 'find-func+)
(require 'align (concat dotfiles-dir "align.el"))
(require 'anything-config)


(require 'cl)
(require 'saveplace)

(require 'ffap)
(require 'uniquify)
(require 'paredit)
(require 'inf-ruby)
(require 'starter-kit-defuns)
(require 'starter-kit-misc)
(require 'anything)
(require 'anything-config)
(require 'lazy-set-key)
(require 'dired-details)
(require 'starter-kit-yasnippet)
(require 'clojure-mode "~/.emacs.d/vendor/clojure-mode/clojure-mode.el")

(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-js)
(require 'starter-kit-hooks)
(require 'anything-el-swank-fuzzy)


(global-set-key (kbd "M-x") 'anything-M-x)
(setq server-name "hooptie45")
(server-start)
(menu-bar-mode)
;;(anything-read-string-mode -1)



(require 'magit)
(require 'rinari)
(require 'ido)

(require 'haml-mode)
(ido-mode 1)
(ido-everywhere 1)



(require 'imenu)


(setq  default-truncate-lines t)


(setq-default find-function-C-source-directory "/opt/local/ar/macports/distfiles/emacs-app/emacs-23.3/src")

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

(global-company-mode 1)
(require 'starter-kit-bindings)
(add-hook 'slime-load-hook '(lazy-set-key
                             '(("M-/" . company-complete)
                               ("M-d" . slime-documentation))
                             
                             slime-mode-map))
(require 'sass-mode)
(setq tramp-chunksize 500)
(setq tramp-default-method "ssh")
