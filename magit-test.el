

(let*
    ((there (magit-with-section "d" "nanar"
           (print "d")))
     
     (hi (magit-with-section "d" "nanar"
           (print "Hi")
           (magit-show-section)))
     (hip (magit-section-path hi))
     (tp (magit-section-path there)))
  (magit-section-hideshow tp)
  (magit-goto-section there)
  
  )

magit-section-action

(magit-cancel-section (magit-prev-section (magit-section-path "nanar")))

(defun test ()
  (interactive)
  (magit-section-action (item info "stage")
    ((untracked file)
     (magit-run-git "add" info))
    ((untracked)
     (apply #'magit-run-git "add" "--"
	    (magit-git-lines "ls-files" "--other" "--exclude-standard")))
    ((unstaged diff hunk)
     (if (magit-hunk-item-is-conflict-p item)
	 (error (concat "Can't stage individual resolution hunks.  "
			"Please stage the whole file.")))
     (magit-apply-hunk-item item "--cached"))
    ((unstaged diff)
     (magit-run-git "add" "-u" (magit-diff-item-file item)))
    ((staged *)
     (error "Already staged"))
    ((hunk)
     (error "Can't stage this hunk"))
    ((diff)
     (error "Can't stage this diff"))))
