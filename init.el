(setq mac-option-modifier 'hyper)

(setq mac-command-modifier 'meta)
(setq mac-function-modifier 'super)
(setq org-default-notes-file "~/org/notes.org")
(find-file "/Users/hooptie45/.emacs.d/init.el")
(setq dotfiles-dir (file-name-directory (buffer-file-name (current-buffer))))
(setq mac-option-modifier 'hyper)
(setq mac-command-modifier 'meta)
(setq mac-function-modifier 'super)
(require 'cl)



(require 'clojure-mode (concat dotfiles-dir "elpa/clojure-mode-1.10.0/clojure-mode.el"))
;; Customize:
(setq  my/org-compile-sources t)



(let ((default-directory dotfiles-dir))
  (normal-top-level-add-to-load-path '("elpa"
                                       "elpa-to-submit"
                                       "vendor"
                                       "vendor/predictive"
                                       "groups"
                                       "emacs-utils"
                                       "emacs-wiki-files"
                                       "company"
                                       "groups"))  
  (normal-top-level-add-subdirs-to-load-path))
(setq-default dired-omit-files-p t)    ; this is buffer-local variable
(setq dired-omit-files "^\\.?#\\|^\\.$\\|~$\\|backups\\|trash\\|^.git$")
(setq custom-file (concat dotfiles-dir "custom.el"))

(load (concat dotfiles-dir "package.el"))
(load (expand-file-name (concat dotfiles-dir  "package.el")))
(package-initialize)

(add-to-list 'load-path "/Volumes/OSX LION/Users/hooptie45/elisp/")


(add-to-list 'load-path dotfiles-dir)

(require 'lazy-set-key)
(require 'dired-details)

(setq dotfiles-dir  (file-name-directory (buffer-file-name)))
(setq-default dired-omit-files-p t) ; this is buffer-local variable
(setq dired-omit-files "^\\.?#\\|^\\.$\\|~$\\|backups\\|trash\\|^.git$")
(setq custom-file (concat dotfiles-dir "custom.el"))
(add-to-list 'load-path (expand-file-name (concat dotfiles-dir "../" "elisp/")))



(setq max-lisp-eval-depth 100000)
(setq max-specpdl-size 100000)
(setq debug-on-error nil)
(menu-bar-mode 1)

(setq ring-bell-function 'ignore)

(load (concat dotfiles-dir "emacs-utils/" "utils.el"))


(setq-default
 exec-path  (list (expand-file-name  "~/.gem/ruby/1.8/bin")
                  (expand-file-name "/Applications/Emacs.app/Contents/MacOS/bin")
                  (expand-file-name "/usr/sbin")
                  (expand-file-name "/sbin")
                  (expand-file-name "~/bin")

                  (expand-file-name "/bin")
                  (expand-file-name "~/src/closurescript/bin")

                  (expand-file-name "/Users/hooptie45/.rvm/bin")
                  (expand-file-name "/usr/local/bin")
                  (expand-file-name "~/src/homebrew/bin")
                  (expand-file-name "/usr/local/bin")
                  (expand-file-name "/usr/bin")
                  (expand-file-name "/opt/local/bin")
                  (expand-file-name "/opt/local/sbin")
                  (expand-file-name "/opt/bin")
                  (expand-file-name "/opt/sbin")

                  (expand-file-name "~/node_modules/.bin")))


(setq ring-bell-function 'ignore)
(setq visual-bell nil)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
(setq visual-bell nil)
(setq visible-bell nil)
(global-auto-revert-mode 1)
(load (concat dotfiles-dir "elpa-to-submit/" "paredit.el"))

(load (expand-file-name (concat dotfiles-dir  "emacs-utils/utils.el")))
(load (expand-file-name (concat dotfiles-dir  "emacs-utils/macro-utils.el")))
(load (expand-file-name (concat dotfiles-dir  "emacs-utils/defn.el")))
(load (expand-file-name (concat dotfiles-dir  "emacs-utils/monad-stream.el")))
(require 'clojure-mode)
(require 'starter-kit-registers)
(require 'company)
(require 'clojure-mode)
(require 'color-theme)
(load (expand-file-name (concat dotfiles-dir  "color-theme-nanarpuss.el")))

(require 'emms)
(require 'emms-player-mplayer)
(require 'emms-setup)
(require 'inf-ruby)
(require 'rvm)

(require 'emms-setup)
(require 'emms-streams)
(require 'paredit)
(require 'find-func-extension)
(require 'find-func+)
(require 'align (concat dotfiles-dir "align.el"))
(require 'anything-config)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'paredit)
(require 'inf-ruby)

(require 'anything)
(require 'anything-config)
(require 'lazy-set-key)
(require 'dired-details)

(require 'anything-el-swank-fuzzy)
(require 'magit)
(require 'ido)

(require 'imenu)
(require 'ansi-color)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(setq comint-prompt-read-only t)
(setq-default  default-truncate-lines t)
(global-company-mode 1)
(require 'rails)
(require 'slim-mode)
(require 'dired-details)
(require 'clojure-mode)
(require 'package)
(require 'org-install)
(require 'org)
(require 'completion-ui-sources)
(require 'predictive-prog-mode)
(require 'starter-kit-bindings)
(require 'dabbrev)
(require 'ffap)
(require 'predictive)
(require 'magit (concat dotfiles-dir "vendor" "/magit" "/magit.el"))
(require 'zencoding-mode (concat dotfiles-dir "vendor" "/zencoding" "/zencoding-mode.el"))

(setq  ido-enable-regexp t
       ido-show-dot-for-dired t
       ido-ignore-directories '("\\`CVS/")
       ido-enable-flex-matching t
       ido-auto-merge-delay-time 10)



(load "starter-kit-bindings" t)





(require 'yasnippet )


(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))
(setq coffee-tab-width 2

      standard-indent 4
      indent-tabs-mode t
      ruby-indent-tabs-mode t)



                                        ;(rvm-use "1.9.2-p290" "global")


(setq slime-protocol-version 'ignore) 



(load (expand-file-name (concat dotfiles-dir "groups/starter-kit-bindings")) t)



(load (expand-file-name (concat dotfiles-dir  "groups/starter-kit-bindings.el")) t)


(add-to-list 'load-path (expand-file-name (concat dotfiles-dir  "vendor/coffee-mode")))
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("\\.coffee\\.erb$" . coffee-mode))


(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(add-to-list 'auto-mode-alist '("Gemfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.slim" . slim-mode))


(add-hook 'ruby-mode-hook '(lambda ()
                             (progn


                               (define-key ruby-mode-map (kbd "C-c v") 'ruby-send-definition-and-go)
                               (define-key ruby-mode-map (kbd "C-M-x") 'ruby-send-definition)
                               (set (make-local-variable 'tab-width) 2)
                               (ruby-electric-mode 1)
                               (paredit-mode -1))))



(add-hook 'coffee-mode-hook '(lambda ()
                               (set (make-local-variable 'tab-width) 2)))

(defun kill-all-nodejs ()
  "Doc for [yas] elisp error!"
  (interactive)
  (message "%s" (shf "killall %s &" "node")))
(defun run-coffee ()
  "Doc for [yas] elisp error!"
  (interactive)


  (message "%s" (shf "coffee . &")))
(setq js2-mode-hook nil)
(setq-default before-save-hook nil)
(setq-default after-save-hook nil)
(setq-default coffee-mode-hook nil)
(require 'coffee-mode)
(require 'js2-mode)

(setq-default path "/usr/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin:/usr/local/bin:/Users/hooptie45/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/hooptie45/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/hooptie45/.rvm/rubies/ruby-1.9.2-p290/bin:/Users/hooptie45/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/texbin:/Users/hooptie45/src/clojurescript/bin:/Users/hooptie45/src/clojurescript/script:/Users/hooptie45/node_modules/.bin:/opt/local/bin:/usr/local/sbin")
(message "%s" "LOADED!!!!!!!!!!!!!!!!!!!!!!")

(ido-mode 1)
(ido-everywhere 1)

(defun clojure-slime-maybe-compile-and-load-file ()
  "Call function `slime-compile-and-load-file' if current buffer is connected to a swank server.                                                               

Meant to be used in `after-save-hook'."
  (when (and (eq major-mode 'clojure-mode) (slime-connected-p))
    (slime-compile-and-load-file)))




                                        ;(rvm-use "1.9.2-p290" "global")






(add-to-list 'load-path (expand-file-name (concat dotfiles-dir  "vendor/coffee-mode")))
(mapc
 (lambda (f)
   (condition-case d
       (message "LOADING %s" f)

     (load f t nil)

     (invalid-regexp (message "%s" d))
     (void-function (progn
                      (message "ERROR: %s" d)))
     (void-variable (message "ERROR: %s" d))
     (error (message "ERROR: %s" d))))


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

 (remove-if
  (lambda (f) 
    (or  (string-match-p "^..?$" f)
         (string-match-p "old" f)
         (string-match-p "[#~]" f)))
  (directory-files (concat dotfiles-dir "GROUPS" ))))



(add-hook 'ruby-mode-hook '(lambda ()
                             (progn

                               (define-key ruby-mode-map (kbd "C-c v") 'ruby-send-definition-and-go)
                               (define-key ruby-mode-map (kbd "C-M-x") 'ruby-send-definition)
                               (set (make-local-variable 'tab-width) 2)
                               (ruby-electric-mode 1)
                               (paredit-mode 1))))

                               (progn


                                 (set (make-local-variable 'tab-width) 2))))

(require 'yari)
(require 'hooptie45)
(require 'wdired)



(setq js2-mode-hook nil)
(setq-default before-save-hook nil)
(setq-default after-save-hook nil)
(setq-default coffee-mode-hook nil)
(require 'coffee-mode)
(require 'js2-mode)

(setq-default path "/usr/bin:/usr/sbin:/usr/local/sbin:/bin:/sbin:/usr/local/bin:/Users/hooptie45/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/hooptie45/.rvm/gems/ruby-1.9.2-p290@global/bin:/Users/hooptie45/.rvm/rubies/ruby-1.9.2-p290/bin:/Users/hooptie45/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin:/usr/texbin:/Users/hooptie45/src/clojurescript/bin:/Users/hooptie45/src/clojurescript/script:/Users/hooptie45/node_modules/.bin:/opt/local/bin:/usr/local/sbin")


(ido-mode 1)
(ido-everywhere 1)
(load "starter-kit-bindings.el")
(put 'dired-find-alternate-file 'disabled nil)

(ido-everywhere 0)

(setq  anything-show-completion-activate nil)
(anything-read-string-mode-uninstall)
(message "%s" "LOADED LOADED LOADED LOADED LOADED ")

(setq backup-by-copying t)
    )
  )
(setq make-backup-file-name-function 'my-backup-file-name)
(setq backup-directory-alist '(("" . "~/.emacs.d/emacs-backup")))

(subword-mode 1) ; 1 for on, 0 for off
(global-subword-mode 1) ; 1 for on, 0 for off
(put 'dired-find-alternate-file 'disabled nil)
(color-theme-nanarpuss)
(setq ruby-program-name "ema_irb --inf-ruby-mode")
(require 'slime)
(require 'slime-fuzzy)



(require 'slime-repl)




(defconst clojure-font-lock-keywords
  (eval-when-compile
    `( ;; Definitions.
      (,(concat "(\\(?:clojure.core/\\)?\\("
                (regexp-opt '("defn" "defn-" "def" "def-" "defonce"
                              "defmulti" "defmethod" "defmacro"
                              "defstruct" "deftype" "defprotocol"
                              "defrecord" "deftest"
                              "bolt-spec" "defspout" "defbolt" "topology" "spout-spec"
                              "slice" "def\\[a-z\\]"
                              "defalias" "defhinted" "defmacro-"
                              "defn-memo" "defnk" "defonce-"
                              "defstruct-" "defunbound" "defunbound-"
                ;; Any whitespace
                "[ \r\n\t]*"
                ;; Possibly type or metadata
                "\\(?:#?^\\(?:{[^}]*}\\|\\sw+\\)[ \r\n\t]*\\)*"
                "\\(\\sw+\\)?")
       (1 font-lock-keyword-face)
      ;; Deprecated functions
      (,(concat
         "(\\(?:clojure.core/\\)?"
         (regexp-opt
          '("add-watcher" "remove-watcher" "add-classpath") t)
         "\\>")
       1 font-lock-warning-face)
      ;; Control structures
      (,(concat
         "(\\(?:clojure.core/\\)?"
         (regexp-opt
          '("let" "letfn" "do"
            "case" "cond" "condp"
            "for" "loop" "recur"
            "when" "when-not" "when-let" "when-first"
            "if" "if-let" "if-not"
            "." ".." "->" "->>" "doto"
            "and" "or"
            "dosync" "doseq" "dotimes" "dorun" "doall"
            "load" "import" "unimport" "ns" "in-ns" "refer"
            "try" "catch" "finally" "throw"
            "with-open" "with-local-vars" "binding"
            "gen-class" "gen-and-load-class" "gen-and-save-class"
            "handler-case" "handle") t)
         "\\>")
       1 font-lock-builtin-face)
      ;; Built-ins
      (,(concat
         "(\\(?:clojure.core/\\)?"
         (regexp-opt
          '("*" "*1" "*2" "*3" "*agent*"
            "*allow-unresolved-vars*" "*assert*" "*clojure-version*" "*command-line-args*" "*compile-files*"
            "*compile-path*" "*e" "*err*" "*file*" "*flush-on-newline*"
            "*in*" "*macro-meta*" "*math-context*" "*ns*" "*out*"
            "*print-dup*" "*print-length*" "*print-level*" "*print-meta*" "*print-readably*"
            "*read-eval*" "*source-path*" "*use-context-classloader*" "*warn-on-reflection*" "+"
            "-" "/"
            "<" "<=" "=" "==" ">"
            ">=" "accessor" "aclone"
            "agent" "agent-errors" "aget" "alength" "alias"
            "all-ns" "alter" "alter-meta!" "alter-var-root" "amap"
            "ancestors" "and" "apply" "areduce" "array-map"
            "aset" "aset-boolean" "aset-byte" "aset-char" "aset-double"
            "aset-float" "aset-int" "aset-long" "aset-short" "assert"
            "assoc" "assoc!" "assoc-in" "associative?" "atom"
            "await" "await-for" "await1" "bases" "bean"
            "bigdec" "bigint" "binding" "bit-and" "bit-and-not"
            "bit-clear" "bit-flip" "bit-not" "bit-or" "bit-set"
            "bit-shift-left" "bit-shift-right" "bit-test" "bit-xor" "boolean"
            "boolean-array" "booleans" "bound-fn" "bound-fn*" "butlast"
            "byte" "byte-array" "bytes" "case" "cast" "char"
            "char-array" "char-escape-string" "char-name-string" "char?" "chars"
            "chunk" "chunk-append" "chunk-buffer" "chunk-cons" "chunk-first"
            "chunk-next" "chunk-rest" "chunked-seq?" "class" "class?"
            "clear-agent-errors" "clojure-version" "coll?" "comment" "commute"
            "comp" "comparator" "compare" "compare-and-set!" "compile"
            "complement" "concat" "cond" "condp" "conj"
            "conj!" "cons" "constantly" "construct-proxy" "contains?"
            "count" "counted?" "create-ns" "create-struct" "cycle"
            "dec" "decimal?" "declare" "definline" "defmacro"
            "defmethod" "defmulti" "defn" "defn-" "defonce"
            "defstruct" "delay" "delay?" "deliver" "deref"
            "derive" "descendants" "destructure" "disj" "disj!"
            "dissoc" "dissoc!" "distinct" "distinct?" "doall"
            "doc" "dorun" "doseq" "dosync" "dotimes"
            "doto" "double" "double-array" "doubles" "drop"
            "drop-last" "drop-while" "empty" "empty?" "ensure"
            "enumeration-seq" "eval" "even?" "every?"
            "extend" "extend-protocol" "extend-type" "extends?" "extenders"
            "false?" "ffirst" "file-seq" "filter" "find" "find-doc"
            "find-ns" "find-var" "first" "float" "float-array"
            "float?" "floats" "flush" "fn" "fn?"
            "fnext" "for" "force" "format" "future"
            "future-call" "future-cancel" "future-cancelled?" "future-done?" "future?"
            "gen-class" "gen-interface" "gensym" "get" "get-in"
            "get-method" "get-proxy-class" "get-thread-bindings" "get-validator" "hash"
            "hash-map" "hash-set" "identical?" "identity" "if-let"
            "if-not" "ifn?" "import" "in-ns" "inc"
            "init-proxy" "instance?" "int" "int-array" "integer?"
            "interleave" "intern" "interpose" "into" "into-array"
            "ints" "io!" "isa?" "iterate" "iterator-seq"
            "juxt" "key" "keys" "keyword" "keyword?"
            "last" "lazy-cat" "lazy-seq" "let" "letfn"
            "line-seq" "list" "list*" "list?" "load"
            "load-file" "load-reader" "load-string" "loaded-libs" "locking"
            "long" "long-array" "longs" "loop" "macroexpand"
            "macroexpand-1" "make-array" "make-hierarchy" "map" "map?"
            "mapcat" "max" "max-key" "memfn" "memoize"
            "merge" "merge-with" "meta" "method-sig" "methods"
            "min" "min-key" "mod" "name" "namespace"
            "neg?" "newline" "next" "nfirst" "nil?"
            "nnext" "not" "not-any?" "not-empty" "not-every?"
            "not=" "ns" "ns-aliases" "ns-imports" "ns-interns"
            "ns-map" "ns-name" "ns-publics" "ns-refers" "ns-resolve"
            "ns-unalias" "ns-unmap" "nth" "nthnext" "num"
            "number?" "odd?" "or" "parents" "partial"
            "partition" "pcalls" "peek" "persistent!" "pmap"
            "pop" "pop!" "pop-thread-bindings" "pos?" "pr"
            "pr-str" "prefer-method" "prefers" "primitives-classnames" "print"
            "print-ctor" "print-doc" "print-dup" "print-method" "print-namespace-doc"
            "print-simple" "print-special-doc" "print-str" "printf" "println"
            "println-str" "prn" "prn-str" "promise" "proxy"
            "proxy-call-with-super" "proxy-mappings" "proxy-name" "proxy-super" "push-thread-bindings"
            "pvalues" "quot" "rand" "rand-int" "range"
            "ratio?" "rational?" "rationalize" "re-find" "re-groups"
            "re-matcher" "re-matches" "re-pattern" "re-seq" "read"
            "read-line" "read-string" "reify" "reduce" "ref" "ref-history-count"
            "ref-max-history" "ref-min-history" "ref-set" "refer" "refer-clojure"
            "release-pending-sends" "rem" "remove" "remove-method" "remove-ns"
            "repeat" "repeatedly" "replace" "replicate"
            "require" "reset!" "reset-meta!" "resolve" "rest"
            "resultset-seq" "reverse" "reversible?" "rseq" "rsubseq"
            "satisfies?" "second" "select-keys" "send" "send-off" "seq"
            "seq?" "seque" "sequence" "sequential?" "set"
            "set-validator!" "set?" "short" "short-array" "shorts"
            "shutdown-agents" "slurp" "some" "sort" "sort-by"
            "sorted-map" "sorted-map-by" "sorted-set" "sorted-set-by" "sorted?"
            "special-form-anchor" "special-symbol?" "split-at" "split-with" "str"
            "stream?" "string?" "struct" "struct-map" "subs"
            "subseq" "subvec" "supers" "swap!" "symbol"
            "symbol?" "sync" "syntax-symbol-anchor" "take" "take-last"
            "take-nth" "take-while" "test" "the-ns" "time"
            "to-array" "to-array-2d" "trampoline" "transient" "tree-seq"
            "true?" "type" "unchecked-add" "unchecked-dec" "unchecked-divide"
            "unchecked-inc" "unchecked-multiply" "unchecked-negate" "unchecked-remainder" "unchecked-subtract"
            "underive" "unquote" "unquote-splicing" "update-in" "update-proxy"
            "use" "val" "vals" "var-get" "var-set"
            "var?" "vary-meta" "vec" "vector" "vector?"
            "when" "when-first" "when-let" "when-not" "while"
            "with-bindings" "with-bindings*" "with-in-str" "with-loading-context" "with-local-vars"
            "with-meta" "with-open" "with-out-str" "with-precision" "xml-seq"
            ) t)
         "\\>")
       1 font-lock-variable-name-face)
      ;; (fn name? args ...)
      (,(concat "(\\(?:clojure.core/\\)?\\(fn\\)[ \t]+"
                ;; Possibly type
                "\\(?:#?^\\sw+[ \t]*\\)?"
                ;; Possibly name
                "\\(\\sw+\\)?" )
       (1 font-lock-keyword-face)
       (2 font-lock-function-name-face nil t))
      ;;Other namespaces in clojure.jar
      (,(concat
         "(\\(?:\.*/\\)?"
         (regexp-opt
          '(;; clojure.inspector
            "atom?" "collection-tag" "get-child" "get-child-count" "inspect"
            "inspect-table" "inspect-tree" "is-leaf" "list-model" "list-provider"
            ;; clojure.main
            "load-script" "main" "repl" "repl-caught" "repl-exception"
            "repl-prompt" "repl-read" "skip-if-eol" "skip-whitespace" "with-bindings"
            ;; clojure.set
            "difference" "index" "intersection" "join" "map-invert"
            "project" "rename" "rename-keys" "select" "union"
            ;; clojure.stacktrace
            "e" "print-cause-trace" "print-stack-trace" "print-throwable" "print-trace-element"
            ;; clojure.template
            "do-template" "apply-template"
            ;; clojure.test
            "*initial-report-counters*" "*load-tests*" "*report-counters*" "*stack-trace-depth*" "*test-out*"
            "*testing-contexts*" "*testing-vars*" "are" "assert-any" "assert-expr"
            "assert-predicate" "compose-fixtures" "deftest" "deftest-" "file-position"
            "function?" "get-possibly-unbound-var" "inc-report-counter" "is" "join-fixtures"
            "report" "run-all-tests" "run-tests" "set-test" "successful?"
            "test-all-vars" "test-ns" "test-var" "testing" "testing-contexts-str"
            "testing-vars-str" "try-expr" "use-fixtures" "with-test" "with-test-out"
            ;; clojure.walk
            "keywordize-keys" "macroexpand-all" "postwalk" "postwalk-demo" "postwalk-replace"
            "prewalk" "prewalk-demo" "prewalk-replace" "stringify-keys" "walk"
            ;; clojure.xml
            "*current*" "*sb*" "*stack*" "*state*" "attrs"
            "content" "content-handler" "element" "emit" "emit-element"
            ;; clojure.zip
            "append-child" "branch?" "children" "down" "edit"
            "end?" "insert-child" "insert-left" "insert-right" "left"
            "leftmost" "lefts" "make-node" "next" "node"
            "path" "prev" "remove" "replace" "right"
            "rightmost" "rights" "root" "seq-zip" "up"
            ) t)
         "\\>")
       1 font-lock-type-face)
      ;; Constant values (keywords), including as metadata e.g. ^:static
      ("\\<^?:\\(\\sw\\|#\\)+\\>" 0 font-lock-constant-face)
      ;; Meta type annotation #^Type or ^Type
      ("#?^\\sw+" 0 font-lock-type-face)
      ("\\<io\\!\\>" 0 font-lock-warning-face)

      ;;Java interop highlighting
      ("\\<\\.[a-z][a-zA-Z0-9]*\\>" 0 font-lock-preprocessor-face) ;; .foo .barBaz .qux01
      ("\\<[A-Z][a-zA-Z0-9]*/[a-zA-Z0-9/$_]+\\>" 0 font-lock-preprocessor-face) ;; Foo Bar$Baz Qux_
      ("\\<[a-zA-Z]+\\.[a-zA-Z0-9._]*[A-Z]+[a-zA-Z0-9/.$]*\\>" 0 font-lock-preprocessor-face) ;; Foo/Bar foo.bar.Baz foo.Bar/baz
      ("[a-z]*[A-Z]+[a-z][a-zA-Z0-9$]*\\>" 0 font-lock-preprocessor-face) ;; fooBar
      ("\\<[A-Z][a-zA-Z0-9$]*\\.\\>" 0 font-lock-preprocessor-face))) ;; Foo. BarBaz. Qux$Quux. Corge9.


  "Default expressions to highlight in Clojure mode.")
(require 'haml-mode)
(require 'sass-mode)

(require 'starter-kit-alias)
(require 'yaml-mode)


(setf indent-line-function 'lisp-indent-line)


(setq inferior-ruby-mode-hook nil)
(require 'highlight-indentation)
(require 'unbound)
(require 'less-mode)
(add-to-list 'auto-mode-alist '("\\.less$" . less-mode))
(setq less-compile-at-save nil)
(require 'org-protocol)

(setq yas/root-directory (list
                          (concat dotfiles-dir "vendor/yasnippet/snippets/")))
(setq yas/prompt-functions '(yas/dropdown-prompt))

(mapc 'yas/load-directory yas/root-directory)
(server-start)
(require 'rspec-mode)
(require 'find-func)
(defun new-el-lib (name &optional dir)
  (let* ((d (concat (if dir
			(expand-file-name (concat dir "/"))
		      (file-name-directory (buffer-file-name (current-buffer))))))
	 
	 (b (get-buffer-create (concat d name ".el")))
	 (f (concat d name ".el"))
	 (file (find-file-noselect (buffer-name b))))
    (message "%s" d)
    (insert (format "\n(require '%s)" name))
    (when (not (file-exists-p f))
      (save-window-excursion
	
	(switch-to-buffer b)      
	(insert (format "(provide '%s)" name))))))

(add-to-list 'exec-path "/Users/hooptie45/.rvm/gems/ruby-1.9.2-p290/bin")
(server-start)
(require 'rails)
(require 'doremi-cmd)
(load (concat (expand-file-name "~/elisp/doremi-cmd.el")))
(load (concat (expand-file-name "~/elisp/doremi-frm.el")))
(load (concat (expand-file-name "~/elisp/doremi-mac.el")))
(defvar ded-w-v nil)
(defvar ded-w-v nil)
(defvar ded-w-l nil)
(defvar ded-same nil)
;; (defun ded-w ()
;;   "DOCSTRING"
;;   (interactive)
;;   (buffer-local-value ded-w-v (current-buffer))
;;   (setq ded-w-v (not ded-w-v))
;;   (alist-conjugate major-mode :same 
;;                  ))
;; (mode-local-post-major-mode-change)
;; (set-window-dedicated-p
;;  (get-buffer-window (current-buffer))
;;  ded-w-v)
;; (message "%s" 
;;          ded-w-v))
;; (scroll-bar-mode -1)

;; (defun ded-w-conf ()
;;   "DOCSTRING"
;;   (interactive)
;;   (let (var1)
;;     (setq var1 some)
;;     (set-window-parameter (get-buffer-window (current-buffer)) )
;;     (replace-buffer-in-windows)
;;     (window)
;;     ))
(define-key minibuffer-local-map [tab] 'minibuffer-complete)
(require 'org-learn)
(setq org-learn-always-reschedul t)


(defadvice switch-to-buffer (before existing-buffer)
  "When called interactively switch to existing buf
when called with a prefix argument."               
  (interactive)                                     
  (list (read-buffer "Switch to buffer: " (findr "." )
                     (null current-prefix-arg))))
(add-hook 'sgml-mode-hook 'zencoding-mode)
(require 'nav (expand-file-name "vendor/nav/nav.el"))
