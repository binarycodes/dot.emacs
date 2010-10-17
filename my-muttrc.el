(provide 'my-muttrc)

(setq auto-mode-alist
      (append '(("muttrc\\'" . muttrc-mode))
              auto-mode-alist))
