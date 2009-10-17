(provide 'my-twitter)

(eval-after-load "twittering-mode"
  '(progn
	 (setq twittering-username my-twitter-nick)
	 (twittering-icon-mode) ; Show icons (requires wget)
	 (setq twittering-timer-interval 300) ; Update your timeline each 300 seconds
	 (setq twittering-tmp-dir "~/.emacs.d/history/twitter") ; Directory to store buddy icons
	 ))

(autoload 'twittering-mode "twittering-mode" nil t)
