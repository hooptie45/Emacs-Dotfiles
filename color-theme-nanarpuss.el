(defun color-theme-nanarpuss ()
  "White on black color theme by Richard Wellum, created 2003-01-16."
  (interactive)
  (color-theme-install
   '(color-theme-nanarpuss
     ((background-color . "gray5")
      (background-mode . dark)
      (border-color . "gray30")
      
      (cursor-color . "yellow")
      (foreground-color . "gray90")
      (mouse-color . "white"))
     ((CUA-mode-global-mark-cursor-color . "cyan")
      (CUA-mode-normal-cursor-color . "yellow")
      

      (CUA-mode-overwrite-cursor-color . "red")
      (CUA-mode-read-only-cursor-color . "green")
      (help-highlight-face . underline)
      (ibuffer-dired-buffer-face . font-lock-function-name-face)
      (ibuffer-help-buffer-face . font-lock-comment-face)
      (ibuffer-hidden-buffer-face . font-lock-warning-face)
      (ibuffer-occur-match-face . font-lock-warning-face)
      (ibuffer-read-only-buffer-face . font-lock-type-face)
      (ibuffer-special-buffer-face . font-lock-keyword-face)
      (ibuffer-title-face . font-lock-type-face)
      (list-matching-lines-face . bold)
      (ps-line-number-color . "black")
      (ps-zebra-color . 0.95)
      (tags-tag-face . default)
      (view-highlight-face . highlight)
      (widget-mouse-face . highlight))
     (default ((t (:stipple nil :background "gray5"
                            :foreground "gray90" :inverse-video nil
                            :box nil :strike-through nil :overline nil
                            :underline nil :slant normal :weight normal :height 160
                            :width normal :foundry "apple" :family "Monaco"))))
     (CUA-global-mark-face ((t (:background "cyan" :foreground "black"))))
     (CUA-rectangle-face ((t (:background "maroon" :foreground "white"))))
     (CUA-rectangle-noselect-face ((t (:background "dimgray" :foreground "white"))))
     (bold ((t (:bold t :weight bold))))
     (bold-italic ((t (:italic t :bold t :slant italic :weight bold))))
     (border ((t (:background "Gray30"))))
     (clearcase-dired-checkedout-face ((t (:foreground "red"))))
     (comint-highlight-input ((t (:bold t :weight bold))))
     (comint-highlight-prompt ((t (:foreground "cyan"))))
     (cursor ((t (:background "Red"))))
     (fixed-pitch ((t (:family "courier"))))
     (highlight ((t (:background "white" :foreground "black"))))
     (flash-paren-face-off ((t (nil))))
     (flash-paren-face-on ((t (nil))))

     ;; RAINBOW
     
     ;; Unmatched delimiter face:
     
     (rainbow-delimiters-unmatched-face ((t (:foreground "#88090B"))))
     (rainbow-delimiters-paren-depth-1-face ((t (:foreground "yellow"))))
     (rainbow-delimiters-paren-depth-2-face ((t (:foreground "green"))))
     (rainbow-delimiters-paren-depth-3-face ((t (:foreground "blue"))))
     (rainbow-delimiters-paren-depth-4-face ((t (:foreground "orange"))))
     (rainbow-delimiters-paren-depth-5-face ((t (:foreground "HotPink"))))
     (rainbow-delimiters-paren-depth-6-face ((t (:foreground "SlateBlue"))))
     (rainbow-delimiters-paren-depth-7-face ((t (:foreground "Orchid"))))
     (rainbow-delimiters-paren-depth-8-face ((t (:foreground "white"))))
     
     (flash-paren-face-region ((t (:foreground "Gray30"))))
     (font-lock-builtin-face ((t (:foreground "Green"))))
     (font-lock-comment-face ((t (:foreground "Gray30"))))
     (font-lock-constant-face ((t (:foreground "white"))))
     (font-lock-doc-face ((t (:foreground "gray30"))))
     (font-lock-function-name-face ((t (:foreground "Orange" :weight bold))))
     (font-lock-keyword-face ((t (:foreground "Yellow"))))
     (font-lock-string-face ((t (:foreground "SlateBlue"))))
     (font-lock-type-face ((t (:foreground "PaleGreen"))))
     (font-lock-variable-name-face ((t (:foreground "LightGoldenrod"))))
     (font-lock-warning-face ((t (:bold t :foreground "Pink" :weight bold))))
     
     
     
     (fringe ((t (:background "grey10"))))
     (header-line ((t (:box (:line-width -1 :style released-button) :foreground "grey20" :background "grey90" :box nil))))
     (highlight ((t (:background "white"))))
     (ibuffer-deletion-face ((t (:foreground "red"))))
     (ibuffer-marked-face ((t (:foreground "green"))))
     (isearch ((t (:background "palevioletred2" :foreground "brown4"))))
     (isearch-lazy-highlight-face ((t (:background "paleturquoise4"))))
     (italic ((t (:italic t :slant italic))))
     (menu ((t (nil))))
     (mode-line ((t (:foreground "gray70" :background "white" ))))
     (mouse ((t (:background "white"))))
     (region ((t (:background "DodgerBlue"))))
     
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
     (show-paren-match-face ((t (:foreground "blue" :background "gray15"))))
     (show-paren-mismatch-face ((t (:background "purple" :foreground "white"))))
     (tool-bar ((t (:background "grey75" :foreground "black" :box (:line-width 1 :style released-button)))))
     (tooltip ((t (:background "Gray30" :foreground "black"))))
     (trailing-whitespace ((t (:background "red"))))
     (underline ((t (:underline t))))
     (variable-pitch ((t (:family "helv"))))
     (widget-button-face ((t (:bold t :weight bold (:box
                                                    (:line-width 1 :color "LimeGreen" :style solid))))))
     (widget-button-pressed-face ((t (:foreground "red"))))
     (widget-documentation-face ((t (:foreground "lime green"))))
     (widget-field-face ((t
                          (:box
                           (:line-width 4 :color "gray14" :style nil)
                           :foreground "gray70"
                           :background "gray14"))))
     (widget-inactive-face ((t (:foreground "light gray"))))
     
     (idle-highlight ((t ( :inherit nil
                                    (:box
                                     (:line-width 1
                                                  :style solid))))))
     (default ((t (:stipple nil :background "gray5" :foreground "gray90" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 160 :width normal :foundry "apple" :family "Monaco"))))
     (anything-header ((t (:inherit header-line :background "#44f" :foreground "white" :height 1.2))))
     (completions-common-part ((t (:inherit default :foreground "orangered"))))
     (custom-button ((t (:background "light green" :foreground "dark olive green" :box 1))))
     (custom-button-mouse ((t (:background "IndianRed1" :foreground "IndianRed4" :box 1))))
     (custom-button-pressed ((t (:background "lightgrey" :foreground "black" :box (:line-width 2 :style pressed-button)))))
     (custom-comment ((t (:background "Grey13" :foreground "LightSkyBlue1" :box 1))))
     (custom-comment-tag ((t (:foreground "gray80"))))
     (highlight ((t (:background "white" :foreground "black"))))
     (magit-item-highlight ((((class color) (background dark)) (:background "gray13"))))
     (magit-section-title ((t (:inherit magit-header :foreground "yellow" :weight bold))))
     (minibuffer-prompt ((((background dark)) (:foreground "#44f"))))
     (undo-tree-visualizer-active-branch-face ((((class color) (background dark)) (:foreground "orangered" :weight bold))))
     (widget-field ((t (:background "White" :foreground "black" :box (:line-width 1 :color "black")))))

     (hl-line ((t (:background "Gray10" ))))
     (ido-first-match ((t (:foreground "orange" ))))
     (ido-subdir ((t (:foreground "Green" ))))
     (widget-single-line-field-face ((t (:background "dim gray")))))))
