(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
)

(require 'use-package)

(use-package json-mode
    :ensure t)

(use-package evil
    :init
    (setq evil-want-keybinding nil)
    (setq evil-want-C-u-scroll t)
    (evil-collection-init)
    (evil-mode 1)
    (evil-set-initial-state 'pdf-view-mode 'normal)
    :config
    (evil-ex-define-cmd "W[rite]" 'save-buffer)
    (evil-ex-define-cmd "X" 'save-buffers-kill-emacs)
    )

(use-package unicode-fonts
    :ensure t)
(use-package org-evil
    :ensure t)
(use-package aggressive-indent
    :ensure t)
(use-package flycheck
    :ensure t)
(use-package lsp-ui
    :ensure t)
(use-package helm-company
    :ensure t
    :init
    (add-hook 'after-init-hook 'global-company-mode))
(use-package helm-projectile
    :ensure t)
(use-package counsel-projectile
    :ensure t)
(use-package evil-nerd-commenter
    :ensure t)
(use-package counsel
    :ensure t)
(use-package ivy-searcher
    :ensure t)
(use-package evil-org
    :ensure t)
(use-package ivy-fuz
    :ensure t)
(use-package dashboard
    :ensure t
    :init
    (dashboard-setup-startup-hook)
    :config
    (setq dashboard-startup-banner 'logo)
    (setq dashboard-items '((recents  . 5)
                            (bookmarks . 5)
                            (projects . 5)
                            (agenda . 5))))
(use-package ivy-explorer
    :ensure t)
(use-package evil-collection
    :ensure t)
(use-package diff-hl
    :ensure t
    :init
    (global-diff-hl-mode))

(use-package lsp-java
    :ensure t)
(use-package javap-mode
    :ensure t)
(use-package projectile
    :ensure t
    :init
    (projectile-mode +1)
    :config
    (setq projectile-completion-system 'helm))

(use-package lsp-mode
    :ensure t
    :config 
    (add-hook 'java-mode-hook 'lsp)
    (add-hook 'c-mode-hook 'lsp)
    (add-hook 'csharp-mode-hook 'lsp)
    (add-hook 'javascript-mode-hook 'lsp)
    (add-hook 'c++-mode-hook 'lsp)
    (add-hook 'tex-mode-hook 'lsp)
    (add-hook 'latex-mode-hook 'lsp))

(use-package company
    :ensure t
    :init
    (with-eval-after-load 'company
    (define-key company-active-map (kbd "<tab>") 'company-select-next)))

(use-package helm-icons
    :ensure t
    :init
    (helm-icons-enable))

(use-package helm
    :ensure t
    :init
    (helm-projectile-on)
    (with-eval-after-load 'helm
	(define-key helm-map (kbd "TAB") #'helm-execute-persistent-action)
	(define-key helm-map (kbd "C-z") #'helm-select-action)))

(use-package god-mode
    :ensure t)

(use-package which-key
    :ensure t
    :config
    (setq which-key-idle-delay 0.2)
    (which-key-mode)
    (which-key-setup-side-window-bottom))

(use-package centaur-tabs
    :ensure t
    :init
    (centaur-tabs-mode t)
    (centaur-tabs-headline-match)
    :config
    (centaur-tabs-change-fonts idemacs-gtk-font 116)
    (setq centaur-tabs-cycle-scope 'tabs)
    (setq centaur-tabs-style "bar")
    (setq centaur-tabs-set-bar 'under)
    (setq centaur-tabs-set-icons t)
    (setq centaur-tabs-height 38)
    (setq centaur-tabs-set-modified-marker t))

(use-package treemacs-all-the-icons
    :ensure t)

(use-package all-the-icons-ivy
    :ensure t
    :init
    (all-the-icons-ivy-setup))

(use-package treemacs-evil
    :ensure t
    :init
    (treemacs-git-mode 'deferred)
    :config
    (evil-define-key 'normal global-map (kbd "SPC") 'my-leader-map))

(use-package doom-modeline
     :ensure t
     :init (doom-modeline-mode 1)
     :config
     (display-battery-mode 1)
     (setq doom-modeline-lsp t))

(use-package doom
    :ensure t)
(use-package dracula-theme
    :ensure t)
;(use-package gnu-elpa
    ;:ensure t)
(use-package yasnippet
    :ensure t
    :init
    (yas-global-mode 1))
(use-package tree-sitter
    :ensure t
    :init
    (global-tree-sitter-mode)
    (global-hl-line-mode +1)
    :config 
    (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
    (add-hook 'projectile-after-switch-project-hook 'treemacs-display-current-project-exclusively))

(use-package tree-sitter-langs
    :ensure t)
(use-package ccls
    :ensure t)
(use-package smooth-scroll
    :ensure t)
;(use-package smartparens
    ;:ensure t
    ;:init 
    ;(smartparens-global-mode 1))

(use-package magit
    :ensure t)
(use-package org-bullets
    :ensure t
    :config
    (add-hook 'org-mode-hook (lambda ()  (org-bullets-mode 1))))
(use-package csharp-mode
    :ensure t
    :config
    (defun my-csharp-mode-hook ()
        ;; enable the stuff you want for C# here
          (electric-pair-mode 1)       ;; Emacs 24
            (electric-pair-local-mode 1) ;; Emacs 25
          )
    (add-hook 'csharp-mode-hook 'my-csharp-mode-hook))

(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-dracula t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  ;(doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use "doom-colors" for less minimal icon theme
  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(use-package rainbow-delimiters
    :ensure t
    :config
    (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package undo-tree
    :ensure t
    :init
    (evil-set-undo-system 'undo-tree)
    (global-undo-tree-mode))

(use-package telega
    :ensure t
    :load-path  "~/telega.el"
    :commands (telega)
    :defer t)

(use-package php-mode
    :ensure t)

(use-package vterm
    :ensure t)

(use-package shell-pop
    :ensure t)

(use-package lsp-latex
     :ensure t
     :init
     (setq lsp-latex-texlab-executable "/usr/bin/texlab"))
