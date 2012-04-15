(provide 'my-haskell)

(setq auto-mode-alist
      (append auto-mode-alist
              '(("\\.[hg]s$"  . haskell-mode)
                ("\\.hi$"     . haskell-mode)
                ("\\.l[hg]s$" . literate-haskell-mode)))
      haskell-program-name "ghci")

(eval-after-load "haskell"
  '(progn
     (turn-on-haskell-indent)
     (require 'inf-haskell)))
