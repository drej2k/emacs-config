;; ;; An attempt to get smart-mode-line working
;; ;; This allows the sml theme to be loaded without questions
;; (custom-set-variables
;;  '(custom-safe-themes (quote ("756597b162f1be60a12dbd52bab71d40d6a2845a3e3c2584c6573ee9c332a66e" default))))


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(add-to-list 'load-path "~/.emacs.d/custom")
(add-to-list 'load-path "~/.emacs.d/external") ; Plugins not in the repo

(package-initialize)

;; ;; OLD cask
;; (require 'cask "~/.cask/cask.el")
;; (cask-initialize)
;; (require 'pallet)

;; Package configuration (NEW way as of 02/12/2016)
(setq use-package-always-ensure t)
(use-package all-the-icons)
(use-package findr)
(use-package xkcd)
(use-package ansible)
(use-package circe)
(use-package company)
(use-package csv-mode)
(use-package enh-ruby-mode)
(use-package expand-region)
(use-package js2-mode)
(use-package jsx-mode)
(use-package markdown-mode)
(use-package org-cliplink)
(use-package org-clock-csv)
(use-package paradox)
(use-package switch-window)
(use-package tramp-term)
(use-package twittering-mode)

;; All custom files have a number at the front so they don't clash with the library files.
(require 'dark-lord-theme)

;;--------------------------------------------------------------------------------
;;-Base emacs related (0-39)
;;--------------------------------------------------------------------------------
(load "00-common-setup.el")
(load "01-pdf-tools.el")             ; PDF tools
(load "02-bpr.el")                   ; Background Process Runner
(load "03-async.el")                 ; Asynchronous abilities
(load "04-packages.el")              ; Package related tasks
(load "05-scroll-settings.el")       ; Settings for scrolling
(load "06-togetherly.el")            ; Work together with someone in the same file.
(load "07-diredful.el")              ; Color files in dired listing
(load "08-nlinum.el")                ; Line number mode (faster than standard package)
(load "09-real-auto-save.el")        ; Autosave files
(load "10-multi-term.el")            ; Handle multiple terminals in emacs nicely.
(load "11-eshell.el")                ; eshell customisations
(load "12-projectile.el")            ; Manage projects
(load "13-dired-details.el")         ; Hide/show details in directory mode
(load "14-ido-mode.el")              ; IDO mode for moving around dirs & buffers
(load "15-winner-mode.el")           ; Undo/redo window layouts
(load "16-sudo-edit.el")             ; editing files as root
(load "17-emacs-server.el")          ; Config relating to emacs server
(load "18-flyspell.el")              ; Spelling
;;(load "19-spotify.el")              ; Control spotify from emacs
;;(load "20-volume.el")               ; Control volume from emacs
;;(load "21-circe.el")                ; IRC settings
;;(load "22-epa-file.el")             ; Encryption
;;(load "23-markdown.el")             ; for md files.
;;(load "24-smex.el")                 ; smex (quick narrow down commands)
;;(load "25-speedbar.el")             ; Speedbar customisations
;;(load "26-guide-key.el")            ; Show keyboard shortcuts at certian points
;;(load "27-moz-controller.el")       ; Control firefox within emacs
;;(load "28-save_hooks.el")           ; Processes to perform on save.
;;(load "29-ace_jump.el")             ; Jump around quickly in a file
;;(load "30-discover.el")             ; Discover more of emacs using context menus
;;(load "31-sunshine.el")             ; Weather
;;(load "32-twittering-mode.el")      ; Twitter client
;;(load "33-ivy.el")                      ; ivy-mode (not convinced yet)

;;--------------------------------------------------------------------------------
;;-Org-mode related (40-49)
;;--------------------------------------------------------------------------------
(load "40-org.el")                    ; Org mode
(load "41-org2blog.el")               ; Org2blog mode
(load "42-org-expiry.el")             ; Org expiry <-- add created property on todo items
(load "43-revealjs.el")               ; Reveal.js settings
(load "44-org-publish.el")            ; Org publish setup
;(load "48-org-ac.el")                ; org mode autocomplete
;(load "49-org-mobile.el")            ; Org sync with MobileOrg for Android devices

;;--------------------------------------------------------------------------------
;;-Programming tools (50-69)
;;--------------------------------------------------------------------------------
(load "50-multiple-cursors.el")      ; Edit multiple lines at the same time.
(load "51-undo-tree.el")             ; Undo tree
(load "52-rainbow.el")               ; Highlight colours in scss files
(load "53-magit.el")                 ; Git
(load "54-yasnippet.el")             ; Yasnippets BUG: https://github.com/capitaomorte/yasnippet/issues/631
(load "55-rinari.el")                ; Ruby on rails mode
(load "56-rsense.el")                ; Command Lookup
;;(load "57-auto-complete.el")       ; Auto complete
(load "58-highlight-indentation.el") ; Highlight tabs
(load "59-highlight-parentheses.el") ; Highlights start and end of parentheses.
(load "60-yafolding.el")             ; yafolding
(load "61-ruby-refactor.el")
(load "62-robe.el")                  ; Ruby documentation

;;(load "63-tide.el")                ; Typescript Interactive Dev Environment
(load "64-rbenv.el")                 ; Ruby version manager
;;(load "65-slime.el")               ; Slime Superior Lisp Interaction Mode for Emacs
(load "66-flycheck.el")              ; Syntax checking (better than built in flymake)


;;--------------------------------------------------------------------------------
;;-Programming modes (75-94)
;;--------------------------------------------------------------------------------
(load "75-scss-mode.el")             ; SCSS mode
(load "76-rspec_mode.el")            ; Rspec testing mode for ruby projects
(load "77-company-mode.el")          ; Autocomplete
(load "78-haml.el")                  ; haml mode
(load "79-css.el")                   ; css mode
(load "80-coffeescript.el")          ; Coffeescript mode
(load "81-ruby.el")                  ; Ruby programming language
(load "82-xml.el")                   ; edit xml files
(load "83-web-mode.el")              ; Mixed mode in web frontend
(load "84-html-mode.el")             ; html mode & json.
(load "85-yaml_mode.el")             ; yaml mode.
;(load "86-jinja2.el")               ; Ansible templates
(load "87-js2_mode.el")              ; Javascript js2-mode

;;--------------------------------------------------------------------------------
;;-EXWM, appearance and shortcut keys
;;--------------------------------------------------------------------------------
(load "95-resize-buffer.el")          ; Resize buffer
;;(load "96-mode-line.el")              ; Format my mode line
(load "97-shortcuts.el")              ; Keyboard shortcuts

(if (file-exists-p "~/.xinitrc")
    (load "98-exwm.el")               ; Emacs X Windows Manager
)

(if (file-exists-p "~/.emacs.d/.emacs.autostart.el")
    (load "~/.emacs.d/.emacs.autostart.el")
)

(if (file-exists-p "~/.emacs.d/.emacs.paradox.el")
    (load "~/.emacs.d/.emacs.paradox.el")
  )
;;(load "99-symbolised-mode-line.el")   ; Save on valuable modeline realestate & use symbols
;;(load "100-theme.el")                 ; Load theme and setup font

;; Read in custom settings for the user
(setq custom-file "~/.emacs.d/.emacs.custom.el")
(load custom-file)
