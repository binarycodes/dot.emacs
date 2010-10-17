(provide 'my-paredit)


(add-hook 'emacs-lisp-mode-hook       (lambda () (paredit-mode +1)))
(add-hook 'lisp-mode-hook             (lambda () (paredit-mode +1)))
(add-hook 'lisp-interaction-mode-hook (lambda () (paredit-mode +1)))

(eval-after-load "paredit"
  '(progn
     (define-key paredit-mode-map (kbd "C-j") 'eval-print-last-sexp)
     (define-key paredit-mode-map (kbd "RET") 'paredit-newline)))


