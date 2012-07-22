(provide 'my-keys)

(defvar my-keys-map (make-sparse-keymap) "my-keys minor-mode keymap.")

(define-key my-keys-map (kbd "<f1>") 'man)

(define-key my-keys-map (kbd "<f5>") 'slime)
(define-key my-keys-map (kbd "<f6>") 'magit-status)
(define-key my-keys-map (kbd "<f7>") 'gnus)

(define-key my-keys-map (kbd "<f9>") 'my-erc-start-or-switch)
(define-key my-keys-map (kbd "<f10>") 'shell)
(define-key my-keys-map (kbd "<f11>") 'my-go-to-scratch)
(define-key my-keys-map (kbd "<f12>") 'my-kill-non-file-buffs)

(define-key my-keys-map (kbd "M-/") 'hippie-expand)
(define-key my-keys-map (kbd "<C-tab>") 'indent-region)


;; usefull for quickly opening links from irc and elsewhere
(define-key my-keys-map (kbd "C-c C-o") 'browse-url-at-point)


;; dired-x keybindings, dired-x on autoload
;; this makes rename/delete buffer & file easier
(define-key my-keys-map (kbd "C-x C-j") 'dired-jump)
(define-key my-keys-map (kbd "C-x 4 C-j") 'dired-jump-other-window)


;; smex bindings
(define-key my-keys-map (kbd "M-x") 'smex)
(define-key my-keys-map (kbd "M-X") 'smex-major-mode-commands)


;; This is the old M-x.
(define-key my-keys-map (kbd "C-c M-x") 'execute-extended-command)


;; same as M-SPC but removes all spacees
(define-key my-keys-map (kbd "M-S-SPC") '(lambda ()
                                           (interactive)
                                           (just-one-space 0)))


;; easier to compile
(define-key my-keys-map (kbd "C-c C") '(lambda ()
                                         (interactive)
                                         (compile "make -k")))

;; comment / uncomment more easily
(define-key my-keys-map (kbd "C-c c") 'comment-or-uncomment-region)
(define-key my-keys-map (kbd "C-c u") 'uncomment-region)


;; easy to enter key-sequences for binding
(define-key my-keys-map (kbd "C-c C-k") 'insert-sequence-key)

(define-minor-mode my-keys-mode
  "A minor mode so that my key settings override annoying major modes."
  t :lighter " MKeys" :keymap my-keys-map)

(my-keys-mode 1)