(text-scale-adjust 1)

(provide 'color-theme-nanarpuss)
;; (default
;;     ((t (:stipple nil
;;                   :background "gray5"
;;                   :foreground "gray90"
;;                   :inverse-video nil
;;                   :box nil
;;                   :strike-through nil
;;                   :overline nil
;;                   :underline nil
;;                   :slant normal
;;                   :weight normal
;;                   :height 160
;;                   :width normal
;;                   :foundry "apple"
;;                   :family "Monaco"))))

;; (anything-header
;;  ((t (
;;       :inherit header-line
;;                :background "#44f"

;;                :foreground "white"
;;                :height 1.2))))

;; (completions-common-part
;;  ((t (
;;       :inherit default
;;                :foreground "orangered"))))

;; (custom-button
;;  ((t (
;;       :background "light green"
;;                   :foreground "dark olive green"
;;                   :box 1))))

;; (custom-button-mouse
;;  ((t (
;;       :background "IndianRed1"
;;                   :foreground "IndianRed4"
;;                   :box 1))))

;; (custom-button-pressed
;;  ((((type x w32 ns) (class color)) (
;;                                     :background "lightgrey"
;;                                                 :foreground "black"
;;                                                 :box (
;;                                                       :line-width 2
;;                                                                   :style pressed-button)))))

;; (custom-comment
;;  ((t (
;;       :background "Grey13"
;;                   :foreground "LightSkyBlue1"
;;                   :box 1))))

;; (custom-comment-tag ((((class color) (background dark)) (
;;                                                          :foreground "gray80"))))

;; (highlight
;;  ((t (
;;       :background "white"
;;                   :foreground "black"))))

;; (magit-item-highlight
;;  (((class color) (background dark)) (
;;                                      :background "gray13"))))

;; (magit-section-title
;;  ((t (
;;       :inherit magit-header
;;                :foreground "yellow"
;;                :weight bold))))

;; (minibuffer-prompt
;;  ((((background dark)) (
;;                         :foreground "#44f"))))

;; (widget-field
;;  ((t (
;;       :background "White"
;;                   :foreground "black"
;;                   :box (
;;                         :line-width 1
;;                                     :color "black"))))))
