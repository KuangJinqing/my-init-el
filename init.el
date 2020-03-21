(require 'package)
(setq package-archives
      '(("gnu" ."https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key [remap list-buffers] 'ibuffer)

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
  (global-company-mode t)
  (add-hook 'eshell-mode-hook (lambda()(company-mode -1)))
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))

(use-package treemacs
  :ensure t
  :config (define-key global-map (kbd "M-0") 'treemacs-select-window))

(use-package lsp-mode
  :ensure t
  :config
  (add-hook 'c-mode-hook 'lsp)
  (add-hook 'c++-mode-hook 'lsp)
  (add-hook 'python-mode 'lsp)
  (add-hook 'lsp-mode-hook 'linum-mode)
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company-lsp
  :ensure t
  :requires company
  :config
  (push 'company-lsp company-backends))

(use-package lsp-treemacs
  :ensure t
  :config
  (lsp-treemacs-sync-mode t)
  (define-key lsp-mode-map (kbd "M-1") 'lsp-treemacs-symbols)
  (define-key lsp-mode-map (kbd "M-2") 'lsp-treemacs-errors-list))

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
 '(auto-save-default nil)
 '(before-save-hook (quote (delete-trailing-whitespace lsp-format-buffer)))
 '(column-number-mode t)
 '(company-idle-delay 0)
 '(company-lsp-enable-snippet nil)
 '(company-minimum-prefix-length 1)
 '(delete-selection-mode t)
 '(electric-indent-mode t)
 '(electric-pair-mode t)
 '(flycheck-disabled-checkers (quote (emacs-lisp-checkdoc javascript-jshint)))
 '(global-auto-revert-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(lsp-clients-clangd-args
   (quote
    ("-j=6" "-background-index" "-log=error" "-header-insertion=never")))
 '(lsp-diagnostic-package :flycheck)
 '(lsp-enable-snippet nil)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(package-check-signature nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (lsp-treemacs company-lsp lsp-ui lsp-mode counsel-projectile exec-path-from-shell flx yasnippet which-key treemacs-projectile material-theme projectile company flycheck expand-region undo-tree counsel ivy ace-window use-package)))
 '(projectile-track-known-projects-automatically nil)
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
