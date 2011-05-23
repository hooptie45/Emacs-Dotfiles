;; ;; Part of the Emacs Starter Kit
;; ;;
;; ;; This is the first thing to get loaded.
;; ;;
;; ;; "Emacs outshines all other editing software in approximately the
;; ;; same way that the noonday sun does the stars. It is not just bigger
;; ;; and brighter; it simply makes everything else vanish."
;; ;; -Neal Stephenson, "In the Beginning was the Command Line"

;; ;; Turn off mouse interface early in startup to avoid momentary display
;; ;; You really don't need these; trust me.

(setq mac-option-modifier 'hyper)
(setq mac-command-modifier 'meta)
(setq mac-function-modifier 'super)
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/") 
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(setq ring-bell-function 'ignore)
(setq visual-bell nil)
(setq visible-bell nil)
(setq ring-bell-function 'ignore)
(setq visual-bell nil)
(setq visible-bell nil)

(find-file "~/.emacs.d/init.el")


;; (defconst package-archive-base "http://tromey.com/elpa/"
;;   "Base URL for the package archive.
;; Ordinarily you should not need to edit this.
;; The default points to ELPA, the Emacs Lisp Package Archive.
;; Note that some code in package.el assumes that this is an http: URL.")
;; 

 (setq dotfiles-dir "~/.emacs.d/")

(add-to-list 'load-path "~/.emacs.d")
;; (add-to-list 'load-path "~/.emacs.d/predictive")
;; (add-to-list 'load-path "~/.emacs.d/auto-complete")

;; (add-to-list 'load-path "~/.emacs.d/company")
;; (add-to-list 'load-path "~/.emacs.d/elpa/emms-3.0")
(add-to-list 'load-path "~/elisp/")
(normal-top-level-add-subdirs-to-load-path)
(require 'color-theme)

(scroll-bar-mode -1)
(load "color-theme-nanarpuss.el")
(color-theme-nanarpuss)

 (require 'emms-setup)
;; (require 'emms-setup)
 (require 'emms-streams)


(add-to-list 'emms-player-list 'emms-player-mpd)
(require 'emms-player-simple)
(require 'emms-source-file)
(require 'emms-source-playlist)
(setq emms-player-list '(emms-player-mpg321
                         emms-player-ogg123
                         emms-player-mplayer))
;; (setq emms-info-asynchronously nil)
(setq emms-playlist-buffer-name "*Music*")

(emms-all)
(emms-default-players)
(setq emms-playing-time 1)

(require 'paredit)
(require 'color-theme)


(require 'find-func-extension)
(require 'find-func+)
(require 'align (concat dotfiles-dir "align.el"))
(require 'anything-config)
(global-set-key (kbd "M-x") 'execute-extended-command)
(require 'cl)
(require 'saveplace)

(require 'ffap)
(require 'uniquify)
(require 'paredit)
(require 'inf-ruby)
(require 'starter-kit-defuns)
(require 'starter-kit-misc)
(require 'anything)
(require 'anything-config)
(require 'lazy-set-key)
(require 'dired-details)
(require 'starter-kit-yasnippet)
(require 'starter-kit-real-auto-save)
(require 'starter-kit-registers)
(require 'starter-kit-eshell)
(require 'starter-kit-lisp)
(require 'starter-kit-js)
(require 'starter-kit-bindings)

(server-start)
(menu-bar-mode)
;;(anything-read-string-mode -1)



(require 'magit)
(require 'starter-kit-bindings)
(require 'ido)
(ido-mode 1)
(ido-everywhere 1)



;; (require 'imenu)
;; (require 'ansi-color)
;; (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;; (setq comint-prompt-read-only t)

;; (setq backup-directory-alist
;;       '((".*" . "~/.emacs.d/.emacs-backups")))

;; (setq version-control t)

;; (setq kept-new-versions 1000)
;; (setq kept-old-versions 1000)
;; (setq backup-by-copying t)
;; (setf my-ignore-dirs  (list "loaddefs.el " "Trash" "vendor" ".git" "SVN" ".svn" "save" "swank" "slime" "elpa" "snippets" "backups"
;;                              "emacs-backup" "trash" "emacs-ide" "emacs-nav" "~" "#" "auto-save-list" "elc" "places"
;;                              "elpa-to-submit/jabber/jabber.info" "thumbs" "oddmuse" ".newsrc-dribble" ".nnmail-cache"
;;                              "#.newsrc-dribble#" ".svn" ".DS_Store" "image-dired" "elim" "session" "tramp" "history"
;;                              "anything-c-adaptive-history" "trash" "yasnippet" "/js.js" "ido/.ido.last" "frequencies"))
;; (add-hook 'before-save-hook 
;;           '(lambda ()
;;              (setq buffer-backed-up nil)))


;; (setf findr-skip-directory-regexp (regexp-opt my-ignore-dirs))
;; (setf grep-find-ignored-directories (regexp-opt my-ignore-dirs))
;; (setf slime-close-all-parens-in-sexp)
;; (setf vc-ignore-vc-files)
;; (setf ido-ignore-directories-merge)
;; (setf ido-ignore-buffers)
;; (setf iswitchb-buffer-ignore)


;; (setf grep-find-ignored-directories (regexp-opt my-ignore-dirs))
;; (setf hippie-expand-verbose nil)
;; (buffer-enable-undo)
;; (setf another-line-p t)






(setq-default find-function-C-source-directory "/opt/local/var/macports/distfiles/emacs-app/emacs-23.3/src")

;; (global-company-mode)

;; ;;; Supernews
;; ;; agile.infusion@gmail.com
;; ;; tr4cc10u
;; ;;
;; ;;; Gmail (hooptie45)
;; ;; i5H9tDgc880s
;; ;; hooptie45@gmail.com
;; ;;; Dreamhost-API (Shaun-Hannah.com)
;; ;; 5B7N4FJN9VCSPWHU
;; ;; https://api.dreamhost.com/
;; ;;   -> key 5B7N4FJN9VCSPWHU
;; ;;   -> cmd 
;; ;;   -> unique_id
;; (require 'emms)
