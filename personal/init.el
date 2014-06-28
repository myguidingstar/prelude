
;; Starts server to connect with emacs-client
(server-start)
;; No backup file, please
(setq make-backup-files nil)
;; add personal dir to load path
(add-to-list 'load-path "~/.emacs.d/personal/")
;; Packages I use
(prelude-ensure-module-deps
 '(auto-complete
   git-gutter
   htmlize
   racket-mode
   align-cljlet
   pretty-mode
   ))

(smartparens-global-strict-mode)

(require 'align-cljlet)
(require 'racket-mode)

(require 'auto-complete)
(add-hook 'racket-mode-hook 'auto-complete-mode)

(require 'git-gutter)
(global-git-gutter-mode t)

(require 'htmlize)

(load "modeline.el")
(load "look-and-feel.el")
(load "keyboard.el")


