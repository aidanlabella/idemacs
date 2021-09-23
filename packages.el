(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  (require 'use-package))

(use-package json-mode
    :ensure t)

(use-package evil
    :init
    (setq evil-want-keybinding nil)
    (setq evil-want-C-u-scroll t)
    (evil-collection-init)
    (evil-mode 1))

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
(use-package git-gutter+
    :ensure t
    :init
    (global-git-gutter+-mode))

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
    (add-hook 'c++-mode-hook 'lsp))
(use-package company
    :ensure t
    :init
    (with-eval-after-load 'company
    (define-key company-active-map (kbd "<tab>") 'company-select-next)))

(use-package helm-icons
    :ensure t)
(use-package helm
    :ensure t
    :init
    (helm-projectile-on)
    (helm-icons-enable))

(use-package god-mode
    :ensure t)
(use-package which-key
    :ensure t
    :init
    (which-key-mode)
    (which-key-setup-side-window-bottom)
    (load "~/.emacs.d/keys.el")
    (require 'keys))

(use-package centaur-tabs
    :ensure t
    :init
    (centaur-tabs-mode t)
    (centaur-tabs-headline-match)
    :config
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
    :init
     '(doom-modeline-github t)
     '(doom-modeline-mode t)
     :config
    (setq doom-modeline-mode 1)
    (setq doom-modeline-height 25)
    (setq doom-modeline-bar-width 1)
    (setq doom-modeline-icon t)
    (setq doom-modeline-major-mode-icon t)
    (setq doom-modeline-major-mode-color-icon t)
    (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
    (setq doom-modeline-buffer-state-icon t)
    (setq doom-modeline-buffer-modification-icon t)
    (setq doom-modeline-minor-modes nil)
    (setq doom-modeline-enable-word-count nil)
    (setq doom-modeline-buffer-encoding t)
    (setq doom-modeline-indent-info nil)
    (setq doom-modeline-checker-simple-format t)
    (setq doom-modeline-vcs-max-length 12)
    (setq doom-modeline-env-version t)
    (setq doom-modeline-irc-stylize 'identity)
    (setq doom-modeline-github-timer nil)
    (setq doom-modeline-gnus-timer nil))

(use-package doom
    :ensure t)
(use-package dracula-theme
    :ensure t)
(use-package gnu-elpa
    :ensure t)
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
    (add-hook 'projectile-after-switch-project-hook 'treemacs-display-current-project-exclusively)

     )
(use-package tree-sitter-langs
    :ensure t)
(use-package ccls
    :ensure t)
(use-package smooth-scroll
    :ensure t)
(use-package smartparens
    :ensure t
    :init 
    (smartparens-global-mode 1))

(use-package magit
    :ensure t)
(use-package org-bullets
    :ensure t
    :config
    (add-hook 'org-mode-hook (lambda ()  (org-bullets-mode 1))))
(use-package csharp-mode
    :ensure t)
