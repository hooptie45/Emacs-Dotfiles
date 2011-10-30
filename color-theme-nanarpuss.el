(defun color-theme-nanarpuss ()
  "White on black color theme by Richard Wellum, created 2003-01-16."
  (interactive)
  (color-theme-install
   '(color-theme-nanarpuss
     ((background-color . "gray5")
      (background-mode . dark)
      (border-color . "gray10")
      
      (cursor-color . "slateblue")
      (foreground-color . "gray90")
      (mouse-color . "white"))

     
     (CUA-global-mark-face ((t (:background "cyan" :foreground "black"))))
     (CUA-rectangle-face ((t (:background "maroon" :foreground "white"))))
     (CUA-rectangle-noselect-face ((t (:background "dimgray" :foreground "white"))))
     (anything-header ((t (:inherit header-line :background "#44f" :foreground "white" :height 1.2))))
     (bold ((t (:bold t :weight bold))))
     (bold-italic ((t (:italic t :bold t :slant italic :weight bold))))
     (border ((t (:background "Gray30"))))

     (comint-highlight-input ((t (:bold t :weight bold))))
     (comint-highlight-prompt ((t (:foreground "cyan"))))
     (completions-common-part ((t (:inherit default :foreground "orangered"))))
     (cursor ((t (:background "Red"))))
     (custom-button ((t (:background "light green" :foreground "dark olive green" :box 1))))
     (custom-button-mouse ((t (:background "IndianRed1" :foreground "IndianRed4" :box 1))))
     (custom-button-pressed ((t (:background "lightgrey" :foreground "black" :box (:line-width 2 :style pressed-button)))))
     (custom-comment ((t (:background "Grey13" :foreground "LightSkyBlue1" :box 1))))
     (custom-comment-tag ((t (:foreground "gray80"))))
     (default ((t (:stipple nil :background "gray5" :foreground "gray90" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 190 :width normal :foundry "apple" :family "Monaco"))))
     (diredp-dir-heading ((t (:background "White" :foreground "Blue"))))
     (diredp-dir-priv ((t (:foreground "hotpink"))))
     (diredp-file-name ((t (:foreground "OrangeRed"))))
     (diredp-file-suffix ((t (:inherit diredp-file-name))))
     (diredp-number ((t (:foreground "Orange"))))
     (esk-paren-face ((t (:foreground "grey50"))))
     (fixed-pitch ((t (:family "courier"))))
     (flash-paren-face-off ((t (nil))))
     (flash-paren-face-on ((t (nil))))
     (flash-paren-face-region ((t (:foreground "Gray30"))))
     (font-lock-builtin-face ((t (:foreground "#666"))))     
     (font-lock-comment-face ((t (:foreground "Gray30"))))
     (font-lock-constant-face ((t (:foreground "white"))))
     (font-lock-doc-face ((t (:foreground "gray30"))))
     (font-lock-function-name-face ((t (:bold t :foreground "Orange" :weight bold))))     
     (font-lock-keyword-face ((t (:foreground "LightSkyBlue"))))
     (font-lock-string-face ((t (:foreground "brown"))))     
     (font-lock-type-face ((t (:foreground "PaleGreen"))))
     (font-lock-variable-name-face ((t (:foreground "LightGoldenrod"))))
     (font-lock-warning-face ((t (:bold t :foreground "Pink" :weight bold))))
     (fringe ((t (:background "grey10"))))
     (header-line ((t (:box (:line-width -1 :style released-button) :foreground "grey20" :background "grey90" :box nil))))
     (highlight ((t (:background "white" :foreground "black"))))
     (highlight ((t (:background "white" :foreground "black"))))
     (highlight ((t (:background "white"))))
     (hl-line ((t (:background "Gray10" ))))
     (ibuffer-deletion-face ((t (:foreground "red"))))
     (ibuffer-marked-face ((t (:foreground "green"))))
     (idle-highlight ((t ( :inherit nil (:box (:line-width 1 :style solid))))))
     (ido-first-match ((t (:foreground "orange" ))))
     (ido-subdir ((t (:foreground "Green" ))))
     (isearch ((t (:background "palevioletred2" :foreground "brown4"))))
     (isearch-lazy-highlight-face ((t (:background "paleturquoise4"))))
     (italic ((t (:italic t :slant italic))))
     (magit-branch ((t (:bold t :weight bold))))
     (magit-item-highlight ((t (:background "gray13"))))
     (magit-section-title ((t (:bold t :foreground "yellow" :weight bold))))
     (menu ((t (nil))))
     (minibuffer-prompt ((((background dark)) (:foreground "#44f"))))
     (mode-line ((t (:foreground "orangered" :background "white" ))))
     (mouse ((t (:background "white"))))
     (rainbow-delimiters-paren-depth-1-face ((t (:foreground "yellow"))))
     (rainbow-delimiters-paren-depth-2-face ((t (:foreground "green"))))
     (rainbow-delimiters-paren-depth-3-face ((t (:foreground "blue"))))
     (rainbow-delimiters-paren-depth-4-face ((t (:foreground "orange"))))
     (rainbow-delimiters-paren-depth-5-face ((t (:foreground "HotPink"))))
     (rainbow-delimiters-paren-depth-6-face ((t (:foreground "SlateBlue"))))
     (rainbow-delimiters-paren-depth-7-face ((t (:foreground "Orchid"))))
     (rainbow-delimiters-paren-depth-8-face ((t (:foreground "white"))))    
     (rainbow-delimiters-unmatched-face ((t (:foreground "#88090B"))))
     (region ((t (:background "slategray"))))
     
     (secondary-selection ((t (:background "darkslateblue"))))
     (show-block-face1 ((t (:background "gray10"))))
     (show-block-face2 ((t (:background "gray15"))))
     (show-block-face3 ((t (:background "gray20"))))
     (show-block-face4 ((t (:background "gray25"))))
     (show-block-face5 ((t (:background "gray30"))))
     (show-block-face6 ((t (:background "gray35"))))
     (show-block-face7 ((t (:background "gray40"))))
     (show-block-face8 ((t (:background "gray45"))))
     (show-block-face9 ((t (:background "gray50"))))
     (show-paren-match-face ((t (:foreground "blue"))))
     (show-paren-mismatch-face ((t (:background "purple" :foreground "white"))))
     (tool-bar ((t (:background "grey75" :foreground "black" :box (:line-width 1 :style released-button)))))
     
     (tooltip ((t (:background "Gray30" :foreground "black"))))
     (trailing-whitespace ((t (:background "red"))))
     (underline ((t (:underline t))))
     (undo-tree-visualizer-active-branch-face ((((class color) (background dark)) (:foreground "orangered" :weight bold))))
     (variable-pitch ((t (:family "helv"))))
     (widget-button-face ((t (:bold t :weight bold (:box (:line-width 1 :color "LimeGreen" :style solid))))))
     (widget-button-pressed-face ((t (:foreground "red"))))
     (widget-documentation-face ((t (:foreground "lime green"))))
     (widget-field ((t (:background "White" :foreground "black" :box (:line-width 1 :color "black")))))
     (widget-field-face ((t (:box (:line-width 4 :color "gray14" :style nil) :foreground "gray70" :background "gray14"))))
     (widget-inactive-face ((t (:foreground "light gray"))))   
 
     (diff-hunk-header ((t (:background "gray30" :foreground "orange"))))

     (diff-header ((t (:background "gray30" :foreground "yellow"))))
     )))



