(provide 'my-erc)

(require 'my-private-info "my-private-info.el.gpg")
(require 'erc)
(require 'tls)

(setq tls-program '("openssl s_client -connect %h:%p -no_ssl2
-ign_eof -CAfile /home/sujoy/.private/GandiStandardSSLCA.crt
-cert /home/sujoy/.private/nick.pem"
                    "gnutls-cli --priority secure256 --x509cafile
/home/sujoy/.private/GandiStandardSSLCA.crt --x509certfile
/home/sujoy/.private/nick.pem -p %p %h"
                    "gnutls-cli --priority secure256 -p %p %h"))

(add-hook 'erc-mode-hook
          '(lambda ()
             (require 'erc-pcomplete)
             (pcomplete-erc-setup)))


(eval-after-load "my-erc"
  '(progn

     ;; Loading all requried MODES
     (require 'erc-join)
     (require 'erc-netsplit)
     (require 'erc-fill)
     (require 'erc-ring)

     (erc-track-mode t)
     (erc-completion-mode 1)
     (erc-autojoin-mode 1)
     (erc-button-mode -1)
     (erc-spelling-mode 1)
     (erc-readonly-mode 1)
     (erc-fill-mode 1)
     (erc-timestamp-mode t)
     (erc-ring-mode t)
     (erc-scrolltobottom-mode 1)
     (erc-move-to-prompt-mode 1)
     (erc-netsplit-mode t)

     ;; Custom Settings
     (setq erc-kill-buffer-on-part t
           erc-nick (list my-erc-fn-nick my-erc-fn-nick2)
           erc-kill-queries-on-quit t
           erc-kill-server-buffer-on-quit t
           erc-timestamp-right-align-by-pixel t
           erc-auto-query 'window
           erc-prompt ">>> "
           erc-hide-list '("JOIN" "PART" "QUIT" "NICK" "MODE" "LIST" "353")
           erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                     "324" "329" "332" "333" "353" "477" "357")
           erc-autojoin-channels-alist
           '(("freenode.net" "#archlinux" "#emacs" "#vim" "#xmonad"))
           erc-server-reconnect-timeout 30)

     (define-key erc-mode-map "\C-ci" 'my-erc-ghost-change-nick)))


;; Number of OPPED/VOICED/NORMAL members of the current channel in
;; the modeline
(defun erc-cmd-HOWMANY (&rest ignore)
  "Display how many users (and ops) the current channel has."
  (erc-display-message nil 'notice (current-buffer)
                       (let ((ops 0)
                             (voices 0)
                             (members 0))
                         (maphash (lambda (key value)
                                    (when (erc-channel-user-op-p key)
                                      (setq ops (1+ ops)))
                                    (when (erc-channel-user-voice-p key)
                                      (setq voices (1+ voices)))
                                    (setq members (1+ members)))
                                  erc-channel-users)
                         (format "ops :: %S / voices :: %S / members :: %S" ops voices members))))


;;Change header line face if DISCONNECTED
(defface erc-header-line-disconnected
  '((t (:foreground "black" :background "indianred")))
  "Face to use when ERC has been disconnected.")

(defun erc-update-header-line-show-disconnected ()
  "Use a different face in the header-line when disconnected."
  (erc-with-server-buffer
    (cond ((erc-server-process-alive) 'erc-header-line)
          (t 'erc-header-line-disconnected))))

(setq erc-header-line-face-method 'erc-update-header-line-show-disconnected)


(defun my-erc-start-or-switch ()
  "Switch to ERC buffer using IDO to choose which one, or start
ERC if not already started."
  (interactive)
  (let (final-list (list ))
    (dolist (buf (buffer-list) final-list)
      (if (equal 'erc-mode (with-current-buffer buf major-mode))
          (setq final-list (append (list (buffer-name buf)) final-list))))
    (if final-list
        (switch-to-buffer (ido-completing-read "Buffer: " (sort final-list 'string<)))
      (erc-tls :server "irc.freenode.net"
               :port 7000
               :nick my-erc-fn-nick
               :password my-erc-fn-pass
               :full-name my-erc-fn-name))))

;; ERC nick colors section.
;; Pool of colors to use when coloring IRC nicks.
(setq erc-colors-list '("blue" "green" "yellow"
                        "gray" "brown" "red"
                        "white" "cyan"
                        "dark gray" "dark orange"
                        "dark magenta" "maroon"
                        "indian red" "forest green"
                        "dark violet")
      erc-nick-color-alist '((my-erc-fn-nick . "White")))

(defun erc-get-color-for-nick (nick)
  "Gets a color for NICK. If NICK is in erc-nick-color-alist, use
that color, else hash the nick and use a random color from the
pool"
  (or (cdr (assoc nick erc-nick-color-alist))
      (nth
       (mod (string-to-number
             (substring (md5 nick) 0 6) 16)
            (length erc-colors-list))
       erc-colors-list)))

(defun erc-put-color-on-nick ()
  "Modifies the color of nicks according to
erc-get-color-for-nick"
  (save-excursion
    (goto-char (point-min))
    (if (looking-at "<\\([^>]*\\)>")
        (let ((nick (match-string 1)))
          (put-text-property (match-beginning 1) (match-end 1) 'face
                             (cons 'foreground-color
                                   (erc-get-color-for-nick nick)))))))

(add-hook 'erc-insert-modify-hook 'erc-put-color-on-nick)


;; Timestamps
(make-variable-buffer-local
 (defvar erc-last-datestamp nil))

(defun ks-timestamp (string)
  (erc-insert-timestamp-left string)
  (let ((datestamp (erc-format-timestamp (current-time) erc-datestamp-format)))
    (unless (string= datestamp erc-last-datestamp)
      (erc-insert-timestamp-left datestamp)
      (setq erc-last-datestamp datestamp))))

(setq erc-timestamp-only-if-changed-flag t
      erc-timestamp-format "[%H:%M:%S] "
      erc-datestamp-format " === [%Y-%m-%d %a] ===\n"
      erc-fill-prefix "      "
      erc-insert-timestamp-function 'ks-timestamp)


;; Kill all ERC buffers
(defun my-erc-kill-all-buffers ()
  "Kill all erc-mode buffers. Useful to cleanup after an ERC
session"
  (interactive)
  (let (final-list (list ))
    (dolist (buff (buffer-list) final-list)
      (if (equal 'erc-mode (with-current-buffer buff major-mode))
          (setq final-list (append (list (buffer-name buff)) final-list))))
    (if final-list
        (if (y-or-n-p "Kill all ERC buffers? ")
            (dolist (buff final-list nil)
              (kill-buffer buff)))
      (message "No ERC buffers to kill"))))


;; Usefull when nick changes during network connection errors
(defun my-erc-ghost-change-nick ()
  "Identify the nick. Ghost and then change nick."
  (interactive)
  (erc-cmd-MSG (format "Nickserv identify %s %s" my-erc-fn-nick my-erc-fn-pass))
  (erc-cmd-MSG (format "Nickserv ghost %s" my-erc-fn-nick))
  (erc-server-send (format "Nick %s" my-erc-fn-nick)))
