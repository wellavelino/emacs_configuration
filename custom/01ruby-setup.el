;;; Code:
;; Enh Ruby Mode Configuration
(setq enh-ruby-program "/Users/wellington/.rbenv/versions/2.4.0/bin/ruby")
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Fastfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Dangerfile$" . enh-ruby-mode))

(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))

(setq enh-ruby-bounce-deep-indent t)
(setq enh-ruby-hanging-brace-indent-level 2)

(require 'cl) ; If you don't have it already

(defun* get-closest-gemfile-root (&optional (file "Gemfile"))
  "Determine the pathname of the first instance of FILE starting from the current directory towards root.
This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
of FILE in the current directory, suitable for creation"
  (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
    (loop 
     for d = default-directory then (expand-file-name ".." d)
     if (file-exists-p (expand-file-name file d))
     return d
     if (equal d root)
     return nil)))

;; Use RBENV to manage Ruby versions
;(add-to-list 'load-path (expand-file-name "~/.emacs.d/rbenv/rbenv.el"))
(require 'rbenv)
(global-rbenv-mode)

;; Robe Mode
(add-hook 'ruby-mode-hook 'robe-mode)
;; Robe with autocomplete
(add-hook 'robe-mode-hook 'ac-robe-setup)

;; Feature Mode
(require 'feature-mode)
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Ruby Tools
(require 'ruby-tools)
