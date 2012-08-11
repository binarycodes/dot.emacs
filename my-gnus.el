(setq gnus-select-method
      '(nnimap "GMail"
               (nnimap-address "localhost")
               (nnimap-server-port 143)
               (nnimap-stream network)
               (nnimap-authenticator login)
               (nnimap-expunge-on-close ask)
               (nnimap-authinfo-file "/home/sujoy/.authinfo.gpg")))

(define-key gnus-group-mode-map (kbd "vo")
  '(lambda ()
     (interactive)
     (shell-command "offlineimap -o &" "*offlineimap*" nil)))

(setq user-mail-address "lovesujoy@gmail.com")
(setq gnus-ignored-from-addresses "lovesujoy")

(setq message-from-style 'angles)

;; turn off news
(setq gnus-select-method '(nntp nil))

;; store sent mail on local imap server
(setq gnus-message-archive-method '(nnimap "localhost"))

;; fetch all messages and never expire them
(setq gnus-agent-cache t)

(setq gnus-auto-expirable-newsgroups "trash")


;; default: "%U%R%z%I%(%[%4L: %-23,23f%]%) %s\n"
;;(setq gnus-summary-line-format "%U%R %z %o %I%(%[%-25,25n%]%) %s\n")
(setq gnus-summary-line-format "%U%R %z%I%(%[%4L: %-20,20n%]%) (%c) %s\n")


;; do not check for new groups
(setq gnus-check-new-newsgroups nil)

;; use threads
(setq gnus-show-threads t)
(setq gnus-thread-hide-subtree nil)


;; thread sort order
(setq gnus-thread-sort-functions
      '(gnus-thread-sort-by-most-recent-number
    (lambda (t1 t2)
      (gnus-thread-sort-by-most-recent-date t1 t2))))


;; use gnus to send mail
(setq mail-user-agent 'gnus-user-agent)


;; send mail function
(setq send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it)


;; spell check before sending mail
(add-hook 'message-send-hook 'ispell-message)

;; Topic headings for groups.
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
