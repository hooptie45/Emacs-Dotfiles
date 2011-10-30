(provide 'starter-kit-funcs)

(defun new-init (name)
  (interactive "sName: ")
  (find-file (concat dotfiles-dir "custom-inits" ".el"))
  (insert (concat "\n(require 'custom-init-") name ")\n")
  (find-file (concat dotfiles-dir "custom-init-" name ".el"))
  (insert (concat "(provide 'custom-init-") name ")"))
(defvar np-completions)
(setq np-completions (list))
(defun np-after-company-hook (completion)
  (defvar-mode-local major-mode np-company-local-history nil)
  (setq np-words (alist>>))
  (setq np-company-local-history
        (alist>> np-company-local-history
                 major-mode
                 (alist))))


(defun p (form)
  "Doc for [yas] elisp error!"
  
  (save-window-excursion 
    (switch-to-buffer
     (get-buffer-create "*pp*"))
    (insert "\n")
    (insert-char ?# (window-width))
    (insert "\n")
    (let ((pt (point)) last)
      (insert "\n" (prin1-to-string form) "\n")
      (setq last (point))
      (goto-char (1+ pt))
      (while (search-forward "(quote " last t)
        (delete-backward-char 7)
        (insert "'")
        (forward-sexp)
        (delete-char 1))
      (goto-char (1+ pt))
      (cl-do-prettyprint)))
  (save-window-excursion 
    (pop-to-buffer 
     (get-buffer-create "*pp*") t))
  )








