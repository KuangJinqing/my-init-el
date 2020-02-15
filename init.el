(require 'package)
(setq package-archives
      '(("gnu" ."https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(fset 'yes-or-no-p 'y-or-n-p)
(global-set-key [remap list-buffers] 'ibuffer)
(add-hook 'emacs-startup-hook
          (lambda ()
            (when (display-graphic-p)
              (eshell)
              (cd default-directory))))

(define-auto-insert "\\.cpp" "my-oj-template.cpp")
(add-hook 'c++-mode-hook 'linum-mode)
(defun c++-compile-and-run ()
  (interactive)
  (compile (format "g++ -Wall %s -o main.out && ./main.out < exam.txt" (buffer-file-name))))
(require 'cc-mode)
(define-key c++-mode-map (kbd "<f5>") 'c++-compile-and-run)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package which-key
  :ensure t
  :config
  (which-key-mode t)
  (setq which-key-idle-delay 0.5))

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
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (setq company-idle-delay 0.2))

(use-package lsp-mode
  :ensure t
  :init
  (add-hook 'c++-mode-hook 'lsp)
  (add-hook 'python-mode 'lsp)
  (setq lsp-diagnostic-package :flycheck)
  :commands lsp
  :config
  (setq lsp-keymap-prefix "C-c l"))

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
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (projectile-mode t))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-insert-directory "~/Templates/")
 '(auto-save-default nil)
 '(before-save-hook (quote (delete-trailing-whitespace lsp-format-buffer)))
 '(column-number-mode t)
 '(delete-selection-mode t)
 '(electric-indent-mode t)
 '(electric-pair-mode t)
 '(flycheck-disabled-checkers (quote (emacs-lisp-checkdoc javascript-jshint)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(package-check-signature nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (flx yasnippet which-key treemacs-projectile material-theme hl-todo projectile lsp-treemacs company-lsp lsp-ui lsp-mode company flycheck expand-region undo-tree counsel ivy ace-window use-package)))
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(treemacs-filewatch-mode t)
 '(treemacs-follow-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
