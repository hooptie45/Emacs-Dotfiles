
(provide 'starter-kit-clojure)
;; starter-kit-lisp.el ends here
(setq class-path (concat "-cp "                                               
                         "./classes/:"                                                 
                         "/Users/hooptie45/CLJ/my-test/src:"
                         "/Users/hooptie45/CLJ/my-test/test:"
                         "/Users/hooptie45/CLJ/my-test/classes:"
                         "/Users/hooptie45/CLJ/my-test/test-resources:"
                         "/Users/hooptie45/CLJ/my-test/resources:"
                         "/Users/hooptie45/CLJ/my-test/lib/arpack-combo-0.1.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/clj-time-0.3.0-20101217.045604-1.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/clojure-1.2.0.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/clojure-contrib-1.2.0.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/clojure-json-1.1-20091229.021828-4.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/clout-0.4.0.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/commons-codec-1.4.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/commons-fileupload-1.2.1.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/commons-io-1.4.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/compojure-0.6.0.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/gnujaxp-1.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/incanter-1.0-20091121.091400-2.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/jcommon-1.0.16.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/jfreechart-1.0.13.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/jline-0.9.94.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/joda-time-1.6.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/junit-3.8.1.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/mysql-connector-java-5.1.6.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/netlib-java-0.9.1.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/opencsv-2.0.1.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/parallelcolt-0.7.2.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/processing-core-1.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/ring-core-0.3.5.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/servlet-api-2.5.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/clj-stacktrace-0.2.0.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/clojure-1.2.0.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/clojure-contrib-1.2.0.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/commons-codec-1.4.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/commons-fileupload-1.2.1.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/commons-io-1.4.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/hiccup-0.3.1.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/jetty-6.1.26.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/jetty-util-6.1.26.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/lein-ring-0.3.2.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/ring-core-0.3.5.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/ring-devel-0.3.5.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/ring-jetty-adapter-0.3.5.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/ring-reload-modified-0.1.0.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/ring-servlet-0.3.5.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/servlet-api-2.5-20081211.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/servlet-api-2.5.jar:"
                         "/Users/hooptie45/CLJ/my-test/lib/dev/swank-clojure-1.3.2-SNAPSHOT.jar:"
                         "/Users/hooptie45/.lein/plugins/arpack-combo-0.1.jar:"
                         "/Users/hooptie45/.lein/plugins/clojure-1.2.0.jar:"
                         "/Users/hooptie45/.lein/plugins/clojure-contrib-1.2.0.jar:"
                         "/Users/hooptie45/.lein/plugins/clojure-contrib-slim.jar:"
                         "/Users/hooptie45/.lein/plugins/clojure-contrib.jar:"
                         "/Users/hooptie45/.lein/plugins/clojure-json-1.1-20091229.021828-4.jar:"
                         "/Users/hooptie45/.lein/plugins/compojure-0.6.0.jar:"
                         "/Users/hooptie45/.lein/plugins/gnujaxp-1.jar:"
                         "/Users/hooptie45/.lein/plugins/incanter-1.0-20091121.091400-2.jar:"
                         "/Users/hooptie45/.lein/plugins/incanter-1.2.3.jar:"
                         "/Users/hooptie45/.lein/plugins/incanter.jar:"
                         "/Users/hooptie45/.lein/plugins/jcommon-1.0.16.jar:"
                         "/Users/hooptie45/.lein/plugins/jfreechart-1.0.13.jar:"
                         "/Users/hooptie45/.lein/plugins/jline-0.9.94.jar:"
                         "/Users/hooptie45/.lein/plugins/joda-time-1.6.jar:"
                         "/Users/hooptie45/.lein/plugins/junit-3.8.1.jar:"
                         "/Users/hooptie45/.lein/plugins/lein-clojars-lein-clojars-0.6.0.jar:"
                         "/Users/hooptie45/.lein/plugins/mysql-connector-java-5.1.6.jar:"
                         "/Users/hooptie45/.lein/plugins/netlib-java-0.9.1.jar:"
                         "/Users/hooptie45/.lein/plugins/opencsv-2.0.1.jar:"
                         "/Users/hooptie45/.lein/plugins/parallelcolt-0.7.2.jar:"
                         "/Users/hooptie45/.lein/plugins/processing-core-1.jar:"
                          "."))


(setq clojure-command (concat "java -server "  
                              class-path " clojure.main -i init.clj -r"))
(setq inferior-lisp-program clojure-command)

(setq slime-redirect-inferior-output nil)

(define-key clojure-mode-map (kbd "M-/") 'slime-fuzzy-complete-symbol)

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
(project-ns)

