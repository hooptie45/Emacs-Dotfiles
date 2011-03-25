
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'hyper)
(setq mac-function-modifier 'super)

(setq ring-bell-function 'ignore)

(add-to-list 'exec-path "/opt/local/bin")
(add-to-list 'exec-path "/usr/local/bin")
(add-to-list 'exec-path "~/bin")
(add-to-list 'exec-path "/opt/bin")
(add-to-list 'exec-path "/usr/bin")

(setq visual-bell nil)
(setq visible-bell nil)
;; Load path etc:  
(add-to-list 'load-path "~/elisp")
(add-to-list 'load-path "~/.emacs")
(load "~/.e/vendor/color-theme/themes/color-theme-library")
(color-theme-clarity)
(let ((path))
  (setq path (concat "~/.gem/ruby/1.8/bin:"
                     "~/bin:"
                     "~/src/homebrew/bin:"
                     "/usr/local/bin:"
                     "/usr/bin:"
                     "/bin"))
  (setenv "PATH" path))

(setq ring-bell-function 'ignore)



(setq visual-bell nil)
(setq visible-bell nil)
;; Load path etc:




(add-to-list 'load-path "~/elisp")
(setq ring-bell-function 'ignore)


(setq visual-bell nil)
(setq visible-bell nil)
;; Load path etc:


(add-to-list 'load-path "~/elisp")
(mapc '(lambda (f)
         (require f)) '(
                        wdired
                        anything
                        dired+
                        doremi
                        thing-cmds
                        undo-tree
                        anything-config
                        anything-etags
                        anything-grep
                        anything-dabbrev-expand
                        anything-auto-install
                        point-ring
                        anything-el-swank-fuzzy
                        bookmark+-1
                        bookmark+
                        dired-x
                        buffer-ring
                        line-comment-banner
                        fastnav
                        wdired
			clojure-mode
                        etags-extension
                        cl
                        saveplace
                        ffap
                        uniquify
                        doremi-cmd
                        doremi
                        recentf
                        package
                        starter-kit-defuns
                        starter-kit-bindings
                        starter-kit-misc
                        starter-kit-registers
                        starter-kit-eshell
                        starter-kit-lisp
                        starter-kit-ruby
                        slime-init
                        magit
                        ))


    (require 'dired-x)
    (setq-default dired-omit-files-p t) ; this is buffer-local variable
    (setq dired-omit-files "^\\.?#\\|^\\.$\\|~$\\|backups\\|trash\\|^.git$")



(setq custom-file (concat dotfiles-dir "custom.el"))
(load "package")
(require 'magit)


(load custom-file 'noerror)

(provide 'init)
(require 'simple)


(defun color-theme-nanarpuss ()
  "White on black color theme by Richard Wellum, created 2003-01-16."
  (interactive)
  (color-theme-install
   '(color-theme-nanarpuss
     ((background-color . "black")
      (background-mode . dark)
      (border-color . "gray30")
      (cursor-color . "HotPink3")
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
     (default ((t (nil))))
     (CUA-global-mark-face ((t (:background "cyan" :foreground "black"))))
     (CUA-rectangle-face ((t (:background "maroon" :foreground "white"))))
     (CUA-rectangle-noselect-face ((t (:background "dimgray" :foreground "white"))))
     (bold ((t (:bold t :weight bold))))
     (bold-italic ((t (:italic t :bold t :slant italic :weight bold))))
     (border ((t (:background "Gray30"))))
     (clearcase-dired-checkedout-face ((t (:foreground "red"))))
     (comint-highlight-input ((t (:bold t :weight bold))))
     (comint-highlight-prompt ((t (:foreground "cyan"))))
     (cursor ((t (:background "HotPink3"))))
     (fixed-pitch ((t (:family "courier"))))
     (flash-paren-face-off ((t (nil))))
     (flash-paren-face-on ((t (nil))))
     (flash-paren-face-region ((t (:foreground "Gray30"))))
     (font-lock-builtin-face ((t (:foreground "Green"))))
     (font-lock-comment-face ((t (:foreground "Gray30"))))
     (font-lock-constant-face ((t (:foreground "green"))))
     (font-lock-doc-face ((t (:foreground "LightSalmon"))))
     (font-lock-function-name-face ((t (:foreground "Orange" :weight bold))))
     (font-lock-keyword-face ((t (:foreground "Yellow"))))
     (font-lock-string-face ((t (:foreground "SlateBlue"))))
     (font-lock-type-face ((t (:foreground "PaleGreen"))))
     (font-lock-variable-name-face ((t (:foreground "LightGoldenrod"))))
     (font-lock-warning-face ((t (:bold t :foreground "Pink" :weight bold))))
     (highlight ((t (:background "Gray40" ))))
  
       
     (fringe ((t (:background "grey10"))))
     (header-line ((t (:box (:line-width -1 :style released-button) :foreground "grey20" :background "grey90" :box nil))))
     (highlight ((t (:background "Gray30"))))
     (ibuffer-deletion-face ((t (:foreground "red"))))
     (ibuffer-marked-face ((t (:foreground "green"))))
     (isearch ((t (:background "palevioletred2" :foreground "brown4"))))
     (isearch-lazy-highlight-face ((t (:background "paleturquoise4"))))
     (italic ((t (:italic t :slant italic))))
     (menu ((t (nil))))
     (mode-line ((t (:foreground "gray50" :background "white" ))))
     (mouse ((t (:background "white"))))
     (region ((t (:background "DodgerBlue"))))
     (scroll-bar ((t (nil))))
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
     (widget-field-face ((t (:background "White"
                                         :foreground "black"
                             (:box
                              (:line-width 1 :color "lime green" :style solid))))))
     (widget-inactive-face ((t (:foreground "light gray"))))
     
     (idle-highlight ((t ( :inherit nil
                                    (:box
                                     (:line-width 1
                                      :style solid))))))
     (hl-line ((t (:background "Gray10" ))))
     (ido-first-match ((t (:foreground "orange" ))))
     (ido-subdir ((t (:foreground "Green" ))))
    (widget-single-line-field-face ((t (:background "dim gray")))))))
