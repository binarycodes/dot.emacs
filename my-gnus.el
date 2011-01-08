(setq gnus-select-method 
       '(nnmaildir "GMail" 
                   (directory "/home/sujoy/.mail/personal/")
                   (directory-files nnheader-directory-files-safe) 
                   (get-new-mail nil)))

(define-key gnus-group-mode-map (kbd "vo")
  '(lambda ()
	 (interactive)
	 (shell-command "offlineimap -o -u Noninteractive.Basic&" "*offlineimap*" nil)))
