(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Ensure "use-package" is installed
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Use y-or-n instead of yes-or-no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Increase the amount of data which Emacs reads from the process for lsp-mode
(setq read-process-output-max (* 1024 1024))

(use-package zenburn-theme
  :ensure t
  :config
  (load-theme 'zenburn t))

(use-package doom-modeline
  :ensure t
  :config
  (doom-modeline-mode t))

(use-package which-key
  :ensure t
  :config
  (which-key-mode t)
  :custom
  (which-key-idle-delay 0.5))

(use-package ace-window
  :ensure t
  :config
  (global-set-key (kbd "M-o") 'ace-window)
  :custom
  (aw-ignore-on nil)
  (aw-dispatch-always t))

(use-package counsel
  :ensure t
  :config
  (ivy-mode t)
  (counsel-mode t)
  (define-key counsel-mode-map (kbd "C-s") 'swiper)
  (define-key counsel-find-file-map (kbd "RET") 'ivy-alt-done)
  (define-key counsel-find-file-map (kbd "C-j") 'ivy-immediate-done)
  (setq ivy-initial-inputs-alist nil)
  :custom
  (ivy-re-builders-alist '((swiper . ivy--regex-plus)
                           (t . ivy--regex-fuzzy))))

(use-package flx
  :ensure t)

(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "C-'") 'avy-goto-char-timer)
  :custom
  (avy-timeout-seconds 0.2))

(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode t))

(use-package expand-region
  :ensure t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package projectile
  :ensure t
  :requires ivy
  :config
  (projectile-mode t)
  (define-key projectile-mode-map (kbd "s-i") 'projectile-command-map)
  :custom
  (projectile-completion-system 'ivy))

(use-package counsel-projectile
  :ensure t
  :after counsel projectile
  :config
  (counsel-projectile-mode t))

(use-package treemacs
  :ensure t
  :config
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (global-set-key (kbd "<f7>") 'treemacs-select-window))

(use-package flycheck
  :ensure t
  :config
  (global-flycheck-mode t))

(use-package company
  :ensure t
  :config
  (global-company-mode t)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1))

(use-package lsp-mode
  :ensure t
  :hook ((c-mode . lsp)
         (c++-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (define-key lsp-mode-map (kbd "M-.") 'lsp-find-definition)
  :custom
  (lsp-keymap-prefix "s-l"))

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package lsp-ivy
  :ensure t
  :commands lsp-ivy-workspace-symbol)

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-errors-list
  :config
  (define-key lsp-mode-map (kbd "<f8>") 'lsp-treemacs-symbols))

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
 '(before-save-hook (quote (delete-trailing-whitespace)))
 '(column-number-indicator-zero-based nil)
 '(column-number-mode t)
 '(comint-terminfo-terminal "ansi")
 '(css-indent-offset 2)
 '(delete-selection-mode t)
 '(electric-pair-mode t)
 '(gc-cons-threshold 100000000)
 '(global-auto-revert-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(js-indent-level 2)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (zenburn-theme doom-modeline exec-path-from-shell lsp-treemacs lsp-ivy lsp-ui lsp-mode company flycheck treemacs counsel-projectile projectile expand-region undo-tree flx counsel ace-window which-key use-package)))
 '(prog-mode-hook (quote (hs-minor-mode)))
 '(ring-bell-function (quote ignore))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(truncate-lines t))
;; '(url-proxy-services
;;   (quote
;;    (("http" . "\"127.0.0.1:8888\"")
;;     ("https" . "\"127.0.0.1:8888\"")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
