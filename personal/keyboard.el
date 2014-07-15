(global-set-key (kbd "<f2>") 'save-buffer)

;; C-( to start, C-) to finish defining keyboard macro
;; C-e to execute the last one
;; to save to next sessions:
;; M-x insert-kbd-macro
(global-set-key (kbd "<f3>") 'name-last-kbd-macro)

(global-set-key (kbd "S-<f5>") 'revert-buffer)
(global-set-key (kbd "<f5>")
                '(lambda () (interactive) (org-edit-src-code) (enlarge-window 15)))
(global-set-key (kbd "<f6>")
                '(lambda ()
                   (interactive) (org-edit-src-exit)
                   (org-babel-tangle) (enlarge-window 15)))
(global-set-key (kbd "S-<f6>") 'org-export-as-html)
(global-set-key (kbd "<f7>") 'undo-tree-visualize)
(global-set-key (kbd "<f8>") 'magit-status)
(global-set-key (kbd "<f10>") '(lambda () (interactive) (enlarge-window 15)))
(global-set-key "\M-Q" 'align-cljlet)
