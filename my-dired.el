(provide 'my-dired)

(add-hook 'dired-load-hook 'my-dired-init)

(defun my-dired-init ()
  "Bunch of stuff to run for dired, either immediately or when
it's loaded."
  (require 'dired-single)
  (require 'dired-x)

  (define-key dired-mode-map [return] 'dired-single-buffer)
  (define-key dired-mode-map [down-mouse-1] 'dired-single-buffer-mouse)
  (define-key dired-mode-map "W" 'wdired-change-to-wdired-mode)
  (define-key dired-mode-map "^"
    (function
     (lambda nil (interactive) (dired-single-buffer ".."))))
  (setq dired-listing-switches "-alh"))
