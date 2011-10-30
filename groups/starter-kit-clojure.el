(defun find-thing-at-point ()
  (interactive)
  (let* ((thing (intern (thing-at-point 'sexp))))
    (let* ((km (current-local-map)))
      
      (cond
       ((functionp thing) (find-function thing))

       ((boundp thing) (find-variable-other-window thing))
       (t (ffap))))))

(defun am-looking-at ()
  "Doc for [yas] elisp error!"
  (interactive)
  (let ((s (read-string "char: ")))
    (message "%s" (looking-at s))
    ))

(defun text-thing (tap)
  "Doc for [yas] elisp error!"
  (loop
   for thing in tap
   collect (buffer-substring-no-properties (car thing) (cdr thing))))

<<<<<<< HEAD
(defun convert-to-lazy ()
  "Doc for [yas] elisp error!"
=======
(define-key clojure-mode-map (kbd "M-/") 'slime-fuzzy-complete-symbol)
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
										"defvar" "defvar-"))
					 ;; Function declarations.
					 "\\)\\>"
					 ;; Any whitespace
					 "[ \r\n\t]*"
					 ;; Possibly type or metadata
					 "\\(?:#?^\\(?:{[^}]*}\\|\\sw+\\)[ \r\n\t]*\\)*"
					 "\\(\\sw+\\)?")
		 (1 font-lock-keyword-face)
		 (2 font-lock-function-name-face nil t))
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

(defun ff (start max)
  (let ((f (first (directory-files (file-name-directory
                                    start) t "^project.clj$"))))
    (if (and (null f) (> max 0))
        (ff (file-name-directory (expand-file-name (concat start "/.."))) (1- max))
      f)))

(defun find-project-root ()
  (ff (file-name-directory
       (buffer-file-name (current-buffer))) 10))

(defun project-ns ()
  (when (find-project-root)
    (save-window-excursion
      (progn (find-file (find-project-root))
             (goto-char (point-min))
             (re-search-forward "defproject \\(.*\\) " nil t)
             (when (match-string 0)
               (setq ns (match-string-no-properties 1))))
      ns)))


(defvar clojars-url "http://clojars.org/repo/all-jars.clj")
(defvar clojars-list nil)


(or (get-buffer "+Clojars+")
    (shell-command
     (concat "curl -q " clojars-url)
     (get-buffer-create "+Clojars+")))

(defvar anything-clojars-source '((name . "+Clojars+")
                                  (init . (lambda ()
                                            (anything-candidate-buffer (or (get-buffer "+Clojars+")
                                                                           (shell-command
                                                                            (concat "curl -q " clojars-url)
                                                                            (get-buffer-create "+Clojars+"))))))
                                  
                                  (candidates-in-buffer)
                                  (action . (lambda (jar)
                                              (insert jar)))))
(setq anything-clojars-source '((name . "+Clojars+")
                                (init . (lambda ()
                                          (let ((buffer (or (get-buffer "+Clojars+")
                                                            (shell-command
                                                             (concat "curl -q " clojars-url)
                                                             (get-buffer-create "+Clojars+")))))
                                            (switch-to-buffer buffer)
                                            (goto-char (point-min))
                                            (kill-line 3)
                                            (anything-candidate-buffer buffer))))
                                
                                (candidates-in-buffer)
                                (action . (lambda (jar)
                                            
                                            (insert jar)))))
(defun anything-clojars ()
>>>>>>> configs
  (interactive)
  (pp (while
          (push )))
  (loop while (not (null v))
	with v = (extact-keys)
	collect v into r
	finally (pp r)))



