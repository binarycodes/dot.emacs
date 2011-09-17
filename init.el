;; create the history directory if not exists
;; since it is not versioned

(unless (file-exists-p "~/.emacs.d/history/")
  (mkdir "~/.emacs.d/history/"))

;; set init file for custom settings
(setq custom-file "~/.emacs.d/custom.el")
(load-file custom-file)

;; general custom functions
(load-file (expand-file-name "~/.emacs.d/my-lisp/my-defuns.el"))

;; add paths to the load-path
(add-to-load-path-with-subdirs (expand-file-name "~/.emacs.d")
							   '(".." "." ".srecode" "auto-save-list"
								 "history" "my-backup-files" "eshell" "custom.el")
							   '("plugins" "my-lisp"))

(add-to-list 'load-path "/usr/share/emacs/site-lisp/cedet/common")
(add-to-list 'load-path "/usr/share/emacs/site-lisp/auctex")

(load-file (expand-file-name "~/.emacs.d/my-requires.el"))
