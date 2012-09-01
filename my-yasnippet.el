(provide 'my-yasnippet)

(require 'yasnippet)
(yas/initialize)

(setq yas/root-directory '("~/.emacs.d/my-snippets"))
(setq yas/snippet-dirs yas/root-directory)

(mapc 'yas/load-directory yas/root-directory)
(yas/global-mode)
