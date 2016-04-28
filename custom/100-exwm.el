;; Add paths (not required if EXWM is installed from GNU ELPA)
;; (add-to-list 'load-path "/home/map7/.emacs.d/elpa/xelb-0.6/")
;;(add-to-list 'load-path "/home/map7/.emacs.d/elpa/exwm-0.4/")
(add-to-list 'load-path "~/.emacs.d/external/xelb/")
(add-to-list 'load-path "~/.emacs.d/external/exwm/")
(add-to-list 'load-path "~/.emacs.d/elpa/cl-generic-0.2/")

;; Start server - helps with opening files
(server-start)

;; RandR (multi-screen support)
(require 'exwm-randr)
(setq exwm-randr-workspace-output-plist '(0 "LVDS1" 1 "LVDS1" 2 "DP2"))
(add-hook 'exwm-randr-screen-change-hook
          (lambda ()
            (start-process-shell-command
             "xrandr" nil "xrandr --output DP2 --right-of LVDS1 --output DP2 --mode 1920x1080")))
(exwm-randr-enable)

;; Load EXWM
(require 'exwm)
(require 'exwm-config)
(exwm-config-default)

;; + 'slock' is a simple X display locker provided by suckless tools. 'i3lock'
;;   is a more feature-rich alternative.
(exwm-input-set-key (kbd "s-l")
                    (lambda () (interactive) (start-process "" nil "slock")))

;; Suspend nicely
(exwm-input-set-key (kbd "s-<f12>")
                    (lambda () (interactive) (start-process "" nil "gksudo" "pm-suspend")))

;; Enable workspace
(setq exwm-workspace-number 10)

;; System tray
(require 'exwm-systemtray)
(exwm-systemtray-enable)