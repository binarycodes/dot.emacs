(provide 'my-input)

;; key bindings
(global-set-key [f1] 'man)
(global-set-key [f5] 'slime)
(global-set-key [f6] 'slime-selector)
(global-set-key [f9] 'myerc-start-or-switch)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key [(control tab)] 'indent-region)
(global-set-key (kbd "<f12>") 'my-kill-non-file-buffs)
;;(global-set-key (kbd "<f12>") 'whitespace-cleanup)
