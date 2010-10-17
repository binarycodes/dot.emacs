(provide 'my-cedet)

(eval-after-load "cedet"
	'(progn
	   (semantic-load-enable-code-helpers)))
