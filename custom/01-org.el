;; Org mode shortcuts
(global-set-key (kbd "C-c C-x C-v") 'do-org-show-all-inline-images)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key (kbd "s-h") 'puborg)
(global-set-key (kbd "s-u") 'org-mobile-push)
(global-set-key (kbd "s-i") 'org-clock-in)
(global-set-key (kbd "s-o") 'org-clock-out)

;; Org-mode options
(add-hook 'org-mode-hook 'turn-on-visual-line-mode)
(setq org-clock-out-remove-zero-time-clocks t)
(setq org-directory "~/org")
(setq org-agenda-files '("~/org/"))
(setq org-mobile-inbox-for-pull "~/org/inbox.org");; new notes will be stored here

;; Display inline images
(defun do-org-show-all-inline-images ()
  (interactive)
  (org-display-inline-images t t))

;; Assign mode to .org files
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; Sync with my mobile phone.
(setq org-mobile-directory "~/MobileOrg")         ;; Set to ~/MobileOrg (This is linked to my Dropbox).

;; Set more workflow states than TODO
(setq org-todo-keywords
	  '((sequence "TODO(t)" "|" "DONE(d)" "REDUNDANT(r)" )
		(sequence "DELEGATED(<)" "|" "DONE(d)")
		(sequence "GONNA(g)" "|" "DONE(d)" )))

(setq org-support-shift-select t)

;; Automatically push changes
(defvar org-mobile-push-timer nil
  "Timer that `org-mobile-push-timer' used to reschedule itself, or nil.")

(defun org-mobile-push-with-delay (secs)
  (when org-mobile-push-timer
	(cancel-timer org-mobile-push-timer))
  (setq org-mobile-push-timer
		(run-with-idle-timer
		 (* 1 secs) nil 'org-mobile-push)))

;; org publish options
;;(require 'org-publish)
;;(require 'ox-publish)
(setq org-publish-project-alist
	  '(
		;; ... add all the components here (see below)...

		;; All org files (notes)
		("org-notes"
		 :base-directory "~/org/"
		 :base-extension "org"
		 :publishing-directory "~/org_html/"
		 :style "<link rel=\"stylesheet\" href=\"css/stylesheet.css\" type=\"text/css\" />"
		 :recursive t
		 :publishing-function org-html-publish-to-html
		 :headline-levels 4             ; Just the default for this project.
		 :auto-preamble t
		 :html-head "<link rel=\"stylesheet\" href=\"css/stylesheet.css\" type=\"text/css\" />"
		 )

		;; Attachments
		("org-static"
		 :base-directory "~/org/"
		 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf\\|htaccess"
		 :publishing-directory "~/org_html/"
		 :recursive t
		 :publishing-function org-publish-attachment
		 )

		;; Publish component
		("org" :components ("org-notes" "org-static"))

	  ))

 '(org-archive-location "~/org/archive/%s_archive::")
 '(org-stuck-projects (quote ("hard" ("REDUNDANT" "DONE" "NEXT" "NEXTACTION") nil "")))

;; Allow divs in org-publish
;;(require 'org-special-blocks)

; Create a little function to run publish mode in a shortcut
(defun puborg ()
  (interactive)
  (org-publish-project "org")
)

;; Put email links in org mode :) - currently broken :(
;; (setq ffap-url-regexp (replace-regexp-in-string "mailto:" "thunderlink: \ \ \ \ | mailto:" ffap-url-regexp));; for ThunderLink

;;  (defun browse-url-thunderlink (url & optional new-window)
;;    (interactive (browse-url-interactive-arg "URL:"))
;;    (if (string-match "^ thunderlink ://" url)
;;        (progn
;;          (start-process (concat "thunderbird" url) nil "thunderbird" "-thunderlink" url)
;;          t)
;;      nil)
;;    )
;; (unless (listp browse-url-browser-function) (setq browse-url-browser-function (list (cons "." browse-url-browser-function))))
;; (add-to-list 'browse-url-browser-function' ("^ thunderlink:". browse-url-thunderlink))

;; (add-hook 'org-load-hook
;;             '(lambda ()
;;                (add-to-list 'org-link-types "thunderlink")
;;                (org-make-link-regexps)
;;                (add-hook 'org-open-link-functions' browse-url-thunderlink)
;;                ))

;; mobile org options
;; http://kenmankoff.com/2012/08/17/emacs-org-mode-and-mobileorg-auto-sync
;;

;; TODO - put this into the background somehow.
;; (add-hook 'after-save-hook
;;  (lambda ()
;;    (when (eq major-mode 'org-mode)
;;      (dolist (file (org-mobile-files-alist))
;;        (if (string= (expand-file-name (car file)) (buffer-file-name))
;;            (org-mobile-push-with-delay 10)))
;;    )))

;; This runs directly after you start emacs, it takes too long.
;; (run-at-time "00:05" 86400 '(lambda () (org-mobile-push-with-delay 1))) ;; refreshes agenda file each day




;; Custom searches
(setq org-agenda-custom-commands
      '(("Q" . "Custom queries") ;; gives label to "Q" 
        ("Qa" "Archive search" search ""
         ((org-agenda-files (file-expand-wildcards "~/org/archive/*.org_archive")))) 
        ;; ("Qw" "Website search" search ""
        ;;  ((org-agenda-files (file-expand-wildcards "~/website/*.org"))))
        ("Qb" "Projects and Archive" search ""
         ((org-agenda-text-search-extra-files (file-expand-wildcards "~/org/archive/*.org_archive"))))
        ;; searches both projects and org/archive directories
        ("QA" "Archive tags search" org-tags-view "" 
         ((org-agenda-files (file-expand-wildcards "~/org/archive/*.org_archive"))))
        ;; ...other commands here
        ))
