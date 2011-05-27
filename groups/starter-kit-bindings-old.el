;; (cons (fin-e) nil)
;; (defun call-or-go (el &rest args)
;;   "Doc for [yas] elisp error!"
;;   (typecase el
;;     (function (apply el args))
;;     (symbol (and (not (null el))
;;                  (eq el (car args))))
;;     (string (string= el (car args)))
;;     (number (= el (car args)))
;;     (list (cons (call-or-go (car el) args)
;;                 (call-or-go (cdr el) args)))
;;     (t (null el))))




;; (defun np-get-key (p)
;;   (save-excursion
    
;;     (ignore-errors
;;       (if (functionp p)
;;           (funcall p)
;; 	(goto-char p))
;;       (progn
;;         (goto-char p)
;;         (paredit-forward)
;;         (paredit-backward-down 1)
;;         (if (looking-at "'")
;;             (goto-char 1)
;; 	  (progn
;; 	    (paredit-backward)
;; 	    (goto-char 1)))
;;         (bounds-of-thing-nearest-point 'sexp)))))

;; (defun np-get-command (p)  
;;   (save-excursion   
;;     (ignore-errors
;;       (if (functionp p)
;;           (funcall p)
;; 	(goto-char p))
;;       (progn (paredit-forward-down 1)
;;              (paredit-forward)
;;              (paredit-forward)
;;              (paredit-backward)
;;              (bounds-of-thing-nearest-point 'sexp)))))

;; (defun np-get-map (p)
;;   "Doc for [yas] elisp error!"
;;   (save-excursion
    
;;     (ignore-errors
;;       (if (functionp p)
;;           (funcall p)
;; 	(goto-char p))
;;       (progn (paredit-forward-down 2)
;;              (paredit-forward)
;;              (paredit-forward)
;;              (paredit-backward)
;;              (bounds-of-thing-nearest-point 'sexp)))))

;; (defun* np-test (&key place)
;;   "Doc for [yas] elisp error!"
;;   (interactive)
;;   (let* ((p (point))
;; 	 (res
;; 	  (progn                   
;; 	    (re-search-forward "define-key" nil t 1)
	    
;; 	    (or place p)
;; 	    (if (and (re-search-forward "define-key" nil t)
;; 		     (not (or  (paredit-in-string-p)
;; 			       (paredit-in-comment-p))))
;; 		(point)
;; 	      nil))))
;;     (message "%s" res)
;;     res))


(defun am-looking-at ()
  "Doc for [yas] elisp error!"
  (interactive)
  (let ((s (read-string "char: ")))
    (message "%s" (looking-at s))
    ))


;; (defun extract-keys ()
;;   "Doc for [yas] elisp error!"

;;   (let
;;       (unless (null p)
;;         (progn (goto-char p)
;;                (paredit-backward-up 1)
;;                (let*
;;                    ((command
;;                      (progn
;;                        (save-excursion

;;                          (paredit-forward)
;;                          (paredit-backward-down 1)
;;                          (paredit-backward)
;;                          (if (looking-at "'") (goto-char 1))
;;                          (push
;;                           (bounds-of-thing-nearest-point 'sexp)
;;                           res))))

;;                     (kmap
;;                      (progn
;;                        (save-excursion
;;                          (paredit-forward-down 1)
;;                          (paredit-forward)
;;                          (paredit-forward)
;;                          (paredit-backward)
;;                          (push
;;                           (bounds-of-thing-nearest-point 'sexp)
;;                           res))))

;;                     (key
;;                      (progn
;;                        (save-excursion
;;                          (paredit-forward-down 2)
;;                          (paredit-forward)
;;                          (paredit-forward)
;;                          (paredit-backward)
;;                          (push
;;                           (bounds-of-thing-nearest-point 'sexp)
;;                           res))))))))))


(defun text-thing (tap)
  "Doc for [yas] elisp error!"
  (loop
   for thing in tap
   collect (buffer-substring-no-properties (car thing) (cdr thing))))

(defun convert-to-lazy ()
  "Doc for [yas] elisp error!"
  (interactive)
  (pp (while
          (push )))
  (loop while (not (null v))
	with v = (extract-keys)
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
   ("<S-left>"    . windmove-left)
   ("<S-right>"   . windmove-right)
   ("<S-down>"    . windmove-down)
   ("<S-up>"      . windmove-up)
   ([mouse-3]     . dired-jump)
   ("M-z"         . dired-jump)
   ("H-p"         . push-point)
   ("M-j" . jump-to-register)
   ("H-w"         . push-word)
   ("M->"         . pop-tag-mark)
   ("H-r" . anything-show-kill-ring))
 )


(lazy-set-key
 '(("C-n"  . 'company-select-next)
  ("C-p"  . 'company-select-previous)
  ("C-d"  . 'company-show-doc-buffer)
  ("C-v"  . 'company-show-location)
  ("<tab>" .  'company-complete)
  ("C-g"  . '(lambda ()
                (interactive)
                (company-abort))))
 company-active-map)



(lazy-set-key '(("C-k" . (lambda ()
                           (interactive)
                           (kill-new (concat "\n" (anything-get-selection)))

                           (anything-next-line)))
                ("."  (lambda ()
                        (interactive)
                        (kill-append (concat "\n" (anything-get-selection)) nil)

                        (anything-next-line))))
              anything-map)



;; (lazy-set-key
;;  '(([down-mouse-3] . kill-this-buffer))
;;  image-mode-map
;;   )

;; (lazy-set-key
;;  '((122 . ibuffer-mark-compressed-file-buffers)
;;    (104 . ibuffer-mark-help-buffers)
;;    (101 . ibuffer-mark-dissociated-buffers)
;;    (47  . ibuffer-mark-dired-buffers)
;;    (114 . ibuffer-mark-read-only-buffers)
;;    (115 . ibuffer-mark-special-buffers)
;;    (117 . ibuffer-mark-unsaved-buffers)
;;    (109 . ibuffer-mark-modified-buffers)
;;    (77  . ibuffer-mark-by-mode)
;;    (42  . ibuffer-unmark-all))
;;  )

;; C-c             Prefix Command
;; C-e             anything-select-2nd-action-or-end-of-line
;; C-g             abort-recursive-edit
;; C-h             Prefix Command
;; C-j             anything-select-3rd-action
;; C-k             anything-delete-minibuffer-contents
;; RET             anything-exit-minibuffer
;; C-n             anything-next-line
;; C-o             anything-next-source
;; C-p             anything-previous-line
;; C-s             anything-isearch
;; C-t             anything-toggle-resplit-window
;; C-v             anything-next-page
;; C-x             Prefix Command
;; C-z             anything-execute-persistent-action
;; ESC             Prefix Command
;; A .. Z          anything-select-with-digit-shortcut
;; C-SPC           anything-toggle-visible-mark
;; C-.             anything-find-files-down-one-level
;; C-1 .. C-9      anything-select-with-digit-shortcut
;; <C-tab>         file-cache-minibuffer-complete
;; <M-next>        anything-scroll-other-window
;; <M-prior>       anything-scroll-other-window-down
;; <down>          anything-next-line
;; <f1>            Prefix Command
;; <help>          Prefix Command
;; <left>          anything-previous-source
;; <next>          anything-next-page
;; <prior>         anything-previous-page
;; <right>         anything-next-source
;; <up>            anything-previous-line

;; <help> m        anything-help

;; <f1> m          anything-help

;; C-h m           anything-help

;; C-c C-d         anything-delete-current-selection
;; C-c C-f         anything-follow-mode
;; C-c C-k         anything-kill-selection-and-quit
;; C-c C-u         anything-force-update
;; C-c C-x         Prefix Command
;; C-c C-y         anything-yank-selection

;; C-x C-f         anything-quit-and-find-file

;; C-M-v           anything-scroll-other-window
;; C-M-y           anything-scroll-other-window-down
;; M-<             anything-beginning-of-buffer
;; M->             anything-end-of-buffer
;; M-[             anything-prev-visible-mark
;; M-]             anything-next-visible-mark
;; M-n             anything-next-history-element
;; M-p             anything-previous-history-element
;; M-r             previous-matching-history-element
;; M-s             next-matching-history-element
;; M-v             anything-previous-page
;; C-M-S-v         anything-scroll-other-window-down

;; C-c C-x C-b     anything-send-bug-report-from-anything
;; C-c C-x C-d     anything-debug-output
;; C-c C-x RET     anything-display-all-visible-marks

;; (lazy-unset-key '("*")  ibuffer-mode-map)
;; (lazy-set-key
;;  '(("C-z" . ibuffer-quit)
;;    ("M-z" . ibuffer-quit))
;;  ibuffer-mode-map)


;; (define-key dired-mode-map (kbd "M-z") 'dired-up-directory)
(define-key paredit-mode-map (kbd "\\") 'self-insert-command)
;;; 
;; (define-key paredit-mode-map (kbd "H-s") 'fixup-whitespace)


(defun find-thing-at-point ()
  (interactive)
  (let* ((thing (intern (thing-at-point 'sexp))))
    (let* ((km (current-local-map)))
      
      (cond
       ((functionp thing) (find-function thing))

       ((boundp thing) (find-variable-other-window thing))
       (t (ffap))))))

(provide 'starter-kit-bindings)
