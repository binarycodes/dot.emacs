(provide 'my-org)

(setq org-hide-leading-stars t
      org-log-done 'time
      org-startup-folded 'content
      org-hide-block-startup t
	  org-odd-levels-only t)

(eval-after-load "org"
  '(progn
     (define-key org-mode-map (kbd "C-c a") 'org-agenda)
     (define-key org-mode-map (kbd "C-c b") 'org-iswitchb)
     (define-key org-mode-map (kbd "C-c l") 'org-store-link)))