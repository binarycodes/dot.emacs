(provide 'my-autoloads)

;; paredit mode settings
(autoload 'paredit-mode "paredit"
  "Minor mode for pseudo-structurally editing Lisp code." t)

;; quack mode settings for scheme
(autoload 'quack "quack" nil t)

;; twittering-mode settings
(autoload 'twittering-mode "twittering-mode" nil t)

;; haskell mode settings
(autoload 'haskell-mode "haskell-mode"
  "Major mode for editing Haskell scripts." t)
(autoload 'literate-haskell-mode "haskell-mode"
  "Major mode for editing literate Haskell scripts." t)

;; muttrc-mode settings
(autoload 'muttrc-mode "muttrc-mode.el"
  "Major mode to edit muttrc files" t)

;; mingus-mode settings
(autoload 'mingus "mingus" "MPD Controller" t)

;; lua settings
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)

;; python settings
(autoload 'python-mode "python-mode.el" "Python mode." t)

;; php settings
(autoload 'php-mode "php-mode.el" "Php mode." t)

;; cedet settings
(autoload 'cedet "cedet" nil t)

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