(defun colorize-theme ()
  (interactive)
  (save-excursion 
    (let* ((word (progn
                   (paredit-forward)
                   (paredit-backward)
                   (forward-word 1)
                   (thing-at-point-with-bounds 'sexp))))
      
      (add-text-properties (cadr word) (cddr word) `(font-lock-face ,(car word))))))

(defun np-color-all ()
  (interactive)
  (while (>= (current-line) 14) 
    (colorize-theme)
    (paredit-backward)))

(defun jump-to-color ()
  (interactive)
  (hl-line-mode -1)
  (let* ((face (or (get-char-property (point) 'read-face-name)
                   (get-char-property (point) 'face)
                   'default)))
    (if (not (eq face 'default))
        (progn
          (switch-to-buffer "color-theme-nanarpuss.el")
          (goto-char (point-min))
          
          (if (search-forward "color-theme-nanarpuss")
              (if (search-forward (symbol-name face) nil t)
                  (progn
                    (paredit-backward-up)
                    (paredit-kill)
                    (delete-blank-lines)
                    (propertize (symbol-name face) )
                    (cl-prettyprint (color-theme-spec face))
                    (paredit-backward)
                    (forward-word 1)
                    (add-text-properties (car (bounds-of-thing-at-point 'sexp)) (cdr (bounds-of-thing-at-point 'sexp)) `(font-lock-face ,face)))
                  
                  (progn (beginning-of-defun)
                         (paredit-forward)
                         (paredit-backward-down 3)
                         (cl-prettyprint (color-theme-spec face))
                         (paredit-backward)
                         (forward-word 1)
                         (add-text-properties (car (bounds-of-thing-at-point 'sexp)) (cdr (bounds-of-thing-at-point 'sexp)) `(font-lock-face ,face)))))
          (hl-line-mode 1)
          (indent-buffer)))))

(provide 'color-theme-nanarpuss)