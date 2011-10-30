(add-to-list 'load-path "~/.emacs.d/vendor/el-get")

(unless (require 'el-get nil t)
  (url-retrieve
   "https://github.com/dimitri/el-get/raw/master/el-get-install.el"
   (lambda (s)
     (end-of-buffer)
     (eval-print-last-sexp))))



(setq my-packages
      (append
       '(ac-dabbrev
         ac-slime                    ;; Emacs auto-complete plugin for Slime symbols
         ace-jump-mode               ;; a quick cursor location minor mode for emacs
         ack                         ;; Use ack where you might usually use grep.
         anything                    ;; Open anything / QuickSilver-like candidate-selection framework
         apache-mode                 ;; Major mode for editing Apache configuration files
         auto-complete-clang         ;; Auto-complete sources for Clang. Combine the power of AC, Clang and Yasnippet.
         auto-complete-css           ;; Auto-complete sources for CSS
         auto-complete-emacs-lisp    ;; Auto-complete sources for emacs lisp
         auto-complete-ruby          ;; Auto-complete sources for Ruby
         auto-complete-yasnippet     ;; Auto-complete sources for YASnippet
         auto-complete               ;; The most intelligent auto-completion extension.
         auto-install                ;; Auto install elisp file
         buffer-move                 ;; Swap buffers without typing C-x b on each window
         cheat                       ;; Provide a handy interface to cheat
         clang-completion-mode       ;; Clang Code-Completion minor mode, for use with C/Objective-C/C++
         clevercss                   ;; This is a Emacs major mode for editing CleverCSS files. It provides smart indentation, syntax highlighting and basic text manipulation commands.
         clojure-mode                ;; Emacs support for the Clojure language.
         cmake-mode                  ;; Provides syntax highlighting and indentation for CMakeLists.txt and *.cmake source files.
         coffee-mode                 ;; Emacs Major Mode for CoffeeScript
                 cssh                        ;; ClusterSSH meets Emacs 
         csv-mode                    ;; CsvMode, csv-mode, is a package by FrancisJWright for editing comma separated value files (.csv).
         csv-nav                     ;; Navigate and edit CSV files
         csv                         ;; Functions for reading and parsing CSV (Comma Separated Value) files.
         db-sql                      ;; Connect to SQL server using tramp syntax
         dired-details               ;; Make file details hide-able in dired
         dired-plus                  ;; Extensions to Dired
         dired-single                ;; Reuse the current dired buffer to visit another directory
         dired-sync                  ;; Sync directories within dired
         dired-toggle-sudo           ;; Browse directory with sudo privileges.
         dired-view                  ;; Dired view mode
         dirtree                     ;; Functions for building directory-tree lists
         doxymacs                    ;; Doxymacs is Doxygen + {X}Emacs.
         el-get                      ;; Manage the external elisp bits and pieces you depend upon.
         elein                       ;; Running leiningen commands from emacs
         emacs-goodies-el            ;; Miscellaneous add-ons for Emacs
         eredis                      ;; A simple emacs interface to redis
         
         flymake-ruby                ;; Steve Purcell's Ruby Flymake support, with stricter warnings.
         gist                        ;; Emacs integration for gist.github.com
         git-auto-commit             ;; Git auto commit directory within emacs.
         git-blame                   ;; Minor mode for incremental blame for Git
         git-commit-mode             ;; Major mode for editing git commit messages
         git-emacs                   ;; Yet another git emacs mode for newbies
         git-modeline                ;; Mode line decoration support, part of git-emacs.
         go-mode                     ;; Major mode for the Go programming language
         google-maps                 ;; Access Google Maps from Emacs
         goto-last-change            ;; Move point through buffer-undo-list positions
         grep+                       ;; Extensions to standard library `grep.el'.
         el-get                      ;; 
         haml-mode                   ;; Major mode for editing Haml files
         ido-hacks                   ;; Advices for ido-mode.
         js-comint                   ;; Run javascript in an inferior process window.
         js2-mode                    ;; An improved JavaScript editing mode
         json                        ;; JavaScript Object Notation parser / generator
         lisppaste                   ;; Interact with the lisppaste pastebot via XML-RPC.
         list-processes+             ;; A enhance list processes command
         lively                      ;; Interactively updating text
         lua-mode                    ;; A major-mode for editing Lua scripts
         magithub                    ;; Magit extensions for using GitHub
         markdown-mode               ;; Major mode to edit Markdown files in Emacs
         moz-repl                    ;; Lets current buffer interact with inferior mozilla.
         nognus                      ;; A newsreader for GNU Emacs
         nterm                       ;; New TERMinal emulator
         nxhtml                      ;; An addon for Emacs mainly for web development.
         oauth                       ;; Oauth library.
         openwith                    ;; Open files with external programs
         org-buffers                 ;; An Org-mode tool for buffer management
         org-fstree                  ;; Emacs orgmode extension for generating filesystem tree representations with annotations.
         org-html5presentation       ;; html5 presentation from org files
         org-mode                    ;; Org-mode is for keeping notes, maintaining ToDo lists, doing project planning, and authoring with a fast and effective plain-text system.
         org-website                 ;; Generate multi-level website from org
         org2blog                    ;; Blog from Org mode to wordpress
         pastebin                    ;; An Emacs interface to pastebin.com.
         pg                          ;; Emacs Lisp interface to the PostgreSQL RDBMS
         php-mode-improved           ;; Major mode for editing PHP code. This is a version of the php-mode from http://php-mode.sourceforge.net that fixes a few bugs which make using php-mode much more palatable
         php-mode                    ;; Major mode for editing PHP code
         planner                     ;; Planner is an organizer and day planner for Emacs. It helps you keep track of your pending and completed tasks, daily schedule, dates to remember, notes and inspirations.
         predictive                  ;; The Emacs Predictive Completion package adds a new minor-mode to the GNU Emacs editor.
         profile-dotemacs            ;; profiles your .emacs
         puppet-mode                 ;; A simple mode for editing puppet manifests
     
         python                      ;; Python's flying circus support for Emacs
         rails-el                    ;; It is minor mode for editing Ruby On Rails code with Emacs
         rainbow-delimiters          ;; Color nested parentheses, brackets, and braces according to their depth.
         rainbow-mode                ;; Displays color names with colored background.
         rdebug                      ;; Ruby debugger user interface, startup file.
         remember                    ;; Remember is an Emacs mode for quickly remembering data.
         ri-emacs                    ;; Ruby ri help inside emacs
         rinari                      ;; Rinari Is Not A Rails IDE
         ruby-block                  ;; Highlight matching block
         ruby-electric               ;; Electric commands editing for ruby files
         ruby-end                    ;; Emacs minor mode for automatic insertion of end blocks for Ruby
         ruby-mode                   ;; Major mode for editing Ruby files. RubyMode provides font-locking, indentation support, and navigation for Ruby code.
     
         sass-mode                   ;; Major mode for editing Sass files
   
         scala-mode                  ;; Major mode for editing Scala code.
         scheme-complete             ;; Context-sensitive completion for Scheme code.
         scratch                     ;; Mode-specific scratch buffers
         scss-mode                   ;; Major mode for editing SCSS files(http://sass-lang.com)
         sicp                        ;; The second edition of the book Structure and Interpretation of Computer Programs (SICP) in info format
         smex                        ;; M-x interface with Ido-style fuzzy matching.
         smooth-scroll               ;; Minor mode for smooth scrolling.
         smooth-scrolling            ;; Make emacs scroll smoothly, keeping the point away from the top and bottom of the current buffer's window in order to keep lines of context around the point visible as much as possible, whilst avoiding sudden scroll jumps which are visually confusing.
         ssh-config                  ;; Manage both ssh and dsh confguration from emacs
         sunrise-commander           ;; Two-pane file manager for Emacs based on Dired and inspired by MC
         switch-window               ;; A *visual* way to choose a window to switch to
         twitter                     ;; Simple Emacs-based client for Twitter
         vkill                       ;; View and kill Unix processes from within Emacs
         wrap-region                 ;; Wrap text with punctation or tag
         xcscope+                    ;; Providing an extension to xcscope.
         xcscope                     ;; Cscope interface for (X)Emacs
    
         yaml-mode                   ;; Simple major mode to edit YAML file for emacs
         yari                        ;; Yet Another RI interface for Emacs
         yasnippet)))


(el-get 'sync my-packages)

(setq el-get-sources
      '((:name magit
	       :after (lambda () (global-set-key (kbd "C-x C-z") 'magit-status)))))

(setq my-packages
      (append
       '(cssh el-get switch-window vkill google-maps nxhtml xcscope yasnippet)
       (mapcar 'el-get-source-name el-get-sources)))




(mapc
  'el-get-init-and-install
 my-packages)

(mapc
 (lambda (p)
   (require (quote p) nil t))
 my-packages)


(paredit-mode 1)

(provide 'starter-kit-el-get)
