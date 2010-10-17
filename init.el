;; set init file for custom settings
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

;; general custom functions
(load-file (expand-file-name "~/.emacs.d/my-lisp/my-defuns.el"))

;; add paths to the load-path
(add-to-load-path-with-subdirs (expand-file-name "~/.emacs.d")
                               '(".." "." ".srecode" "auto-save-list"
                                 "history" "my-backup-files" "eshell")
                               '("plugins" "my-lisp"))

(add-to-list 'load-path "/usr/share/emacs/site-lisp/cedet/common")

;; custom autoloads for various mode settings
(require 'my-autoloads)

;; load private informations
(require 'my-private-info)

;; load generic emacs settings
(require 'my-general-settings)

;; custom input settings, keybindings
(require 'my-input)

;; cedet settings
(require 'my-cedet)

;; muttrc settings
(require 'my-muttrc)

;; auctex
(require 'my-latex)

;; scheme
(require 'my-scheme)

;; haskell
(require 'my-haskell)

;; w3m browser
(require 'w3m-load)

;; flyspell mode
(require 'my-flyspell)

;; emacs code browser
(require 'ecb-autoloads)

;; twittering-mode
(require 'my-twitter)

;; paredit mode settings
(require 'my-paredit)

;; org-mode settings
(require 'my-org)

;; calendar settings
(require 'my-calendar)
