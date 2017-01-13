;; Load rails snippets
(use-package yasnippet
  :init
  (add-hook 'rails-minor-mode-hook '(lambda () (yas-minor-mode)))
  :defer 5
  :config
  (yas-global-mode 1)
  (setq yas-snippet-dirs '("~/.emacs.d/snippets")))

