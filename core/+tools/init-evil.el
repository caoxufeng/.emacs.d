(use-package evil
  ;; :defer .1
  :init
  (setq evil-want-C-u-scroll t)
  (setq evil-search-module 'evil-search)
  (defalias #'forward-evil-word #'forward-evil-symbol)
  (evil-mode 1))



(provide 'init-evil)