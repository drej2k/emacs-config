(require 'yasnippet)
(setq yas/root-directory "~/.emacs.d/.cask/24.3.1/elpa/yasnippet-20131031.628/snippets") 
;; (yas/initialize)
;; (yas/load-directory "~/.emacs.d/.cask/24.3.1/elpa/yasnippet-20131031.628/snippets") 

(add-hook 'enh-ruby-mode-hook '(lambda ()
			    (yas-minor-mode)))
