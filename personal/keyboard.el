(global-set-key (kbd "<f2>") 'save-buffer)

;; C-( to start, C-) to finish defining keyboard macro
;; C-e to execute the last one
;; to save to next sessions:
;; M-x insert-kbd-macro
(global-set-key (kbd "<f3>") 'name-last-kbd-macro)

(global-set-key (kbd "<f5>") 'revert-buffer)
(global-set-key (kbd "<f7>") 'undo-tree-visualize)

(global-set-key "\M-Q" 'align-cljlet)

