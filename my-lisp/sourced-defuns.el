(provide 'sourced-defuns)

;;https://github.com/magnars/.emacs.d/blob/master/defuns/buffer-defuns.el
(defun cleanup-buffer-safe ()
  "Perform a bunch of safe operations on the whitespace content of a buffer.
Does not indent buffer, because it is used for a before-save-hook, and that
might be bad."
  (interactive)
  (untabify (point-min) (point-max))
  (delete-trailing-whitespace)
  (set-buffer-file-coding-system 'utf-8))

;;https://github.com/stsquad/my-emacs-stuff/blob/master/init.el
(defun insert-sequence-key (key)
  "Inserts a keystroke suitable for use in fcns like global-set-key"
  (interactive "kInsert key chord: ")
  (insert (format "(kbd \"%s\")" (key-description key))))

;;http://git.naquadah.org/?p=~jd/emacs.d.git;a=blob_plain;f=jd-google.el;hb=HEAD
(defun jd:google (keywords)
  "Form a google query URL and give it to browse-url"
  (interactive
   (list
    (if (use-region-p)
    (buffer-substring (region-beginning) (region-end))
      (read-string "Search Google for: " (thing-at-point 'word)))))
  (browse-url
   (concat "http://www.google.com/search?q="
       (replace-regexp-in-string
        "[[:space:]]+"
        "+"
        keywords))))
