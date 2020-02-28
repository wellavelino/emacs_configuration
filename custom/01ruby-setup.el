;;; Code:
(setq enh-ruby-program "/Users/wavelinodossantos/.rbenv/versions/2.6.5/bin/ruby")
(autoload 'enh-ruby-mode "enh-ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist
             '("\\(?:\\.rb\\|ru\\|rake\\|thor\\|Dangerfile\\|gemspec\\|podspec\\|/\\(?:Gem\\|Rake\\|Cap\\|Thor\\|Vagrant\\|Guard\\|Pod\\)file\\)\\'" . enh-ruby-mode))

(add-to-list 'interpreter-mode-alist '("ruby" . enh-ruby-mode))


(setq enh-ruby-bounce-deep-indent t)
(setq enh-ruby-hanging-brace-indent-level 2)

(require 'cl) ; If you don't have it already

;; When folding, take these delimiters into consideration
(add-to-list 'hs-special-modes-alist
             '(enh-ruby-mode
               "\\(class\\|def\\|do\\|if\\)" "\\(end\\)" "#"
               (lambda (arg) (ruby-end-of-block)) nil))

;; Cucumber
(require 'feature-mode)
(setq feature-cucumber-command "cucumber {options} {feature}")
;; .feature files should open in feature-mode
(add-to-list 'auto-mode-alist '("\.feature$" . feature-mode))

;; Rspec
(require 'rspec-mode)
;; I want rspec instead of rake spec
(setq rspec-use-rake-when-possible nil)
;; Scroll to the first test failure
(setq compilation-scroll-output 'first-error)

;; Projectile mode
(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'grizzl)

;; Prevent emacs from adding the encoding line at the top of the file
(setq ruby-insert-encoding-magic-comment nil)

;; Easily toggle ruby's hash syntax
(require 'ruby-hash-syntax)
;; Helpers to deal with strings and symbols
(require 'ruby-tools)
;; Support for YARD
(require 'yard-mode)
(add-hook 'enh-ruby-mode-hook 'yard-mode)
;; Support for running rspec tests
(require 'rspec-mode)

;; Autoclose paired syntax elements like parens, quotes, etc
(add-hook 'enh-ruby-mode-hook 'ruby-electric-mode)

;; Turn on eldoc in ruby files to display info about the
;; method or variable at point
(add-hook 'enh-ruby-mode-hook 'eldoc-mode)
;; Switch the compilation buffer mode with C-x C-q (useful
;; when interacting with a debugger)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)

;; Robe Mode
(add-hook 'enh-ruby-mode-hook 'robe-mode)
;; Robe with autocomplete
(add-hook 'enh-ruby-mode-hook 'ac-robe-setup)

(add-hook 'enh-ruby-mode-hook
          (lambda ()
            (hs-minor-mode 1) ;; Enables folding
            (modify-syntax-entry ?: "."))) ;; Adds ":" to the word definition


;; RBENV Support
(require 'rbenv)
(global-rbenv-mode)
