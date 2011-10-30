(require 'org (expand-file-name (concat (alist paths :org)
                                        "org/")))


(custom-set-variables
 '(auto-raise-tool-bar-buttons t t)
 '(auto-resize-tool-bars t t)
 '(calendar-week-start-day 1)
 '(case-fold-search t)
 '(current-language-environment "Latin-1")
 '(default-input-method "latin-1-prefix")
 '(make-backup-files nil)
 '(normal-erase-is-backspace t)
 '(org-agenda-files (quote ("~/org/birthday.org" "~/org/newgtd.org")))
 '(org-agenda-ndays 7)
 '(org-agenda-repeating-timestamp-show-all nil)
 '(org-agenda-restore-windows-after-quit t)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-sorting-strategy (quote ((agenda time-up priority-down tag-up) (todo tag-up))))
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-todo-ignore-deadlines t)
 '(org-agenda-todo-ignore-scheduled t)
 '(org-agenda-todo-ignore-with-date t)
 '(org-agenda-window-setup (quote other-window))
 '(org-deadline-warning-days 7)
 '(org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"mystyles.css\">")
 '(org-fast-tag-selection-single-key nil)
 '(org-log-done (quote (done)))
 '(org-refile-targets (quote (("newgtd.org" :maxlevel . 1) ("someday.org" :level . 2))))
 '(org-reverse-note-order nil)
 '(org-tags-column -78)
 '(org-tags-match-list-sublevels nil)
 '(org-time-stamp-rounding-minutes (list 5))
 '(org-use-fast-todo-selection t)
 '(org-use-tag-inheritance nil)
 )
(transient-mark-mode t)




