(provide 'my-paredit)


(dolist (hook '(emacs-lisp-mode-hook
                lisp-mode-hook
                lisp-interaction-mode-hook
                scheme-mode-hook))
  (add-hook hook '(lambda () (paredit-mode 1))))


(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map (kbd "C-j") 'eval-print-last-sexp)
     (define-key paredit-mode-map (kbd "RET") 'paredit-newline)))
