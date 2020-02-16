(require 'package)
(setq package-archives
      '(("gnu" ."https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key [remap list-buffers] 'ibuffer)
(add-hook 'c-mode-hook 'linum-mode)
(add-hook 'c++-mode-hook 'linum-mode)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package which-key
  :ensure t
  :config
  (which-key-mode t))

(use-package material-theme
  :ensure t
  :config (load-theme 'material t))

(use-package ace-window
  :ensure t
  :config (define-key global-map (kbd "M-o") 'ace-window))

(use-package ivy
  :ensure t
  :config
  (ivy-mode t)
  (setq ivy-re-builders-alist
        '((swiper . ivy--regex-plus)
          (t . ivy--regex-fuzzy))))

(use-package counsel
  :ensure t
  :config (counsel-mode t))

(use-package swiper
  :ensure t
  :config (define-key global-map (kbd "C-s") 'swiper))

(use-package avy
  :ensure t
  :config (define-key global-map (kbd "M-g w") 'avy-goto-word-1))

(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode))

(use-package expand-region
  :ensure t
  :config (define-key global-map (kbd "C-=") 'er/expand-region))

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

(use-package company
  :ensure t
  :config
  (global-company-mode)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package lsp-mode
  :ensure t
  :init
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'c++-mode-hook 'lsp)
  (add-hook 'python-mode 'lsp)
  :commands lsp
  :config )

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config
  (push 'company-lsp company-backends))

(use-package treemacs
  :ensure t
  :config (define-key global-map (kbd"M-0") 'treemacs-select-window))

(use-package lsp-treemacs
  :ensure t
  :commands lsp
  :config
  (lsp-treemacs-sync-mode t))

(use-package projectile
  :ensure t
  :config
  (add-to-list 'projectile-project-root-files "compile-and-run.el")
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "<f5>") (lambda () (interactive)(load-file (concat projectile-project-root "compile-and-run.el"))))
  (projectile-mode t))

(use-package counsel-projectile
  :after counsel projectile
  :ensure t
  :config (counsel-projectile-mode t))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package hl-todo
  :ensure t
  :config
  (global-hl-todo-mode t)
  (define-key hl-todo-mode-map (kbd "C-c o") 'hl-todo-occur)
  (define-key hl-todo-mode-map (kbd "C-c i") 'hl-todo-insert))

(use-package yasnippet
  :ensure t
  :config (yas-global-mode t))

(use-package flx
  :ensure t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (when (memq window-system '(mac ns x))
    (exec-path-from-shell-initialize)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-insert-directory "~/Templates/")
 '(auto-save-default nil)
 '(before-save-hook (quote (delete-trailing-whitespace lsp-format-buffer)))
 '(column-number-mode t)
 '(company-idle-delay 0.1)
 '(delete-selection-mode t)
 '(electric-indent-mode t)
 '(electric-pair-mode t)
 '(flycheck-disabled-checkers (quote (emacs-lisp-checkdoc javascript-jshint)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(lsp-clients-clangd-args (quote ("-header-insertion=never")))
 '(lsp-diagnostic-package :flycheck)
 '(lsp-keymap-prefix "C-c l")
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(package-check-signature nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (counsel-projectile exec-path-from-shell flx yasnippet which-key treemacs-projectile material-theme hl-todo projectile lsp-treemacs company-lsp lsp-ui lsp-mode company flycheck expand-region undo-tree counsel ivy ace-window use-package)))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(treemacs-filewatch-mode t)
 '(treemacs-follow-mode t)
 '(which-key-idle-delay 0.5))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
