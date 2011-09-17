(provide 'my-slime)
(eval-after-load "slime"
  '(progn
     (setq slime-lisp-implementations
           '((sbcl ("/usr/bin/sbcl"))
             (clisp ("/usr/bin/clisp")))
		   common-lisp-hyperspec-root "/home/sujoy/documents/hyperspec/")
     (slime-setup '(slime-asdf
					slime-autodoc
                    slime-editing-commands
                    slime-fancy
                    slime-fontifying-fu
                    slime-fuzzy
                    slime-indentation
                    slime-mdot-fu
                    slime-package-fu
                    slime-references
                    slime-repl
                    slime-sbcl-exts
                    slime-scratch
                    slime-xref-browser))
     (slime-autodoc-mode)
     (setq slime-complete-symbol*-fancy t
		   slime-complete-symbol-function 'slime-fuzzy-complete-symbol
		   slime-when-complete-filename-expand t
		   slime-truncate-lines nil
		   slime-autodoc-use-multiline-p t)
	 (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))))

(require 'slime)
