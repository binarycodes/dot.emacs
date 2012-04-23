(when (require 'openwith nil 'noerror)
  (setq openwith-associations
        (list
         (list (openwith-make-extension-regexp
                '("mpg" "mpeg" "mp3" "mp4" "3gp"
                  "avi" "wmv" "wav" "mov" "flv"
                  "ogm" "ogg" "mkv" "m4v"))
               "mplayer"
               '(file))
         (list (openwith-make-extension-regexp
                '("xbm" "pbm" "pgm" "ppm" "pnm"
                  "png" "gif" "bmp" "tif" "jpeg" "jpg"))
               "feh"
               '(file))
         (list (openwith-make-extension-regexp
                '("doc" "xls" "ppt" "odt" "ods" "odg" "odp"))
               "libreoffice"
               '(file))
         '("\\.lyx" "lyx" (file))
         '("\\.chm" "chmsee" (file))
         (list (openwith-make-extension-regexp
                '("pdf" "ps" "ps.gz" "dvi"))
               "evince"
               '(file))
         ))
  (openwith-mode 1))
