(provide 'my-erc)

(require 'erc)

(require 'erc-join)
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist
      '(("freenode.net" "#emacs" "#archlinux")))

(setq erc-modules '(scrolltobottom))
(add-hook 'erc-mode-hook
          '(lambda ()
             (require 'erc-pcomplete)
             (pcomplete-erc-setup)
             (erc-completion-mode 1)
             (erc-button-mode -1)
             (erc-spelling-mode 1)))

(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE"
                                "324" "329" "332" "333" "353" "477"))

(erc-track-mode t)

(setq erc-auto-query 'window)

;; don't show any of this
(setq erc-hide-list '("JOIN" "PART" "QUIT"))

(require 'erc-fill)
(erc-fill-mode 1)

(require 'erc-ring)
(erc-ring-mode t)

(require 'erc-netsplit)
(erc-netsplit-mode t)

(erc-timestamp-mode t)
(setq erc-timestamp-format "[%H:%M:%S]")


(define-key erc-mode-map (kbd "C-c C-q")
  (lambda (nick)
    (interactive (list (completing-read "Nick: " channel-members)))
    (erc-cmd-QUERY nick)))


;; number of opped/voiced/normal members of the current channel in the modeline
(define-minor-mode ncm-mode "" nil
  (:eval
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
     (format " %S/%S/%S " ops voices members))))


;; change header line face if disconnected
(defface erc-header-line-disconnected
  '((t (:foreground "black" :background "indianred")))
  "Face to use when ERC has been disconnected.")

(defun erc-update-header-line-show-disconnected ()
  "Use a different face in the header-line when disconnected."
  (erc-with-server-buffer
    (cond ((erc-server-process-alive) 'erc-header-line)
          (t 'erc-header-line-disconnected))))

(setq erc-header-line-face-method 'erc-update-header-line-show-disconnected)


(defun myerc-start-or-switch ()
  "Switch to ERC buffer using IDO to choose which one, or start ERC if not already started."
  (interactive)
  (let (final-list (list ))
    (dolist (buf (buffer-list) final-list)
      (if (equal 'erc-mode (with-current-buffer buf major-mode))
          (setq final-list (append (list (buffer-name buf)) final-list))))
    (if final-list
        (switch-to-buffer (ido-completing-read "Buffer: " final-list))
      (erc :server "irc.freenode.net"
           :port 6667
           :nick my-erc-fn-nick
           :password my-erc-fn-pass
           :full-name my-erc-fn-name))))

;; ERC nick colors section

;; Pool of colors to use when coloring IRC nicks.
(setq erc-colors-list '("green" "blue" "red"
                        "dark gray" "dark orange"
                        "dark magenta" "maroon"
                        "indian red" "forest green"
                        "midnight blue" "dark violet"))
;; special colors for some people
(setq erc-nick-color-alist '((my-erc-fn-nick . "White")))

(defun erc-get-color-for-nick (nick)
  "Gets a color for NICK. If NICK is in erc-nick-color-alist, use that color, else hash the nick and use a random color from the pool"
  (or (cdr (assoc nick erc-nick-color-alist))
      (nth
       (mod (string-to-number
             (substring (md5 nick) 0 6) 16)
            (length erc-colors-list))
       erc-colors-list)))

(defun erc-put-color-on-nick ()
  "Modifies the color of nicks according to erc-get-color-for-nick"
  (save-excursion
    (goto-char (point-min))
    (if (looking-at "<\\([^>]*\\)>")
        (let ((nick (match-string 1)))
          (put-text-property (match-beginning 1) (match-end 1) 'face
                             (cons 'foreground-color
                                   (erc-get-color-for-nick nick)))))))

(add-hook 'erc-insert-modify-hook 'erc-put-color-on-nick)

;; timestamps

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
      erc-datestamp-format " === [%Y-%m-%d %a] ===\n" ; mandatory ascii art                          
      erc-fill-prefix "      "
      erc-insert-timestamp-function 'ks-timestamp)
