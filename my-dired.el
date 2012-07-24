(provide 'my-dired)

;; C-a is nicer in dired if it moves back to start of files
(defun dired-back-to-start-of-files ()
  (interactive)
  (backward-char (- (current-column) 2)))

(add-hook 'dired-load-hook 'my-dired-init)

(defun my-dired-init ()
  "Bunch of stuff to run for dired, either immediately or when
it's loaded."

  (require 'dired-single)
  (require 'dired-x)                    ;for colorful listing

  (add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))

  ;; key bindings for dired-mode
  (define-key dired-mode-map (kbd "RET") 'dired-single-buffer)
  (define-key dired-mode-map (kbd "<down-mouse-1>") 'dired-single-buffer-mouse)
  (define-key dired-mode-map (kbd "W") 'wdired-change-to-wdired-mode)
  (define-key dired-mode-map (kbd "^") '(lambda () (interactive) (dired-single-buffer "..")))
  (define-key dired-mode-map (kbd "C-a") 'dired-back-to-start-of-files)

  (setq dired-listing-switches "-alh"
        dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|^\\..*$")

  ;; allow recursive directory opertions
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'top))


(eval-after-load "wdired"
  '(progn
     (define-key wdired-mode-map (kbd "C-a") 'dired-back-to-start-of-files)
     (define-key wdired-mode-map (kbd "M-<up>") 'dired-back-to-top)
     (define-key wdired-mode-map (kbd "M-<down>") 'dired-jump-to-bottom)))


(require 'dired+)
