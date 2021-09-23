(load "~/.emacs.d/preferences.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("0ab2aa38f12640ecde12e01c4221d24f034807929c1f859cbca444f7b0a98b3a" "c1284dd4c650d6d74cfaf0106b8ae42270cab6c58f78efc5b7c825b6a4580417" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "24714e2cb4a9d6ec1335de295966906474fdb668429549416ed8636196cb1441" default))
 '(delete-selection-mode nil)
 '(doom-modeline-github t)
 '(doom-modeline-mode t)
 '(helm-minibuffer-history-key "M-p")
 '(inhibit-startup-screen t)
 '(package-selected-packages
   '(undo-tree rainbow-delimiters diff-hl json-mode unicode-fonts spacemacs-theme org-evil aggressive-indent flycheck lsp-ui helm-company helm-projectile counsel-projectile evil-nerd-commenter counsel ivy-searcher evil-org ivy-fuz dashboard ivy-explorer evil-collection git-gutter+ lsp-java javap-mode projectile lsp-mode company helm-icons helm god-mode which-key centaur-tabs treemacs-all-the-icons all-the-icons-ivy treemacs-evil evil doom-modeline doom dracula-theme gnu-elpa yasnippet tree-sitter tree-sitter-langs ccls smooth-scroll smartparens magit org-bullets csharp-mode)))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-frame-font (concat idemacs-gtk-font "-" idemacs-gtk-font-size) nil t)

(load "~/.emacs.d/packages.el")

(defun my-csharp-mode-hook ()
    ;; enable the stuff you want for C# here
      (electric-pair-mode 1)       ;; Emacs 24
        (electric-pair-local-mode 1) ;; Emacs 25
	  )
(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)

;(smooth-scroll-mode t)

;(sublimity-mode 1)
;(setq sublimity-scroll-weight 10
      ;sublimity-scroll-drift-length 5)
;(setq sublimity-scroll-vertical-frame-delay 0.001)

(with-eval-after-load 'helm
	(define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
	(define-key helm-map (kbd "C-z") #'helm-select-action))

(show-paren-mode 1)
(helm-icons-enable)
(centaur-tabs-mode t)
(centaur-tabs-headline-match)
(fset 'yes-or-no-p 'y-or-n-p)

(xterm-mouse-mode 1)

(with-eval-after-load 'company
    (define-key company-active-map (kbd "<tab>") 'company-select-next))

(require 'display-line-numbers)
(defcustom display-line-numbers-exempt-modes '(vterm-mode treemacs-mode eshell-mode shell-mode term-mode ansi-term-mode)
  "Major modes on which to disable the linum mode, exempts them from global requirement"
  :group 'display-line-numbers
  :type 'list
  :version "green")

(defun display-line-numbers--turn-on ()
  "turn on line numbers but excempting certain majore modes defined in `display-line-numbers-exempt-modes'"
  (if (and
       (not (member major-mode display-line-numbers-exempt-modes))
       (not (minibufferp)))
      (display-line-numbers-mode)))

(global-display-line-numbers-mode)

(setq-default left-margin-width 1)
(set-window-buffer nil (current-buffer))

(setq centaur-tabs-style "bar")
(setq centaur-tabs-set-bar 'under)
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-height 38)
(setq centaur-tabs-set-modified-marker t)

(setq dashboard-startup-banner 'logo)
(setq dashboard-items '((recents  . 5)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)))

(setq projectile-completion-system 'helm)

(centaur-tabs-change-fonts idemacs-gtk-font 116)

(define-prefix-command 'my-leader-map)

(setenv "SSH_ASKPASS" "git-gui--askpass")

(setq custom-tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-width custom-tab-width)
(setq-default python-indent-offset custom-tab-width)
(setq-default c-basic-offset custom-tab-width)
(setq-default evil-shift-width custom-tab-width)
(setq all-the-icons-ivy-file-commands
      '(counsel-find-file counsel-fzf counsel-file-jump counsel-recentf counsel-projectile-find-file counsel-projectile-find-dir))


(setq-default electric-indent-inhibit t)
(setq backward-delete-char-untabify-method 'hungry)
(setq tab-width custom-tab-width) 

(defun my-newline-and-indent-mode-hook ()
  (local-set-key (kbd "RET") (key-binding (kbd "M-j")))
  (local-set-key (kbd "<C-return>") #'electric-indent-just-newline))

(add-hook 'prog-mode-hook #'my-newline-and-indent-mode-hook)


(load "~/.emacs.d/keys.el")
(require 'keys)


(add-hook 'after-init-hook 'global-company-mode)

;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;;(custom-set-faces
;; ;; custom-set-faces was added by Custom.
;; ;; If you edit it by hand, you could mess it up, so be careful.
;; ;; Your init file should contain only one such instance.
;; ;; If there is more than one, they won't work right.
;; '(font-lock-type-face ((t (:foreground "#bd93f9" :slant italic)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
