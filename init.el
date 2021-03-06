;; package -- Emacs Configuration

(package-initialize)

;; Repositories
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("melpa" . "http://melpa.org/packages/")))


; list the packages you want
(defvar package-list)
(setq package-list '(json-mode
		   ruby-hash-syntax
		   magit
		   textmate
		   smartparens
		   ruby-tools
		   rbenv
		   rainbow-mode
		   projectile
		   multiple-cursors
		   grizzl
		   flycheck
		   feature-mode
		   enh-ruby-mode
		   yard-mode
		   rspec-mode
		   auto-complete
		   markdown-mode
		   doom-themes
		   doom-modeline
		   swift-mode
		   use-package))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))

(require 'package)
(require 'use-package)

(add-to-list 'load-path "~/.emacs.d/custom")
(load "00common-setup.el")
(load "01ruby-setup.el")
(load "02packages-setup.el")
(load "highlight-indent-guides.el")
(load "yaml_mode.el")
(load "python-setup.el")

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; Python interpreter
(setq python-shell-interpreter "ipython"
       python-shell-interpreter-args "-i")

(provide 'init)
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(display-time-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (elpy
     ruby-hash-syntax
     rspec-mode
     ansible
     json-mode
     markdown-mode
     magit
     textmate
     smartparens
     ruby-tools
     rbenv
     rainbow-mode
     projectile
     multiple-cursors
     grizzl
     flycheck
     feature-mode
     yard-mode
     enh-ruby-mode
     swift-mode
     auto-complete
     use-package)))
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
