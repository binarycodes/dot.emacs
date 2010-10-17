(provide 'my-defuns)

(defun toggle-browser()
  "Toggle the browser used by emacs between w3m and firefox"
  (interactive)
  (if (equal browse-url-browser-function 'w3m-browse-url)
      (setq browse-url-browser-function 'browse-url-firefox)
    (setq browse-url-browser-function 'w3m-browse-url))
  (message "%s" browse-url-browser-function))

(defun lorem ()
  (interactive)
  (insert "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Praesent libero orci, auctor sed, faucibus vestibulum, gravida vitae, arcu. Nunc posuere. Suspendisse potenti. Praesent in arcu ac nisl ultricies ultricies. Fusce eros. Sed pulvinar vehicula ante. Maecenas urna dolor, egestas vel, tristique et, porta eu, leo. Curabitur vitae sem eget arcu laoreet vulputate. Cras orci neque, faucibus et, rhoncus ac, venenatis ac, magna. Aenean eu lacus. Aliquam luctus facilisis augue. Nullam fringilla consectetuer sapien. Aenean neque augue, bibendum a, feugiat id, lobortis vel, nunc. Suspendisse in nibh quis erat condimentum pretium. Vestibulum tempor odio et leo. Sed sodales vestibulum justo. Cras convallis pellentesque augue. In eu magna. In pede turpis, feugiat pulvinar, sodales eget, bibendum consectetuer, magna. Pellentesque vitae augue."))

;; Make the whole buffer pretty and consistent
(defun iwb()
  "Indent Whole Buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))


;; Adds base to the load-path and all dirs from include-list recursively, while
;; excluding the content from the exclude-list
(defun add-to-load-path-with-subdirs (base exclude-list include-list)
  (dolist (f (directory-files base))
    (let ((name (concat base "/" f)))
      (when (and (file-directory-p name)
                 (not (member f exclude-list)))
        (add-to-list 'load-path name)
        (when (member f include-list)
          (add-to-load-path-with-subdirs name exclude-list include-list)))))
  (add-to-list 'load-path base))


;; Kills all buffers that are not associated with a file on disk
(defun my-kill-non-file-buffs ()
  (interactive)
  (progn
    (setq bufflist (buffer-list))
    (while (not (equal bufflist nil))
      (if (equal (buffer-file-name (car bufflist)) nil)
          (kill-buffer (car bufflist)))
      (setq bufflist (cdr bufflist)))))

