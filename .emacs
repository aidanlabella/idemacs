(load "~/.emacs.d/preferences.el")

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(set-frame-font (concat idemacs-gtk-font "-" idemacs-gtk-font-size) nil t)
;(set-frame-parameter (selected-frame) 'alpha '(100 . 100))
;; UTF-8 support
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)    
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

(load "~/.emacs.d/packages.el")


;(smooth-scroll-mode t)

;(sublimity-mode 1)
;(setq sublimity-scroll-weight 10
      ;sublimity-scroll-drift-length 5)
;(setq sublimity-scroll-vertical-frame-delay 0.001)


(show-paren-mode 1)
(helm-icons-enable)
(fset 'yes-or-no-p 'y-or-n-p)

(xterm-mouse-mode 1)


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

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'org-mode-hook 'org-indent-mode)

(load "~/.emacs.d/keys.el")
(require 'keys)
