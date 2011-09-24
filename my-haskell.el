(provide 'my-haskell)

(require 'inf-haskell)

(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hi$"     . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode)))
	  haskell-program-name "ghci")

(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
