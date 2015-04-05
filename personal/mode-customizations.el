(require 'clojure-mode)
(require 'clj-refactor)
(require 'clojure-mode-extra-font-locking)

(add-hook 'clojure-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-mode)
(add-hook 'clojure-mode-hook 'auto-complete-mode)
(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
;; (add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)

(--map (put-clojure-indent it 'defun)
       '(init-state render-state render will-mount did-mount
                    will-update did-update display-name
                    will-unmount
                    should-update will-receive-props
                    div i img a p select option
                    table thead tbody tr th td
                    form input button))

(add-hook 'cider-mode-hook #'eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-tab-command #'indent-for-tab-command)

(add-hook 'clojure-mode-hook
          (lambda ()
            (clj-refactor-mode 1)
            ;; setup keybindings
            (cljr-add-keybindings-with-prefix "C-c C-f")))

(require 'racket-mode)
(add-to-list 'auto-mode-alist '("\\.rkt\\'" . racket-mode))
(add-hook 'racket-mode-hook 'paredit-mode)
(add-hook 'racket-mode-hook 'rainbow-mode)
(add-hook 'racket-mode-hook 'auto-complete-mode)