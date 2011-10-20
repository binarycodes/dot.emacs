(provide 'my-haskell)

(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hi$"     . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode)))
	  haskell-program-name "ghci")

(add-hook 'haskell-mode-hook '(lambda ()
								(turn-on-haskell-indent t)
								(require 'inf-haskell)))
