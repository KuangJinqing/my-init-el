(require 'package)
(setq package-archives
      '(("gnu" ."https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")))
(package-initialize)

(fset 'yes-or-no-p 'y-or-n-p)

(global-set-key [remap list-buffers] 'ibuffer)

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

(use-package ace-window
  :ensure t
  :config (global-set-key (kbd "M-o") 'ace-window))

(use-package ivy
  :ensure t
  :config (ivy-mode t))

(use-package counsel
  :ensure t
  :config (counsel-mode t))

(use-package swiper
  :ensure t
  :bind (("C-s" . swiper)
	 ("C-c C-r" . ivy-resume)))

(use-package avy
  :ensure t
  :bind ("M-g w" . avy-goto-word-1))

(use-package undo-tree
  :ensure t
  :config (global-undo-tree-mode))

(use-package expand-region
  :ensure t
  :config (global-set-key (kbd "C-=") 'er/expand-region))

(use-package flycheck
  :ensure t
  :config (global-flycheck-mode))

;; Create a file named .dir-locals.el at project root
;; ((nil . ((company-clang-arguments . ("-I/home/<user>/project_root/include1/"
;;                                     "-I/home/<user>/project_root/include2/")))))
(use-package company
  :ensure t
  :config
  (progn
    (global-company-mode)
;    (setq company-backends (delete 'company-semantic company-backends))
    (define-key company-active-map (kbd "M-n") nil)
    (define-key company-active-map (kbd "M-p") nil)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)))

(use-package lsp-mode
  :ensure t
  :hook
  (c++-mode . lsp)
  (python-mode . lsp)
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

(use-package company-lsp
  :ensure t
  :commands company-lsp
  :config (push 'company-lsp company-backends))

(use-package lsp-treemacs
  :ensure t
  :commands lsp-treemacs-error-list)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-insert-directory "~/Templates/")
 '(auto-save-default nil)
 '(before-save-hook (quote (delete-trailing-whitespace lsp-format-buffer)))
 '(column-number-mode t)
 '(company-idle-delay 0)
 '(company-lsp-enable-snippet nil)
 '(electric-indent-mode t)
 '(electric-pair-mode t)
 '(flycheck-disabled-checkers (quote (emacs-lisp-checkdoc javascript-jshint)))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(lsp-enable-snippet nil)
 '(lsp-prefer-flymake :none)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(package-check-signature nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (lsp-treemacs company-lsp lsp-ui lsp-mode company flycheck expand-region undo-tree counsel ivy ace-window use-package)))
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'scroll-left 'disabled nil)
