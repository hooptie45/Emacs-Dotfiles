;;; starter-kit-defuns.el --- Define some custom function
(require 'thingatpt)
(require 'imenu)
(defun unit-at-cursor  (unit)
  "Return the string and boundary of UNIT  under cursor.

Returns a vector [text a b], where text is the string and a and b are its boundary.

UNIT can be:
• 'word — sequence of 0 to 9, A to Z, a to z, and hyphen.
• 'glyphs — sequence of visible glyphs. Useful for file name, url, …, that doesn't have spaces in it.
• 'line — delimited by “\\n”.
• 'block — delimited by “\\n\\n” or beginning/end of buffer.
• 'buffer — whole buffer. (respects `narrow-to-region')
• a vector [beginRegex endRegex] — The elements are regex strings used to determine the beginning/end of boundary chars. They are passed to `skip-chars-backward' and `skip-chars-forward'. For example, if you want paren as delimiter, use [\"^(\" \"^)\"]

Example usage:
    (setq bds (unit-at-cursor 'line))
    (setq myText (elt bds 0) p1 (elt bds 1) p2 (elt bds 2)  )

This function is similar to `thing-at-point' and `bounds-of-thing-at-point'.
The main differences are:
• this function returns the text and the 2 boundaries as a vector in one shot.
• 'line always returns the line without end of line character, avoiding inconsistency when the line is at end of buffer.
• 'word does not depend on syntax table.
• 'block does not depend on syntax table."
  (let (p1 p2)
    (save-excursion
      (cond
        ((eq unit 'word)
         (let ((wordcharset "-A-Za-zÀÁÂÃÄÅÆÇÈÉÊËÌÍÎÏÐÑÒÓÔÕÖØÙÚÛÜÝÞßàáâãäåæçèéêëìíîïðñòóôõöøùúûüýþÿ"))
           (skip-chars-backward wordcharset)
           (setq p1 (point))
           (skip-chars-forward wordcharset)
           (setq p2 (point))))

        ((eq unit 'glyphs)
         (progn
           (skip-chars-backward "[:graph:]")
           (setq p1 (point))
           (skip-chars-forward "[:graph:]")
           (setq p2 (point))))

        ((eq unit 'buffer)
         (progn
           (setq p1 (point-min))
           (setq p2 (point-max))))

        ((eq unit 'line)
         (progn
           (setq p1 (line-beginning-position))
           (setq p2 (line-end-position))))
        ((eq unit 'block)
         (progn
           (if (re-search-backward "\n\n" nil t)
               (progn (forward-char 2)
                      (setq p1 (point) ))
               (setq p1 (line-beginning-position)))

           (if (re-search-forward "\n\n" nil t)
               (progn (backward-char)
                      (setq p2 (point)))
               (setq p2 (line-end-position)))))

        ((vectorp unit)
         (let (p0)
           (setq p0 (point))
           (skip-chars-backward (elt unit 0))
           (setq p1 (point))
           (goto-char p0)
           (skip-chars-forward (elt unit 1))
           (setq p2 (point))))))

    (vector (buffer-substring-no-properties p1 p2) p1 p2)))

(defun get-selection-or-unit  (unit)
  "Return the string and boundary of text selection or UNIT under cursor.

If `region-active-p' is true, then the region is the unit.  Else,
it depends on the UNIT. See `unit-at-cursor' for detail about
UNIT.

Returns a vector [text a b], where text is the string and a and b
are its boundary."
  (interactive)

  (let (mytext p1 p2)
    (if (region-active-p)
        (progn
          (setq p1 (region-beginning))
          (setq p2 (region-end))
          (setq mytext (buffer-substring p1 p2))
          (vector (buffer-substring-no-properties p1 p2) p1 p2))
        (unit-at-cursor unit))))
(defun make-user-gridedit ()
  (make-instance 'gridedit
		 :name 'user-grid
		 :data-class 'user
		 :view 'user-table-view
		 :widgit-prefix-fn (lambda (&rest args)
				     (declare (ignore args))
				     (with-html (:h1 "Users")))
		 :item-data-view 'user-data-view
		 :item-form-view 'user-form-view))

(defun get-class-name ()
  (let ((cla ""))
    (save-excursion
      (re-search-back ward "defclass " nil t)
      (let ((m (progn (for ward- word 2) (bounds-of-thing-nearest-point 'word))))
	(setq cla (buffer-substring-no-properties (car m) (cdr m)))))
    cla))


(defun make-lisp-files (n)
  (interactive "sPACKAGE: ")

  (mapc (lambda (f)
	  (let ((b (concat "~/CL/tutorial/src/" f ".lisp")))
	    (with-temp-buffer
	      (insert (format "(in-package :%s)" n))
	      (write-file b t))))
	'("layouts"
	  "models"
	  " widgets"
	  "vie ws")))

(defun hide-bodies ()
  (interactive)
  (if (= -1 selective-display)
      (set-selective-display 1)
      (set-selective-display -1)))
;; Net work

(defun get-vie w-funcs (b)
       (interactive "b")
       (let ((matches (list)))
         (with-current-buffer b
           (goto-char (point-min))

           (while (re-search-for ward "\\(:vie w\\|:item-data-vie w\\|:item-form-vie w\\)" nil t)
             (setq matches (cons (progn (for ward- word) (bounds-of-symbol-nearest-point)) matches))))
         (goto-char (point-max))
         (mapc (lambda (m)
                 (insert (concat "(defvie w " m " ()\n ())\n\n")))
               (mapcar (lambda (m) (buffer-substring-no-properties (car m) (cdr m))) matches))))


(defun vie w-url ()
       "Open a ne w buffer containing the contents of URL."
       (interactive)
       (let* ((default (thing-at-point-url-at-point))
              (url (read-from-minibuffer "URL: " default)))
         (s witch-to-buffer (url-retrieve-synchronously url))
         (rename-buffer url t)
         ;; TODO: s witch to nxml/nxhtml mode
         (cond ((search-for ward "<?xml" nil t) (xml-mode))
               ((search-for ward "<html" nil t) (html-mode)))))

;; Buffer-related

(defun ido-imenu ()
  "Update the imenu index and then use ido to select a symbol to navigate to. Symbols matching the text at point are put first in the completion list."
  (interactive)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
	(symbol-names '()))
    (flet ((addsymbols (symbol-list)
             (when (listp symbol-list)
               (dolist (symbol symbol-list)
                 (let ((name nil) (position nil))
                   (cond
                     ((and (listp symbol) (imenu--subalist-p symbol))
                      (addsymbols symbol))

                     ((listp symbol)
                      (setq name (car symbol))
                      (setq position (cdr symbol)))

                     ((stringp symbol)
                      (setq name symbol)
                      (setq position (get-text-property 1 'org-imenu-marker symbol))))

                   (unless (or (null position) (null name))
                     (add-to-list 'symbol-names name)
                     (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    ;; If there are matching symbols at point,put them at the beginning of `symbol-names'.
    (let ((symbol-at-point (thing-at-point 'symbol)))
      (when symbol-at-point
	(let* ((regexp (concat (regexp-quote symbol-at-point) "$"))
	       (matching-symbols (delq nil (mapcar (lambda (symbol)
						     (if (string-match regexp symbol) symbol))
						   symbol-names))))
	  (when matching-symbols
	    (sort matching-symbols (lambda (a b) (> (length a) (length b))))
	    (mapc (lambda (symbol) (setq symbol-names (cons symbol (delete symbol symbol-names))))
		  matching-symbols)))))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
	   (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))

(defun local-column-number-mode ()
  (make-local-variable 'column-number-mode)
  (column-number-mode t))

(defun local-comment-auto-fill ()
  (set (make-local-variable 'comment-auto-fill-only-comments) t)
  (auto-fill-mode t))

(defun turn-on-hl-line-mode ()
  (when (> (display-color-cells) 8) (hl-line-mode t)))

(defun turn-on-save-place-mode ()
  (setq save-place t))

(defun turn-on-whitespace ()
  (whitespace-mode t))

(defun turn-on-paredit ()
  (paredit-mode t))

(defun turn-off-tool-bar ()
  (tool-bar-mode -1))

(defun add-watch-words ()
  (font-lock-add-keywords
		     nil '(("\\<\\(FIX\\|TODO\\|FIXME\\|HACK\\|REFACTOR\\):"
			    1 font-lock-warning-face t))))

(add-hook 'coding-hook 'local-column-number-mode)
(add-hook 'coding-hook 'local-comment-auto-fill)
(add-hook 'coding-hook 'turn-on-hl-line-mode)
(add-hook 'coding-hook 'turn-on-save-place-mode)
					;(add-hook 'coding-hook 'pretty-lambdas)
(add-hook 'coding-hook 'add-watch-words)
					;(add-hook 'coding-hook 'idle-highlight)

(defun run-coding-hook ()
  "Enable things that are convenient across all coding buffers."
  (run-hooks 'coding-hook))

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing- whitespace))

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

;; Cosmetic

(defun pretty-lambdas ()
  (font-lock-add-key words
		     nil `(("(?\\(lambda\\>\\)"
			    (0 (progn (compose-region (match-beginning 1) (match-end 1)
						      ,(make-char 'greek-iso8859-7 107))
				      nil))))))

;; Other

(defun eval-and-replace ()
  "Replace the preceding sexp with its value."
  (interactive)
  (back ward-kill-sexp)
  (condition-case nil
      (prin1 (eval (read (current-kill 0)))
	     (current-buffer))
    (error (message "Invalid expression")
	   (insert (current-kill 0)))))

(defun recompile-init ()
  "Byte-compile all your dotfiles again."
  (interactive)
  (byte-recompile-directory dotfiles-dir 0)
  ;; TODO: remove elpa-to-submit once everything's submitted.
  (byte-recompile-directory (concat dotfiles-dir "elpa-to-submit/") 0))

(defun regen-autoloads (&optional force-regen)
  "Regenerate the autoload definitions file if necessary and load it."
  (interactive "P")
  (let ((autoload-dir (concat dotfiles-dir "/elpa-to-submit"))
	(generated-autoload-file autoload-file))
    (when (or force-regen
	      (not (file-exists-p autoload-file))
	      (some (lambda (f) (file-ne wer-than-file-p f autoload-file))
		    (directory-files autoload-dir t "\\.el$")))
      (message "Updating autoloads...")
      (let (emacs-lisp-mode-hook)
	(update-directory-autoloads autoload-dir))))
  (load autoload-file))

(defun sudo-edit (&optional arg)
  (interactive "p")
  (if (or arg (not buffer-file-name))
      (find-file (concat "/sudo:root@localhost:" (ido-read-file-name "File: ")))
      (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))

(defun lorem ()
  "Insert a lorem ipsum."
  (interactive)
  (insert "Lorem ipsum dolor sit amet,consectetur adipisicing elit,sed do "
	  "eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim"
	  "ad minim veniam,quis nostrud exercitation ullamco laboris nisi ut "
	  "aliquip ex ea commodo consequat. Duis aute irure dolor in "
	  "reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla "
	  "pariatur. Excepteur sint occaecat cupidatat non proident,sunt in "
	  "culpa qui officia deserunt mollit anim id est laborum."))

(defun switch-or-start (function buffer)
       "If the buffer is current,bury it,other wise invoke the function."
       (if (equal (buffer-name (current-buffer)) buffer)
           (bury-buffer)
           (if (get-buffer buffer)
               (switch-to-buffer buffer)
               (funcall function))))

(defun insert-date ()
  "Insert a time-stamp according to locale's date and time format."
  (interactive)
  (insert (format-time-string "%c" (current-time))))

(defun pairing-bot ()
  "If you can't pair program with a human,use this instead."
  (interactive)
  (message (if (y-or-n-p "Do you have a test for that? ") "Good." "Bad!")))

(defun esk-paredit-nonlisp ()
  "Turn on paredit mode for non-lisps."
  (set (make-local-variable 'paredit-space-delimiter-chars)
       (list ?\"))
  (paredit-mode 1))

(defun esk-space-for-delimiter? (endp delimiter)
  (not (member major-mode '(ruby-mode espresso-mode js2-mode))))

(eval-after-load 'paredit
  '(add-to-list 'paredit-space-for-delimiter-predicates
    'esk-space-for-delimiter?))

(defun message-point ()
  (interactive)
  (message "%s" (point)))

(defun esk-disapproval ()
  (interactive)
  (insert "ಠ_ಠ"))

(defun esk-agent-path ()
  (if (eq system-type 'dar win)
      "*launch*/Listeners"
      "*ssh*/agent\.*"))

(defun esk-find-agent ()
  (let* ((path-clause (format "-path \"%s\"" (esk-agent-path)))
	 (find-command (format "$(find -L /tmp -uid $UID %s -type s 2> /dev/null)"
			       path-clause)))
    (first (split-string
	    (shell-command-to-string
	     (format "/bin/ls -t1 %s | head -1" find-command))))))

(defun fix-agent ()
  (interactive)
  (let ((agent (esk-find-agent)))
    (setenv "SSH_AUTH_SOCK" agent)
    (message agent)))

(defun toggle-fullscreen ()
  (interactive)
  ;; TODO: this only works for X. patches welcome for other OSes.
  (set-frame-width (selected-frame) 3000)
  (position)
  (set-frame-height (selected-frame) 3000))

;; A monkeypatch to cause annotate to ignore whitespace
(defun vc-git-annotate-command (file buf &optional rev)
  (let ((name (file-relative-name file)))
    (vc-git-command buf 0 name "blame" "- w" rev)))
(defun replace-in-sexp (s)
  (interactive "sReplace with: ")
  (replace-in-f s (bounds-of-thing-nearest-point 'sexp)))
