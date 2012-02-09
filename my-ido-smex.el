(provide 'my-ido-smex)

;; ido settings
(ido-mode t)
(setq ido-create-new-buffer 'always
	  ido-enable-flex-matching t
	  ido-use-filename-at-point 'guess
      ido-use-url-at-point t
	  ido-max-prospects 10)


(require 'smex)
(smex-initialize)

