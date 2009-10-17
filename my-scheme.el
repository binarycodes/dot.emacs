(provide 'my-scheme)

(setq scheme-program-name "mzscheme")

(autoload 'quack "quack" nil t)

(setq quack-fontify-style 'emacs
      quack-default-program "mzscheme"
      quack-newline-behavior 'newline)
