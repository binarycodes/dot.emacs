(provide 'my-scheme)

(add-hook 'scheme-mode-hook '(lambda ()
                               (setq scheme-program-name "mzscheme")))

(eval-after-load "quack"
  '(progn
     (setq quack-fontify-style 'emacs
           quack-default-program "mzscheme"
           quack-newline-behavior 'newline)))
