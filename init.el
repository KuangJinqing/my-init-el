(require 'package)

(setq package-archives
      '(("gnu" ."https://elpa.gnu.org/packages/")
	("melpa" . "https://melpa.org/packages/")))

(package-initialize)

(global-set-key [remap list-buffers] 'ibuffer)

(fset 'yes-or-no-p 'y-or-n-p)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package ace-window
  :ensure t
  :config (global-set-key [remap other-window] 'ace-window))

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

(use-package hungry-delete
  :ensure t
  :config (global-hungry-delete-mode))

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
    (setq company-backends (delete 'company-semantic company-backends))))

;; Add system headers path:
;;   (add-to-list 'company-c-headers-path-system "/usr/include/c++/9/")
;; Add local headers path:
;;   (add-to-list 'company-c-headers-path-user /home/<user>/project_root/include)
(use-package company-c-headers
  :ensure t
  :config (add-to-list 'company-backends 'company-c-headers))

;; Create a symbol links to external libraries
;;   ln -s /usr/include usr-include
;; Generate GNU Global database in compact format
;;   gtags -c
(use-package ggtags
  :ensure t
  :config
  (progn
    (add-hook 'c-mode-common-hook
	      (lambda ()
		(when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
		  (ggtags-mode 1))))
    (define-key ggtags-mode-map (kbd "C-c g s") 'ggtags-find-other-symbol)
    (define-key ggtags-mode-map (kbd "C-c g h") 'ggtags-view-tag-history)
    (define-key ggtags-mode-map (kbd "C-c g r") 'ggtags-find-reference)
    (define-key ggtags-mode-map (kbd "C-c g f") 'ggtags-find-file)
    (define-key ggtags-mode-map (kbd "C-c g c") 'ggtags-create-tags)
    (define-key ggtags-mode-map (kbd "C-c g u") 'ggtags-update-tags)
    (define-key ggtags-mode-map (kbd "M-,") 'pop-tag-mark)))

(use-package sr-speedbar
  :ensure t)

(use-package yasnippet
  :ensure t
  :config (yas-global-mode t))

(use-package yasnippet-snippets
  :ensure t)

(use-package smartparens
  :ensure t
  :config
  (progn
    (show-smartparens-global-mode t)
    (smartparens-global-mode t)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t)
 '(package-check-signature nil)
 '(package-enable-at-startup nil)
 '(package-selected-packages
   (quote
    (smartparens company-c-headers yasnippet-snippets yasnippet sr-speedbar ggtags company flycheck undo-tree which-key use-package hungry-delete expand-region counsel ace-window)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
