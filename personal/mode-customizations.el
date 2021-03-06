(require 'clojure-mode)
(require 'clj-refactor)
(require 'clojure-mode-extra-font-locking)

(add-hook 'clojure-mode-hook 'subword-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'rainbow-mode)
(add-hook 'clojure-mode-hook 'auto-complete-mode)
(add-to-list 'auto-mode-alist '("\\.boot\\'" . clojure-mode))
;; (add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)

;; INDENT
;; clojure core
(--map (put-clojure-indent it 'defun)
       '(-> ->>))

;; om's dom elements
(--map (put-clojure-indent it 'defun)
       '(init-state
         render-state render will-mount did-mount
         will-update did-update display-name
         will-unmount should-update will-receive-props
         div i img a p select option
         table thead tbody tr th td
         form input button))

;; garden-css
(--map (put-clojure-indent it 'defun)
       '(at-media))

;; midje
(--map (put-clojure-indent it 'defun)
       '(facts fact))

(add-hook 'cider-mode-hook #'eldoc-mode)
(setq nrepl-hide-special-buffers t)
(setq cider-repl-tab-command #'indent-for-tab-command)
(setq cider-auto-select-error-buffer nil)
(setq cider-prompt-save-file-on-load nil)

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

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(require 'j-mode)
(add-to-list 'auto-mode-alist '("\\.ij[rstp]$" . j-mode))
(custom-set-faces
 '(j-verb-face ((t (:foreground "Red"))))
 '(j-adverb-face ((t (:foreground "Green"))))
 '(j-conjunction-face ((t (:foreground "Blue"))))
 '(j-other-face ((t (:foreground "Black")))))

(require 'org)
(require 'ob-clojure)
(require 'cider)
(setq org-babel-clojure-backend 'cider)

(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (sh . t)
   (python . t)
   (R . t)
   (ruby . t)
   (ditaa . t)
   (dot . t)
   (octave . t)
   (sqlite . t)
   (perl . t)
   (clojure . t)
   (scheme . t)
   ))

(setq org-confirm-babel-evaluate nil)
(require 'ob-screen)
(defvar org-babel-default-header-args:screen
  '((:results . "silent") (:session . "default") (:cmd . "sh") (:terminal . "xterm"))
  "Default arguments to use when running screen source blocks.")

;; Show syntax highlighting per language native mode in *.org
(setq org-src-fontify-natively t)

;; MakingScriptsExecutableOnSave
(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
