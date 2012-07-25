(provide 'my-org)

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))
(require 'org-install)


(eval-after-load "org"
  '(progn
     (define-key org-mode-map (kbd "C-c a") 'org-agenda)
     (define-key org-mode-map (kbd "C-c b") 'org-iswitchb)
     (define-key org-mode-map (kbd "C-c l") 'org-store-link)
     (define-key org-mode-map (kbd "C-c t") 'org-todo)

     (setq org-todo-keywords (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d!/!)")
                                     (sequence "WAITING(w@/!)" "SOMEDAY(s!)" "|" "CANCELLED(c@/!)")
                                     (sequence "OPEN(O)" "|" "CLOSED(C)"))))

     (setq org-todo-keyword-faces
           (quote (("TODO"      :foreground "red"          :weight bold)
                   ("NEXT"      :foreground "blue"         :weight bold)
                   ("DONE"      :foreground "forest green" :weight bold)
                   ("WAITING"   :foreground "yellow"       :weight bold)
                   ("SOMEDAY"   :foreground "goldenrod"    :weight bold)
                   ("CANCELLED" :foreground "orangered"    :weight bold)
                   ("QUOTE"     :foreground "hotpink"      :weight bold)
                   ("QUOTED"    :foreground "indianred1"   :weight bold)
                   ("APPROVED"  :foreground "forest green" :weight bold)
                   ("EXPIRED"   :foreground "olivedrab1"   :weight bold)
                   ("REJECTED"  :foreground "olivedrab"    :weight bold)
                   ("OPEN"      :foreground "magenta"      :weight bold)
                   ("CLOSED"    :foreground "forest green" :weight bold))))

     ;; state change functionality (notes, timestamps, etc) can be accessed with C-c C-t Key
     (setq org-treat-S-cursor-todo-selection-as-state-change nil)

     (setq org-hide-leading-stars nil
           org-log-done 'time
           org-startup-folded 'content
           org-hide-block-startup t
           org-odd-levels-only t)

     ;; puts tags according to the todo state
     (setq org-todo-state-tags-triggers (quote (("CANCELLED" ("CANCELLED" . t))
                                                ("WAITING" ("WAITING" . t))
                                                ("SOMEDAY" ("WAITING" . t))
                                                (done ("WAITING"))
                                                ("TODO" ("WAITING") ("CANCELLED"))
                                                ("NEXT" ("WAITING"))
                                                ("DONE" ("WAITING") ("CANCELLED")))))

     (add-hook 'org-mode-hook 'org-indent-mode)))
