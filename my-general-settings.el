(provide 'my-general-settings)

;; coding system settings
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; Treat clipboard input as UTF-8 string first; compound text next, etc.
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; change to my home on startup
(setq default-directory (expand-file-name "~/"))

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
(when (fboundp 'global-font-lock-mode)
    (global-font-lock-mode 1))   ; GNU Emacs

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
(setq password-cache-expiry 'nil)

;; general editor settings
(column-number-mode 't)
(setq-default tab-width 4
              tab-stop-list (number-sequence 4 120 4))

;; backup file settings
(setq backup-by-copying t
      backup-directory-alist
      '(("." . "~/.emacs.d/my-backup-files"))
      delete-old-versions t
      kept-new-versions 4
      kept-old-versions 2
      version-control t)                ; use versioned backups

;; enabled settings that were disabled by default
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'set-goal-column 'disabled nil)

;; disable overwrite-mode, it just gets in the way
(put 'overwrite-mode 'disabled t)

;; dont prompt for disabled stuffs, just beep or something
(setq disabled-command-function '(lambda ()
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

;; this allows to run minibuffer commands while in the minibuffer
(setq enable-recursive-minibuffers t)
(minibuffer-depth-indicate-mode t)

;; sets up the whois server to be used for whois querries
(setq whois-server-name "whois-servers.net")

;; From https://github.com/magnars/.emacs.d
;; Various superfluous white-space. Just say no.
(add-hook 'before-save-hook 'cleanup-buffer-safe)

;; select from other windows places contents in the kill ring
(setq x-select-enable-primary t)

;; elpa servers
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))


;; stop asking for verison controlled links please
(setq vc-follow-symlinks 't)


;; ping setup
(setq ping-program-options '("-c" "4"))
