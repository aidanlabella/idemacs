(define-prefix-command 'my-leader-map)
(evil-define-key 'normal global-map (kbd "SPC") 'my-leader-map)
(evil-define-key 'visual global-map (kbd "SPC") 'my-leader-map)

; this line fixes the 'bug' where spc wont do anything in treemacs
(evil-define-key 'treemacs treemacs-mode-map (kbd "SPC") #'my-leader-map)

(defun define-keys (map key def &rest bindings)
  (while key
    (define-key map (read-kbd-macro key) def)
    (setq key (pop bindings)
          def (pop bindings))))

(defun define-leader-keys (map prefix key def &rest bindings)
  (define-prefix-command  map) 
  (define-key my-leader-map prefix map)
  (apply 'define-keys map key def bindings))

;Org-mode
(define-leader-keys 'org-mode-map-leader "o"
  "c" '("Org-Check Off" . org-toggle-checkbox)
  "u" 'my-org-cycle-current-headline
  "i" 'org-clock-in
  "o" 'org-clock-out
  "t" 'org-babel-tangle
  "a" 'org-agenda
  )

;File managment
(define-leader-keys 'file-managment "f"
  "t" '("FileTree (treemacs)" . treemacs)
  "f" '("FuzzyFinder (fzf)" . counsel-fzf)
  "c" '("Find or Create New File" . find-file)
  "F" '("Find File (counsel)" . counsel-find-file)
  )

;Window managment
(define-leader-keys 'window-managment "w"
  "k" '("Move 1 Window Up" . windmove-up)
  "j" '("Move 1 Window Down" . windmove-down)
  "h" '("Move 1 Window Left" . windmove-left)
  "l" '("Move 1 Window Right" . windmove-right)
  "c" '("Close Window" . delete-window)
  )

;Tab managment
(define-leader-keys 'tab-managment "t"
  "h" '("Previous Tab in Column" . centaur-tabs-backward)
  "l" '("Next Tab in Column" . centaur-tabs-forward)
  "j" '("Move 1 Tab Row Down" . centaur-tabs-backward-group)
  "k" '("Move 1 Tab Row Up" . centaur-tabs-forward-group)
  "c" '("Delete Current Tab" . centaur-tabs--kill-this-buffer-dont-ask)
  )

;comments
(define-leader-keys 'commenter "c"
  "c" '("Toggle Comments on Line" . evilnc-comment-or-uncomment-lines)
  "r" '("Toggle Comments in Region" . comment-or-uncomment-region)
  )

;Git
(define-leader-keys 'git-managment "g"
  "g" '("Git Control Panel (magit)" . magit)
  "r" 'magit-reflog
  "c" 'magit-commit
  "P" 'magit-pull
  "f" 'magit-fetch
  "p" 'magit-push
  "C" 'magit-checkout
  "l" 'magit-log
  )

;buffer managment
(define-leader-keys 'buffer-managment "b"
  "k" 'kill-buffer
  "s" 'switch-to-buffer
  "n" 'next-buffer
  "p" 'previous-buffer
  )

;project managment
(define-leader-keys 'project-managment "p"
  "a" 'projectile-add-known-project
  "p" 'projectile-switch-project
  "n" 'projectile-next-project-buffer
  "f" 'projectile-find-file
  )

;qutting/saving
(define-leader-keys 'qutting "q"
  "q" 'quit-window
  "Q" 'kill-emacs
  "m" 'exit-minibuffer
  )

(global-set-key (kbd "\t") 'company-complete)

(provide 'keys)