(require 'lazy-set-key)
(require 'hippie-exp)

(lazy-set-key
 '(("<mouse-2>" . dired-mouse-find-file))
 dired-mode-map)

(lazy-set-key
 '(
   ("H-e" . anything-emms)
   ("H-r"         . replace-word)
   ("H-r"         . replace-word)
   ("M-/" . company-complete)
   ("H-=" . (lambda () 
              (interactive)
              (paredit-blink-paren-match t)))
   ("M-x"         . anything-execute-extended-command)
   ("M-<return>"  . find-thing-at-point)
   ("s-."         . point-ring-insert)
   ("s-/"         . point-ring-next)
   ("s-,"         . point-ring-previous)
   ("H-t" . toggle-truncate-lines)
   ("C-s-<"       . point-ring-rotate-left)
   ("C-s->"       . point-ring-rotate-right)
   ("H-/"         . ad-Orig-anything-lisp-complete-symbol-partial-match)
   ("H-|"         . toggle-truncate-lines)
   ("C-x C-b"     . ibuffer)
   ("C-M-\\"      . indent-buffer)
   ("C-s"         . isearch-forward-regexp)
   ("C-r"         . isearch-backward-regexp)
   ("H-a"         . align-current)
   ("C-H-<left>"  . doremi-window-width+)
   ("C-H-<right>" . doremi-files-there)
   ("C-H-<up>"    . doremi-files)
   ("C-z" . ibuffer)
   ("C-x C-e" . eval-last-sexp)
   ("C-H-<down>"  . doremi-recent)
   ("H-d t"       . doremi-color-themes+)
   ("H-d h"       . doremi-window-height+)
   ("C-?"         . sel-disp)
   ("C-t"         . toggle-etp)
   ("H-d m"       . doremi-marks+)
   ("H-d g"       . doremi-global-marks+)
   ("H-s"         . fixup-whitespace)
   ("M-z"         . dired-jump)
   ("C-x g"       . magit-status)
   ("s-s" . shell)

   ("<S-left>"    . windmove-left)
   ("<S-right>"   . windmove-right)
   ("<S-down>"    . windmove-down)
   ("<S-up>"      . windmove-up)
   ([mouse-3]     . dired-jump)
   ("M-z"         . dired-jump)
   ("H-p"         . push-point)
   ("M-j" . jump-to-register)
   ("H-w"         . push-word)
   ("M-/" . company-complete)
   ("M->"         . pop-tag-mark)
   ("H-r" . anything-show-kill-ring)))

(lazy-set-key
 '(("M-/" . company-complete)
   ("M-d" . slime-documentation))
 
 clojure-mode-map)

(lazy-set-key
 '(("M-/" . company-complete)
   ("M-d" . slime-documentation))
 
 slime-mode-map)
(lazy-set-key
 '(("C-n"   . company-select-next)
   ("C-p"   . company-select-previous)
   ("C-d"   . company-show-doc-buffer)
   ("C-v"   . company-show-location)
   ("C-g"   . (lambda ()
                (interactive)
                (company-abort)))
   ("<ESC>" . (lambda ()
                (interactive)
                (company-abort)))
   ("H-z"     . (lambda ()
                  (interactive)
                  (test-comp))))
 company-active-map)

;; (lazy-set-key
;;  '(("C-x C-e" . slime-eval-last-expression)
;;    ("C-c C-v" . slime-eval-buffer))
;;  clojure-mode-map)

;; (lazy-set-key
;;  '(("C-x C-e" . slime-eval-last-expression))
;;  slime-repl-mode-map)



(lazy-set-key '(("C-k" . (lambda ()
                           (interactive)
                           (kill-new (concat "\n" (anything-get-selection)))
                           (anything-next-line)))
                ("."  (lambda ()
                        (interactive)
                        (kill-append (concat "\n" (anything-get-selection)) nil)
                        (anything-next-line))))
              anything-map)


(define-key paredit-mode-map (kbd "\\") 'self-insert-command)


<<<<<<< HEAD
(provide 'starter-kit-bindings)
=======



(defun clojure-slime-maybe-compile-and-load-file ()
  "Call function `slime-compile-and-load-file' if current buffer is connected to a swank server.                                                               

Meant to be used in `after-save-hook'."
  (when (and (eq major-mode 'clojure-mode) (slime-connected-p))
    (slime-compile-and-load-file)))
(add-hook 'clojure-mode-hook (lambda ()
                               (define-key clojure-mode-map (kbd "M-/") 'slime-fuzzy-complete-symbol)))
>>>>>>> configs
