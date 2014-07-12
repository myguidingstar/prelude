
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
   clj-refactor
   clojure-snippets
   ))

;; (smartparens-global-strict-mode)
(require 'clojure-mode-extra-font-locking)
(add-hook 'clojure-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-mode)

(setq whitespace-action '(auto-cleanup))
(global-whitespace-mode)

(require 'align-cljlet)
(require 'racket-mode)
(require 'clj-refactor)
(require 'auto-complete)
(add-hook 'racket-mode-hook 'auto-complete-mode)

(require 'git-gutter)
(global-git-gutter-mode t)

(require 'htmlize)

(load "modeline.el")
(load "look-and-feel.el")
(load "keyboard.el")

(eval-after-load "dash" '(dash-enable-font-lock))
(require 'dash)

(add-hook 'clojure-mode-hook
          (lambda ()
            (clj-refactor-mode 1)
            ;; setup keybindings
            (cljr-add-keybindings-with-prefix "C-c C-f")))

