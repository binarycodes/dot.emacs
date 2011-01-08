(provide 'my-mic-paren)

(require 'mic-paren)

(eval-after-load "mic-paren"
  '(progn
	 (paren-activate)))
