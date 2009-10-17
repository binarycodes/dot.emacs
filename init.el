;; set init file for custom settings
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

;; general custom functions
(load-file (expand-file-name "~/.emacs.d/my-lisp/my-defuns.el"))

;; add paths to the load-path
(add-to-load-path-with-subdirs (expand-file-name "~/.emacs.d")
                               '(".." "." ".srecode" "auto-save-list"
                                 "history" "my-backup-files")
                               '("lisp" "my-lisp"))

(add-to-list 'load-path "/usr/share/emacs/site-lisp/cedet/common")

;; load private informations
(require 'my-private-info)

;; load generic emacs settings
(require 'my-general-settings)

;; custom input settings, keybindings
(require 'my-input)

;; cedet settings
(require 'my-cedet)

;; company mode
(autoload 'company-mode "company" nil t)

;; magit settings
(autoload 'magit-status "magit" nil t)

;; erc settings
(autoload 'myerc-start-or-switch "my-erc" "ERC mode." t)

;; slime mode
(autoload 'slime "my-slime" "Slime mode." t)
(autoload 'slime-connect "my-slime" "Slime mode." t)

;; nxhtml settings
(autoload 'nxhtml-mode "nxhtml/autostart.el" "nxhtml mode" t)

;; scheme
(require 'my-scheme)

;; haskell
(require 'my-haskell)

;; parens
(require 'mic-paren)
(paren-activate)


;; python mode settings
(autoload 'python-mode "python-mode.el" "Python mode." t)
(setq auto-mode-alist (append '(("/*.\.py$" . python-mode)) auto-mode-alist))

;; lua mode settings
(setq auto-mode-alist (cons '("\.lua$" . lua-mode) auto-mode-alist))
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;; php mode settings
(autoload 'php-mode "php-mode.el" "Php mode." t)
(setq auto-mode-alist (append '(("/*.\.php[345]?$" . php-mode)) auto-mode-alist))

;; w3m browser
(require 'w3m-load)

;; auctex settings
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(require 'my-flyspell)

;; emacs code browser
(require 'ecb-autoloads)

;; twittering-mode
(require 'my-twitter)

;; paredit mode settings
(require 'my-paredit)
