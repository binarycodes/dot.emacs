(provide 'my-input)

;; key bindings
(global-set-key [f1] 'man)
(global-set-key [f5] 'slime)
(global-set-key [f6] 'magit-status)
(global-set-key [f7] 'gnus)
(global-set-key [f9] 'myerc-start-or-switch)
(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key [(control tab)] 'indent-region)
(global-set-key [f12] 'my-kill-non-file-buffs)

;; userfull for quickly opening links from irc and elsewhere
(global-set-key (kbd "C-c C-o") 'org-open-at-point-global)

