(provide 'my-shell)

;; shell settings
(setq eshell-directory-name "~/.emacs.d/eshell/"
      explicit-shell-file-name "/bin/zsh")

(eval-after-load "shell"
  '(progn
     (setq comint-scroll-to-bottom-on-input t
           comint-scroll-show-maximum-output t
           comint-scroll-to-bottom-on-output 'all
           comint-input-ignoredups t
           comint-prompt-read-only t)))
