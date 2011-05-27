
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
  (interactive)
  (anything-other-buffer anything-clojars-source
                         "Clojars"))


(add-hook 'clojure-mode (lambda ()
                          (message "s")))
