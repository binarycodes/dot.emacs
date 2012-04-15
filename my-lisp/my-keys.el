(provide 'my-keys)

(defvar my-keys-map (make-sparse-keymap) "my-keys minor-mode keymap.")

(define-key my-keys-map [f1] 'man)
(define-key my-keys-map [f5] 'slime)
(define-key my-keys-map [f6] 'magit-status)
(define-key my-keys-map [f7] 'gnus)
(define-key my-keys-map [f9] 'my-erc-start-or-switch)
(define-key my-keys-map [f10] 'shell)
(define-key my-keys-map [f11] 'my-go-to-scratch)
(define-key my-keys-map [f12] 'my-kill-non-file-buffs)

(define-key my-keys-map (kbd "M-/") 'hippie-expand)
(define-key my-keys-map [(control tab)] 'indent-region)


;; usefull for quickly opening links from irc and elsewhere
(define-key my-keys-map (kbd "C-c C-o") 'browse-url-at-point)

;; dired-x keybindings, dired-x on autoload
;; this makes rename/delete buffer & file easier
(define-key my-keys-map "\C-x\C-j" 'dired-jump)
(define-key my-keys-map "\C-x4\C-j" 'dired-jump-other-window)


;; smex bindings
(define-key my-keys-map (kbd "M-x") 'smex)
(define-key my-keys-map (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(define-key my-keys-map (kbd "C-c M-x") 'execute-extended-command)

;; same as M-SPC but removes all spacees
(define-key my-keys-map (kbd "M-S-SPC") '(lambda ()
										   (interactive)
										   (just-one-space 0)))

;; easier to compile
(define-key my-keys-map (kbd "C-c c") '(lambda ()
										 (interactive)
										 (compile "make -k")))


(define-minor-mode my-keys-mode
  "A minor mode so that my key settings override annoying major modes."
  t :lighter " MKeys" :keymap my-keys-map)

(my-keys-mode 1)
