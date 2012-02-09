(provide 'my-general-settings)

;; change to my home
(cd "~")

;; easy to restore window configurations
(winner-mode 1)

;; easy switching between windows
(windmove-default-keybindings)

;; echo keystrokes instantly
(setq echo-keystrokes 0.01)

;; clean startup
(setq inhibit-startup-echo-area-message t
      inhibit-startup-message t)

;; stop freezing frames
(defun iconify-or-deiconify-frame nil)

;; disable fringes at startup
(fringe-mode 0)

;; gnus config file
(setq gnus-init-file "~/.emacs.d/my-gnus.el")

;; save history from previous sessions
(setq savehist-file "~/.emacs.d/history/savehist")
(savehist-mode 1)

;; disable fancy gui stuffs, menu et. all
(set-scroll-bar-mode nil)
(tool-bar-mode -1)
(menu-bar-mode -1)
(mouse-avoidance-mode 'banish)

;; turn on font lock globally
(if (fboundp 'global-font-lock-mode)
    (global-font-lock-mode 1)                    ; GNU Emacs
  (setq font-lock-auto-fontify t))               ; XEmacs

;; use hippie-expand instead of dabbrev
(setq hippie-expand-try-functions-list
      '(try-complete-file-name-partially
        try-complete-file-name
        try-expand-dabbrev
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; tramp settings
(setq tramp-default-method "ssh")

;; general editor settings
(setq column-number-mode t
      default-tab-width 4)

;; backup file settings
(setq backup-by-copying t
      backup-directory-alist
      '(("." . "~/.emacs.d/my-backup-files"))
      delete-old-versions t
      kept-new-versions 4
      kept-old-versions 2
      version-control t)                         ; use versioned backups

;; enabled settings that were disabled by default
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; disable overwrite-mode, it just gets in the way
(put 'overwrite-mode 'disabled t)

;; dont prompt for disabled stuffs, just beep or something
(setq disabled-command-hook '(lambda ()
                               (beep)
                               (message "Command is disabled!")))

;; Confirm before killing Emacs. If the result of the function
;; call is non-nil, the session is killed, otherwise Emacs continues
;; to run.
(setq confirm-kill-emacs
      (lambda (e)
        (y-or-n-p-with-timeout
         "Really exit Emacs? " 3 nil)))

;; auto revert to on disk changes
(global-auto-revert-mode t)

;; require new line at the end
(setq require-final-newline t)

;; this makes editing camelCase words a lot easier
(subword-mode)

;; use the string regex syntax, the default needs too many backslashes
(eval-after-load "re-builder"
  (setq reb-re-syntax 'string))

;; disable bold fonts
(mapc
 (lambda (face)
   (set-face-attribute face nil :weight 'normal))
 (face-list))

;; change term's blue to something more pleasant.
;; http://tapoueh.org/blog/2011/07/29-emacs-ansi-colors.html
(require 'ansi-color)
(setq ansi-color-names-vector
      (vector (frame-parameter nil 'background-color)
              "#f57900" "#8ae234" "#edd400" "#729fcf"
              "#ad7fa8" "cyan3" "#eeeeec")
      ansi-term-color-vector ansi-color-names-vector
      ansi-color-map (ansi-color-make-color-map))


;; set frame title to reflect buffer/filename and status of buffer
(setq frame-title-format
      '("emacs%@" (:eval (system-name))
        ": " (:eval (if (buffer-file-name)
                        (abbreviate-file-name (buffer-file-name))
                      "%b")) " [%*]"))


;; uniquify mode settings. Makes distinguishing buffers with same
;; filenames a lot easier
(setq uniquify-buffer-name-style 'forward)

;; setting default major-mode to org-mode
(setq default-major-mode 'org-mode)


;; this allows to run minibuffer commands while in the minibuffer
(setq enable-recursive-minibuffers t)

;; sets up the whois server to be used for whois querries
(setq whois-server-name "whois-servers.net")
