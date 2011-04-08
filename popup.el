
(defvar nanarpuss-help-window-configuration nil)
(defvar nanarpuss-buffer-name (get-buffer-create "np"))
(defvar nanarpuss-help-window-max-height 10)



(defun nanarpuss-handle-last (alternate-function recursion-function recursion-p)
  "The last process when match user keystroke or not match.
ALTERNATE-FUNCTION is the alternate function to be execute.
RECURSION-FUNCTION is the recursion function to be execute
when option RECURSION-P is non-nil."
  ;; Execute alternate function.
  (when (and alternate-function
             (functionp alternate-function))
    (call-interactively alternate-function))
  ;; Recursion execute when argument
  ;; `recursion-p' is `non-nil'.
  (if recursion-p
      (funcall recursion-function)))

(defun nanarpuss-help-window-exist-p ()
  "Return `non-nil' if `one-key' help window exist. Otherwise, return nil."
  (and (get-buffer nanarpuss-buffer-name)
       (window-live-p (get-buffer-window (get-buffer nanarpuss-buffer-name)))))

(defun nanarpuss-help-window-toggle (title info-alist)
  "Toggle the help window. Argument TITLE is title name for help information.Argument INFO-ALIST is help information as format ((key . describe) . command)."
  (if (nanarpuss-help-window-exist-p)
      ;; Close help window.
      (nanarpuss-help-window-close)
      ;; Open help window.
      (nanarpuss-help-window-open title info-alist))
  nil)

(defun nanarpuss-help-window-open (title info-alist)
  "Open the help window.
Argument TITLE is title name for help information.
Argument INFO-ALIST is help information as format ((key . describe) . command)."
  ;; Save current window configuration.
  (or nanarpuss-help-window-configuration
      (setq nanarpuss-help-window-configuration (current-window-configuration)))
  ;; Generate buffer information.
  (unless (get-buffer-create "np")
    (with-current-buffer (get-buffer-create nanarpuss-buffer-name)
      (goto-char (point-min))
      (save-excursion
        (insert (nanarpuss-highlight-help
                 title
                 (nanarpuss-help-format info-alist))))))
  ;; Pop `one-key' buffer.
  (pop-to-buffer nanarpuss-buffer-name)
  (set-buffer nanarpuss-buffer-name)
  ;; Adjust height of help window
  ;; to display buffer's contents exactly.
  (fit-window-to-buffer nil nanarpuss-help-window-max-height))


(defun nanarpuss-help-window-close ()
  "Close the help window."
  ;; Kill help buffer.
  (when (bufferp (get-buffer nanarpuss-buffer-name))
    (delete-window (get-buffer-window nanarpuss-buffer-name))
    (kill-buffer nanarpuss-buffer-name))
  ;; Restore window layout if
  ;; `nanarpuss-help-window-configuration' is valid value.
  (when (and nanarpuss-help-window-configuration
             (boundp 'nanarpuss-help-window-configuration))
    (set-window-configuration nanarpuss-help-window-configuration)
    (setq nanarpuss-help-window-configuration nil)))
