(bfr-rotate-buffer-torus 1)
(require 'dynamic-ring)
 (defun bring ()
   (interactive)
  
   (bfr-ring-add-buffer  major-mode (buffer-name (current-buffer))))


(defun my-buffer-ring-add ()
  "buffer-ring-add

   Add the current buffer to a ring. It will prompt for the ring
   to add the buffer to.
  "
  (let (name (buffer-name (current-buffer)))
    (if (boundp 'buffer-ring)
        (message
         "This buffer is already in ring %s, delete it before adding it to another ring"
         (bfr-ring-name buffer-ring))
      (progn
        (set (make-local-variable 'buffer-ring) (bfr-torus-get-ring name))
        (set (make-local-variable 'buffer-ring-this-buffer) (bfr-ring-add-buffer buffer-ring (current-buffer)))
        (set (make-local-variable 'buffer-ring-modeline) (concat " Ring (" name ") "))

        (add-hook 'kill-buffer-hook 'buffer-ring-delete t t)))))

(add-hook 'find-file-hook 'my-buffer-ring-add)

(dyn-ring-traverse buffer-ring-torus (lambda (a) (prin1 a)))
(dyn-ring-find buffer-ring-torus (lambda ( ring-element )
                                   (when (string-match-p "*" (dyn-ring-element-value ring-element)) t)))
