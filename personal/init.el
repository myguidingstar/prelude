(load-theme prelude-theme t)
;; Starts server to connect with emacs-client
(server-start)
;; No backup file, please
(setq make-backup-files nil)
;; add personal dir to load path
(add-to-list 'load-path "~/.emacs.d/personal/")
;; Packages I use
(prelude-require-packages
 '(auto-complete
   git-gutter
   htmlize
   geiser
   racket-mode
   align-cljlet
   pretty-mode
   clj-refactor
   clojure-snippets
   sublime-themes
   clojure-mode-extra-font-locking
   browse-at-remote
   inf-clojure
   ob-browser
   google-translate
   ob-translate
   j-mode))

;; load a theme from sublime-themes
;; https://github.com/owainlewis/emacs-color-themes
;; (load-theme 'spolsky t)
;; (load-theme 'granger t)
(enable-theme 'zenburn)
(setq prelude-theme 'solarized-dark)
;; (smartparens-global-strict-mode)
(setq whitespace-action '(auto-cleanup))
(global-whitespace-mode)

(require 'align-cljlet)

(require 'auto-complete)

(require 'git-gutter)
(global-git-gutter-mode t)

(require 'htmlize)

(load "modeline.el")
(load "look-and-feel.el")
(load "keyboard.el")
(load "mode-customizations.el")

(eval-after-load "dash" '(dash-enable-font-lock))
(require 'dash)
