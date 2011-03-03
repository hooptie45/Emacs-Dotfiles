
(add-to-list 'load-path "~/slime")
(add-to-list 'load-path "~/slime/contrib")
(add-to-list 'load-path "~/.emacs.d/swank-clojure-enablers")
 
(load "~/.emacs.d/swank-clojure-enablers/swank-clojure-autoload.el")


(require 'swank-clojure-autoload)
(require 'slime)
(require 'slime-autodoc)
(require 'inferior-slime)
(require 'slime-repl)
(require 'slime-asdf)

(defun swank-clojure-reset-implementation ()
  "Redefines the clojure entry in `slime-lisp-implementations'."
  (aput 'slime-lisp-implementations 'clojure
        (list (swank-clojure-cmd) :init 'swank-clojure-init)))

(slime-setup '(slime-fancy slime-asdf slime-repl))
 
 (unload-feature 'slime-autodoc t)  
 
 (setq slime-multiprocessing t)
 (set-language-environment "UTF-8")  
 (setq slime-net-coding-system 'utf-8-unix)  
 
(defun swank-clojure-autoloads nil  
  (interactive)  
  (let ((generated-autoload-file "~/.emacs.d/swank-clojure-enablers/swank-clojure-autoload.el"))  
    (update-directory-autoloads "~/.emacs.d/swank-clojure-enablers")))


 
    


(setq slime-multiprocessing t)  
(set-language-environment "UTF-8")  
(setq slime-net-coding-system 'utf-8-unix)  
 
(setq slime-lisp-implementations  
      '((clisp   ("/usr/bin/clisp" "-K full"))  
        (sbcl    ("/usr/bin/sbcl"))  
        (abcl    ("~/Tools/bin/abcl"))  
        (ccl     ("~/Tools/bin/ccl"))))  
 
(setf slime-default-lisp 'sbcl)  
(global-set-key [f6] 'slime)

(defadvice slime-read-interactive-args (before add-clojure)  
;; Unfortunately we need to construct our Clojure-launching command  
;; at slime-launch time to reflect changes in the classpath. Slime  
;;has no mechanism to support this, so we must resort to advice.  
  (require 'assoc)  
  (aput 'slime-lisp-implementations 'clojure  
        (list (swank-clojure-cmd) :init 'swank-clojure-init)))

(setq swank-clojure-classpath (directory-files "~/.lein/plugins/" t ".jar$"))



(provide 'starter-kit-slime)
