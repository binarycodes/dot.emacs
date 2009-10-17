(provide 'my-cedet)

(autoload 'cedet "cedet" nil t)

(eval-after-load "cedet"
	'(progn
	   (semantic-load-enable-code-helpers)))

