(provide 'my-defuns)

(defun toggle-browser()
  "Toggle the browser used by emacs between w3m and firefox"
  (interactive)
  (if (equal browse-url-browser-function 'w3m-browse-url)
      (setq browse-url-browser-function 'browse-url-firefox)
    (setq browse-url-browser-function 'w3m-browse-url))
  (message "%s" browse-url-browser-function))


;; Make the whole buffer pretty and consistent
(defun iwb()
  "Indent Whole Buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))


(defun add-to-load-path-with-subdirs (base exclude-list include-list)
  "Adds base to the load-path and all dirs from include-list
recursively, while excluding the content from the exclude-list"
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name)
                 (not (member f exclude-list)))
        (add-to-list 'load-path name)
        (when (member f include-list)
          (add-to-load-path-with-subdirs name exclude-list include-list)))))
  (add-to-list 'load-path base))


(defun my-kill-non-file-buffs ()
  "Kill all buffers that are not associated with files or running
processes. Excludes on-file buffers for some modes and buffer
names. Mode list and uffer names to be updated as per
convenience."
  (interactive)
  (dolist (buffer (buffer-list))
    (when (and (equal (buffer-file-name buffer) nil)
               (not (member (with-current-buffer buffer major-mode) '(erc-mode slime-repl-mode comint-mode inferior-lisp)))
               (equal (get-buffer-process buffer) nil))
      (kill-buffer buffer)))
  (message "Killed some buffers!"))


(defun my-go-to-scratch ()
  "Re-create the *scratch* buffer if it doesn't exist else switch
to the existing one."
  (interactive)
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))
