

(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))
(add-hook 'dired-mode-hook (lambda () (dired-details-toggle)))
(defvar np-hooks nil)
(defvar need nil)
(setq np-hooks nil)
(defmacro* defhook (mode &rest body &key (active t) &allow-other-keys)
  (let* ((name (gensym (concat "np-hook-for-"
                               (condition-case error
                                   (string mode)
                                 (error
                                  "fundamental-mode"))
                               "-")))
         (def `(defun ,name
                ,@(cdr body)))
         (lst  (alist-cons np-hooks mode  name))
       )
    (progn
      def
      (setq np-hooks lst)
      (if active
          (progn
            (message "Adding")
            ))
      (message "%s" (alist np-hooks mode)))
    ))

(defhook fundamental-mode
  (:active t
           :around t)
  (message "NP HOOK!"))

(funcall (function
          (defun name (message "NP HOOK!")))
         (alist-add-to-set np-hooks
                           'fundamental-mode
                           'np-hook-for-fundamental-mode-40198))

(funcall (function
          (defun name (message "NP HOOK!")))
         (alist-add-to-set np-hooks
                           'fundamental-mode
                           'np-hook-for-fundamental-mode-40193))

(funcall (function
          (defun name (message "NP HOOK!")))
         (alist-add-to-set np-hooks
                           'fundamental-mode
                           'np-hook-for-fundamental-mode-40190))

(funcall (function ((\,mode (\,name)))) (defun name (message "NP HOOK!")))

(funcall (function (\,mode (\,name))) (defun name (message "NP HOOK!")))

(funcall (function
          (alist-add-to-set np-hooks
                            'fundamental-mode
                            'np-hook-for-fundamental-mode-40185))
         (defun name (message "NP HOOK!")))

(funcall (function
          (alist-add-to-set np-hooks
                            'fundamental-mode
                            'np-hook-for-fundamental-mode-40184))
         (defun name (funcall (function (message "NP HOOK!")))))

(funcall (function
          (alist-add-to-set np-hooks
                            'fundamental-mode
                            'np-hook-for-fundamental-mode-40183))
         (defun name (cdr body)))

(funcall (function
          (alist-add-to-set np-hooks
                            'fundamental-mode
                            'np-hook-for-fundamental-mode-40182))
         name)

(name (alist-add-to-set np-hooks
                        'fundamental-mode
                        'np-hook-for-fundamental-mode-40181))

(name (alist-add-to-set np-hooks
                        'fundamental-mode
                        'np-hook-for-fundamental-mode-40179))

(funcall (function
          (defun np-hook-for-fundamental-mode-40177 (message "NP HOOK!")))
         (alist-add-to-set np-hooks
                           'fundamental-mode
                           'np-hook-for-fundamental-mode-40177))

(alist-add-to-set np-hooks
                  'fundamental-mode
                  'np-hook-for-fundamental-mode-40175)

(alist-add-to-set np-hooks
                  'fundamental-mode
                  'np-hook-for-fundamental-mode-40174)

(alist-add-to-set np-hooks
                  'fundamental-mode
                  'np-hook-for-fundamental-mode-40173)

(funcall (function
          (defun np-hook-for-fundamental-mode-40171 (message "NP HOOK!")))
         (alist-add-to-set np-hooks
                           'fundamental-mode
                           'np-hook-for-fundamental-mode-40171))

(funcall (function
          (defun np-hook-for-fundamental-mode-40170 (message "NP HOOK!")))
         (alist-add-to-set np-hooks
                           fundamental-mode
                           np-hook-for-fundamental-mode-40170))

(funcall (function
          (defun (intern name) (message "NP HOOK!")))
         (alist-add-to-set np-hooks
                           fundamental-mode
                           np-hook-for-fundamental-mode-40169))

(funcall (function
          (defun (intern name) (message "NP HOOK!")))
         (alist-add-to-set np-hooks fundamental-mode "font-backend"))

(funcall (function
          (defun font-backend (message "NP HOOK!")))
         (alist-add-to-set np-hooks fundamental-mode "font-backend"))

(funcall (function
          (defun "font-backend" (message "NP HOOK!")))
         (alist-add-to-set np-hooks fundamental-mode "font-backend"))












(defmacro* np-dolist ((var listform &optional resultform)
                      &rest body))

(defun emacs-init-files-git (file)
  (let (ret)
    (condition-case ex
        (progn
          (load file nil)
          (setq ret t))
      ('error
       (progn
         (message "errors!!! %s" ex)

         (setq ret nil))))
    ret))

(provide 'starter-kit-dired)
(defvar ignore-list '("css"
                      "COPYING"
                      "abbrev_defs"
                      "ac-comphist.dat"
                      "align.el"
                      "auto-complete"
                      "auto-save-list"
                      "backups"
                      "cedet"
                      "clang"
                      "clang.el"
                      "coffee-mode"
                      "Gemfile.lock"
                      "color-theme-nanarpuss.el"
                      "company"
                      "custom.el"
                      "custom.el.~1~"
                      "custom.el.~2~"
                      "custom.el.~92~"
                      "custom.el.~93~"
                      "custom.el~"
                      "dominating-file.el"
                      "el-get"
                      
                      "emms"
                      "english.dict.el"
                      "english.dict.elc"
                      "eproject"
                      "eproject.lst"
                      "flyspell.el"
                      "fuzzy-find-in-project.el"
                      "fuzzy-find-in-project.el~"
                      "fuzzy-find-in-project.rb"
                      "fuzzy-find-in-project.rb~"
                      
                      "history"
                      
                      "init.el~"
                      
                      "locatedb.sh"
                      "mit"
                      "package.el"
                      "places"
                      "places~"
                      "popup.el"
                      "predictive"
                      "rails-minor-mode"
                      "semanticdb"
                      "server"
                      
                      "swank-clojure-enablers"
                      "theme-overlay.el"
                      "torus.el"
                      "tramp"
                      "tramp.~1~"
                      "tramp~"
                      "tutorial"
                      "url"
                      
                      
                      
                      
                      ".CFUserTextEncoding"
                      ".DS_Store"
                      ".Trash"
                      ".Xauthority"
                      ".adobe"
                      
                      ".amazon-fps~"
                      ".amazon-payments"
                      ".appcfg_cookies"
                      ".aspell.en.prepl"
                      ".aspell.en.pws"
                      ".bash_history"
                      ".boto"
                      ".bundler"
                      ".bzr.log"
                      ".cljr"
                      ".cups"
                      ".current_path~"
                      ".cvspass"
                      ".dbshell"
                      ".el4r"
                      ".el4rrc.rb"
                      ".el4rrc.rb.new"
                      ".emacs"
                      ".emacs.bmk"
                      
                      ".emacs_context"
                      ".erlang.cookie"
                      ".fontconfig"
                      ".gem"
                      ".gemrc"
                      ".gemrc~"
                      
                      
                      ".gitignore~"
                      ".google-api.yaml"
                      ".gsutil"
                      ".heroku"
                      ".ido.last"
                      ".ido.last~"
                      ".irb-history"
                      ".irb_history"
                      ".java_history"
                      ".lein"
                      ".lesshst"
                      
                      ".nanar.el"
                      ".nanar.elc"
                      ".netbeans"
                      ".node_libraries"
                      ".notes"
                      ".npm"
                      ".oh-my-zsh"
                      ".org.eclipse.epp.usagedata.recording.userId"
                      ".pgpass"
                      ".pip"
                      ".pryrc"
                      ".pryrc~"
                      ".psql_history"
                      ".rbx"
                      ".recentf"
                      ".recentf~"
                      ".rediscli_history"
                      ".rubinius_last_error"
                      
                      ".serverauth.27134"
                      ".sh_history"
                      ".slime-history.eld"
                      ".sqlite_history"
                      
                      ".subversion"
                      ".vim"
                      ".viminfo"
                      ".zcompdump"
                      ".zdirstore"
                      ".zlogout"
                      ".zsh-update"
                      ".zsh_history"

                      ".zshrc~"
                      "9000"
                      "AmazonFPS.xml"


                      

                      "NetBeansProjects"
                      
                      
                      "anet_ruby_samples-1.0.2.zip"
                      "anet_ruby_samples-1.0.2.zip.gz:sample_app"
                      "authnet"
                      "authorize-net-1.5.2.gem"
                      "avl-tree-0.2.txt"
                      
                      "couchdb.stderr"
                      "couchdb.stdout"
                      "elisp"
                      "event-log.db"
                      "events.db"

                      "google1570b4cd0e27d7b5.html"
                      "google_verify"
                      "gsutil"
                      "jzmq"
                      "lein"
                      "lein.1"
                      "development.sqlite3"
                      "test.sqlite3"
                      "production.sqlite3"
                      "macports"
                      "metadata.gz"
                      "node_modules"
                      ".smex-items"
                      ".git"
                      "Gemfile.lock"
                      "tmp"
                      "pgadmin.log"
                      "postgres"
                      "dominating-file.el"
                      "reader.rb~"
                      "resume.md"
                      "sample_app"
                      "schema.xsd"
                      "schema.xsd~"
                      "share"
                      "google1570b4cd0e27d7b5 (1).html"
                      "s"
                      "~"
                      ))
(setq ignore-list '(
                    "COPYING"
                    "abbrev_defs"
                    "ac-comphist.dat"
                    "align.el"
                    "auto-complete"
                    "auto-save-list"
                    "backups"
                    "cedet"
                    "clang"
                    "clang.el"
                    "coffee-mode"
                    "color-theme-nanarpuss.el"
                    "company"
                    "custom.el"
                    "custom.el.~1~"
                    "custom.el.~2~"
                    "custom.el.~92~"
                    "custom.el.~93~"
                    "custom.el~"
                    "dominating-file.el"
                    "el-get"
                    
                    "emms"
                    "english.dict.el"
                    "english.dict.elc"
                    "eproject"
                    "eproject.lst"
                    "flyspell.el"
                    "fuzzy-find-in-project.el"
                    "fuzzy-find-in-project.el~"
                    "fuzzy-find-in-project.rb"
                    "fuzzy-find-in-project.rb~"
                    
                    "history"
                    
                    "init.el~"
                    
                    "locatedb.sh"
                    "mit"
                    "package.el"
                    "places"
                    "places~"
                    "popup.el"
                    "predictive"
                    "rails-minor-mode"
                    "semanticdb"
                    "server"
                    
                    "swank-clojure-enablers"
                    "theme-overlay.el"
                    "torus.el"
                    "tramp"
                    "tramp.~1~"
                    "tramp~"
                    "tutorial"
                    "url"
                    
                    
                    
                    
                    ".CFUserTextEncoding"
                    ".DS_Store"
                    ".Trash"
                    ".Xauthority"
                    ".adobe"
                    
                    ".amazon-fps~"
                    ".amazon-payments"
                    ".appcfg_cookies"
                    ".aspell.en.prepl"
                    ".aspell.en.pws"
                    ".bash_history"
                    ".boto"
                    ".bundler"
                    ".bzr.log"
                    ".cljr"
                    ".cups"
                    ".current_path~"
                    ".cvspass"
                    ".dbshell"
                    ".el4r"
                    ".el4rrc.rb"
                    ".el4rrc.rb.new"
                    ".emacs"
                    ".emacs.bmk"
                    
                    ".emacs_context"
                    ".erlang.cookie"
                    ".fontconfig"
                    ".gem"
                    ".gemrc"
                    ".gemrc~"
                    
                    
                    ".gitignore~"
                    ".google-api.yaml"
                    ".gsutil"
                    ".heroku"
                    ".ido.last"
                    ".ido.last~"
                    ".irb-history"
                    ".irb_history"
                    ".java_history"
                    ".lein"
                    ".lesshst"
                    
                    ".nanar.el"
                    ".nanar.elc"
                    ".netbeans"
                    ".node_libraries"
                    ".notes"
                    ".npm"
                    ".oh-my-zsh"
                    ".org.eclipse.epp.usagedata.recording.userId"
                    ".pgpass"
                    ".pip"
                    ".pryrc"
                    ".pryrc~"
                    ".psql_history"
                    ".rbx"
                    ".recentf"
                    ".recentf~"
                    ".rediscli_history"
                    ".rubinius_last_error"
                    
                    ".serverauth.27134"
                    ".sh_history"
                    ".slime-history.eld"
                    ".sqlite_history"
                    
                    ".subversion"
                    ".vim"
                    ".viminfo"
                    ".zcompdump"
                    ".zdirstore"
                    ".zlogout"
                    ".zsh-update"
                    ".zsh_history"

                    ".zshrc~"
                    "9000"
                    "AmazonFPS.xml"


                    

                    "NetBeansProjects"
                    
                    
                    "anet_ruby_samples-1.0.2.zip"
                    "anet_ruby_samples-1.0.2.zip.gz:sample_app"
                    "authnet"
                    "authorize-net-1.5.2.gem"
                    "avl-tree-0.2.txt"
                    
                    "couchdb.stderr"
                    "couchdb.stdout"
                    "elisp"
                    "event-log.db"
                    "events.db"

                    "google1570b4cd0e27d7b5.html"
                    "google_verify"
                    "gsutil"
                    "jzmq"
                    "lein"
                    "lein.1"
                    "development.sqlite3"
                    "test.sqlite3"
                    "production.sqlite3"
                    "macports"
                    "metadata.gz"
                    "node_modules"
                    ".smex-items"
                    ".git"
                    "Gemfile.lock"
                    "tmp"
                    "pgadmin.log"
                    "postgres"
                    "dominating-file.el"
                    "reader.rb~"
                    "resume.md"
                    ".vegas"
                    ".subversion_IDEA"
                    "sample_app"
                    "schema.xsd"
                    "schema.xsd~"
                    "share"
                    "google1570b4cd0e27d7b5 (1).html"
                    "s"
                    "~"
                    ))

(setq dired-omit-files
      (concat "^"
              ( regexp-opt-group
                ignore-list

                t nil)
              "$\\|^"
              (regexp-opt-group '(".#" "#" "~") t t)

              ))
(setq dired-mode-hook
      '(
        (lambda nil
          (define-key dired-mode-map
            (kbd "<return>")
            'dired-find-alternate-file)
          (define-key dired-mode-map
            (kbd "^")
            (lambda nil
              (interactive)
              (find-alternate-file "..")))
          (define-key dired-mode-map
            (kbd "M-z")
            (lambda nil
              (interactive)
              (find-alternate-file "..")))
          (define-key dired-mode-map
            [mouse-3]
            (lambda nil
              (interactive)
              (find-alternate-file ".."))))
        dired-extra-startup
        (lambda nil
          (dired-details-hide))
        (lambda nil
          (dired-omit-mode 1))))