(setq default-major-mode 'org-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)

                                        ; dont use tabs for indenting
(setq-default indent-tabs-mode nil)
(setq-default tab-width 3)
(setq org-log-done t)
(setq org-agenda-include-diary nil)
(setq org-deadline-warning-days 7)
(setq org-timeline-show-empty-dates t)
(setq org-insert-mode-line-in-empty-file t)

;; 2006-05-26  - added following line
(require 'org-install)





(setq org-directory "~/org")
(setq org-default-notes-file "~/org/notes.org")
(setq remember-annotation-functions '(org-remember-annotation))
(setq remember-handler-functions '(org-remember-handler))
(add-hook 'remember-mode-hook 'org-remember-apply-template)


(setq org-remember-templates
      '(
        ("todo" ?t "* todo %^{brief description} %^g\n%?\n\tadded: %u" "~/org/newgtd.org" "tasks")
        ("private" ?p "\n* %^{topic} %t \n%i%?\n" "~/org/privnotes.org")
        ("wordofday" ?w "\n* %^{topic} \n%i%?\n" "~/org/wotd.org")
        ))


(setq org-agenda-exporter-settings
      '((ps-number-of-columns 1)
        (ps-landscape-mode t)
        (htmlize-output-type 'css)))

(setq org-agenda-custom-commands
      '(

        ("p" "projects"   
         ((tags "project")))

        ("h" "office and home lists"
         ((agenda)
          (tags-todo "office")
          (tags-todo "home")
          (tags-todo "computer")
          (tags-todo "dvd")
          (tags-todo "reading")))

        ("d" "daily action list"
         (
          (agenda "" ((org-agenda-ndays 1)
                      (org-agenda-sorting-strategy
                       (quote ((agenda time-up priority-down tag-up) )))
                      (org-deadline-warning-days 0)
                      ))))
        )
      )

(defun gtd ()
  (interactive)
  (find-file "~/org/newgtd.org")
  )



(add-hook 'org-agenda-mode-hook 'hl-line-mode)

                                        ; org mode start - added 20 feb 2006
;; the following lines are always needed. choose your own keys.

(global-font-lock-mode t)


(global-set-key (kbd "C-x C-l") 'goto-line)
(global-set-key (kbd "C-x C-y") 'copy-region-as-kill)

;; Changes all yes/no questions to y/n type
(fset 'yes-or-no-p 'y-or-n-p)

(setq org-directory "~/Resume/")
(setq org-default-notes-file (concat org-directory "/codex.org"))
(setq org-agenda-include-all-todo t)
(setq org-agenda-include-diary t)
(setq org-hide-leading-stars t)
(setq org-odd-levels-only t)
(setq org-todo-keywords 
      '((sequence "GOAL"
                  "FEATURE" 
                  "SOLUTION"
                  "OUTCOME")
        (sequence 
         "TODO" 
         "WRITE"
         "REVIEW" 
         "PENDING" "|"
         "DIFFERED"
         "DELEGATED" 
         "DONE"
         
         )))


(setq org-remember-templates
      '(("todo" ?t "* TODO %?\n  %i\n  %a" "~/org/codex.org" "Tasks")
        ("notes" ?n "* %?\n  %i\n  %a" "~/org/codex.org" "Inbox and Notes")
        ("blog" ?b "* %U %?\n\n  %i\n  %a" "~/org/blog.org")
        ("technology" ?s "* %U %?\n\n  %i\n  %a" "~/org/technology.org")
        ("fiction" ?f "* %U %?\n\n  %i\n  %a" "~/org/fiction.org")))
(setq my/org-lisp-directory "~/.emacs.d/org/lisp")
(defun my/compile-org (&optional directory)
  "Compile all *.el files that come with org-mode."
  (interactive)
  (setq directory (concat
                   (file-truename
                    (or directory my/org-lisp-directory)) "/"))

  (add-to-list 'load-path directory)

  (let ((list-of-org-files (file-expand-wildcards (concat directory "*.el"))))

    ;; create the org-install file
    (require 'autoload)
    (setq esf/org-install-file (concat directory "org-install.el"))
    (find-file esf/org-install-file)
    (erase-buffer)
    (mapc (lambda (x)
            (generate-file-autoloads x))
          list-of-org-files)
    (insert "\n(provide (quote org-install))\n")
    (save-buffer)
    (kill-buffer)
    (byte-compile-file esf/org-install-file t)

    (dolist (f list-of-org-files)
      (if (file-exists-p (concat f "c")) ; delete compiled files
          (delete-file (concat f "c")))
      (if my/org-compile-sources     ; Compile, if `my/org-compile-sources' is t
          (byte-compile-file f)))))

(setq my/org-lisp-directory "~/.emacs.d/org/lisp")
(defun my/compile-org (&optional directory)
  "Compile all *.el files that come with org-mode."
  (interactive)
  (setq directory (concat
                   (file-truename
                    (or directory my/org-lisp-directory)) "/"))

  (add-to-list 'load-path directory)

  (let ((list-of-org-files (file-expand-wildcards (concat directory "*.el"))))

    ;; create the org-install file
    (require 'autoload)
    (setq esf/org-install-file (concat directory "org-install.el"))
    (find-file esf/org-install-file)
    (erase-buffer)
    (mapc (lambda (x)
            (generate-file-autoloads x))
          list-of-org-files)
    (insert "\n(provide (quote org-install))\n")
    (save-buffer)
    (kill-buffer)
    (byte-compile-file esf/org-install-file t)

    (dolist (f list-of-org-files)
      (if (file-exists-p (concat f "c")) ; delete compiled files
          (delete-file (concat f "c")))
      (if my/org-compile-sources     ; Compile, if `my/org-compile-sources' is t
          (byte-compile-file f)))))



(set-variable 'confirm-kill-emacs 'yes-or-no-p)


(setq  my/org-compile-sources t)
(require 'org-install)
(require 'org-protocol)
(require 'org-protocol)


(setq org-default-notes-file "~/org/notes.org")


(setq org-agenda-exporter-settings
      '((ps-number-of-columns 1)
        (ps-landscape-mode t)
        (htmlize-output-type 'css)))
(require 'org-feed)
(load (expand-file-name (concat dotfiles-dir "vendor/org/lisp/org.elc") ))

(setq org-feed-alist
      '(("HighRise"
         "https://ac1b17264089d4523e59d5fde33fbd47:X@textsonic.highrisehq.com/recordings.atom"
         "~/org/feeds.org" "HighRise")
        ("Tickets"
         "https://textsonic.slsapp.com/profile/17961/rss/24634?token=80fdce49b639cbfc9ce9769fb81cb2b2"
         "~/org/feeds.org" "Tickets")
        ("Tickets 2"
         "https://textsonic.slsapp.com/profile/17961/rss/24634?token=80fdce49b639cbfc9ce9769fb81cb2b2"
         "~/org/feeds.org" "Tickets 2")))
