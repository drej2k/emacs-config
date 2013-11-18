; Keybinding (Keyboard shortcuts)
(global-set-key [f1] 'twit)
(global-set-key [f2] 'gist-region-or-buffer)
(global-set-key [f3] 'switch-window)
(global-set-key [f4] 'magit-log)
(global-set-key [f5] 'magit-status)
(global-set-key [f6] 'multi-term)
(global-set-key [f7] 'split-window-vertically)
(global-set-key [f8] 'next-multiframe-window)
;; f9 is taken by git-status somewhere.
(global-set-key [f10] 'undo-tree-visualize)
(global-set-key [f12] 'switch-full-screen)

;; key bindings for dictionary
(global-set-key "\C-cs" 'dictionary-search)
(global-set-key "\C-cm" 'dictionary-match-words)

;; Expand region shortcut
(global-set-key (kbd "C-=") 'er/expand-region)

; General settings
(setq-default tab-width 4)

(custom-set-variables
 '(column-number-mode t)
 '(display-time-mode t)
 '(ecb-options-version "2.32")
 '(inhibit-startup-screen t)
 '(max-lisp-eval-depth 3000)
 '(max-specpdl-size 3000)
 '(menu-bar-mode 1) 

 '(rails-ws:default-server-type "mongrel")
 '(send-mail-function (quote smtpmail-send-it))
 '(smtpmail-smtp-server "smtp.googlemail.com")
 '(smtpmail-smtp-service "smtp")
 '(tool-bar-mode nil)
 '(tooltip-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "black" :foreground "white" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;; Load the Interactive Do Things tool, which makes scaling dirs quicker
(require 'ido)
(ido-mode t)

;; Remap hyper key as super
(setq x-hyper-keysym 'super)


;; (display-battery-mode)
(setq column-number-mode t)
(display-time)
(setq backup-inhibited t) ;; disable backup

;; Allow using mouse thumb button to browse URLs
(global-set-key [mouse-10] 'browse-url-at-mouse)

; stop emacs from contaminating each directory with semantic.cache
(setq semanticdb-default-save-directory "/tmp")

;; set scroll to step by 1 instead of half a page.
(setq scroll-step            1
      scroll-conservatively  10000)

;fullscreen mode
(defun switch-full-screen ()
  (interactive)
  (shell-command "wmctrl -r :ACTIVE: -btoggle,fullscreen"))
