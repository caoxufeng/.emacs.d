;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Automatically compile Emacs Lisp libraries
;;	https://github.com/emacscollective/auto-compile
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;; Code:
(use-package auto-compile
  :init (setq load-prefer-newer t)
  :config
  (progn
    (auto-compile-on-load-mode)
    (auto-compile-on-save-mode)))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Disable the mouse in Emacs
;;	https://github.com/purcell/disable-mouse
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package disable-mouse
  :config (global-disable-mouse-mode))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Powerful undo system for emacs
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package undo-tree
  :config
  (progn
    (global-undo-tree-mode)
    (setq undo-tree-visualizer-timestamps t)
    (setq undo-tree-visualizer-diff t)
    ))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Show key bind for currently entered incomplete command
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package which-key
  :config
  (progn
    (which-key-mode)
    (which-key-setup-side-window-bottom)))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Show recent file
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package recentf
  :config
  (progn
    (setq recentf-max-saved-items 200
	  recentf-max-menu-items 15)
    (recentf-mode)
    ))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Show line number of current coding window
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; (use-package linum
;;   :init
;;   (progn
;;     (global-linum-mode t)
;;     (setq linum-format "%4d  ")
;;     ))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Auto pair when input
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package autopair
  :config (autopair-global-mode))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Sidebar for emacs
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package all-the-icons)
(use-package neotree
  :config
  (progn
    (setq neo-smart-open t)
    (setq neo-theme (if (display-graphic-p) 'icons 'nerd))
    (setq neo-window-fixed-size nil)
    ;; (setq-default neo-show-hidden-files nil)
    (global-set-key [f2] 'neotree-toggle)
    (global-set-key [f8] 'neotree-dir)))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Git tool for emacs
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package magit)

(use-package git-gutter+
  :ensure t
  :config
  (progn
    (global-git-gutter+-mode)))


;; ;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; ;;	Emacs framework for incremental completions and
;; ;;	narrowing selections
;; ;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; (use-package helm-swoop)
;; (use-package helm-gtags)
;; (use-package helm
;;   :diminish helm-mode
;;   :init
;;   (progn
;;     ;; (require 'helm-config)
;;     (setq helm-candidate-number-limit 100)
;;     ;; From https://gist.github.com/antifuchs/9238468
;;     (setq helm-idle-delay 0.0 ; update fast sources immediately (doesn't).
;;           helm-input-idle-delay 0.01  ; this actually updates things
;;                                         ; reeeelatively quickly.
;;           helm-yas-display-key-on-candidate t
;;           helm-quick-update t
;;           helm-M-x-requires-pattern nil
;;           helm-ff-skip-boring-files t)
;;     (helm-mode))
;;   :config
;;   (progn
;;     )
;;   :bind  (("C-c s" . helm-swoop)
;; 	  ("C-x C-f" . helm-find-files)
;; 	  ("C-x b" . helm-buffers-list)
;; 	  ("M-y" . helm-show-kill-ring)
;; 	  ("M-x" . helm-M-x)))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Auto complete when coding
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package auto-complete
  ;; :bind ("<TAB>" . auto-complete)
  :init
  (progn
    (ac-config-default)
    ;; (global-auto-complete-mode t)
    (global-unset-key (kbd "TAB"))
    (ac-set-trigger-key "TAB")
    (setq ac-use-menu-map t)
    ))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Quickly jumps between other symbols found at point in Emacs.
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package smartscan
  :defer t
  :config (smartscan-mode t))


;; ;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; ;;	Snippet tool for emacs
;; ;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; (use-package yasnippet
;;   :diminish yas-minor-mode
;;   :init (yas-global-mode)
;;   :config
;;   (progn
;;     (yas-global-mode)
;;     (add-hook 'hippie-expand-try-functions-list 'yas-hippie-try-expand)
;;     (setq yas-key-syntaxes '("w_" "w_." "^ "))
;;     ;; (setq yas-installed-snippets-dir "~/elisp/yasnippet-snippets")
;;     (setq yas-expand-only-for-last-commands nil)
;;     (yas-global-mode 1)
;;     (bind-key "\t" 'hippie-expand yas-minor-mode-map)
;;     (add-to-list 'yas-prompt-functions 'shk-yas/helm-prompt)))


;; (dolist (command '(yank yank-pop))
;;   (eval
;;    `(defadvice ,command (after indent-region activate)
;;       (and (not current-prefix-arg)
;; 	   (member major-mode
;; 		   '(emacs-lisp-mode
;; 		     lisp-mode
;; 		     clojure-mode
;; 		     scheme-mode
;; 		     haskell-mode
;; 		     ruby-mode
;; 		     rspec-mode
;; 		     python-mode
;; 		     c-mode
;; 		     c++-mode
;; 		     objc-mode
;; 		     latex-mode
;; 		     js-mode
;; 		     plain-tex-mode))
;; 	   (let ((mark-even-if-inactive transient-mark-mode))
;; 	     (indent-region (region-beginning) (region-end) nil))))))

;; (defun shk-yas/helm-prompt (prompt choices &optional display-fn)
;;   "Use helm to select a snippet. Put this into `yas-prompt-functions.'"
;;   (interactive)
;;   (setq display-fn (or display-fn 'identity))
;;   (if (require 'helm-config)
;;       (let (tmpsource cands result rmap)
;;         (setq cands (mapcar (lambda (x) (funcall display-fn x)) choices))
;;         (setq rmap (mapcar (lambda (x) (cons (funcall display-fn x) x)) choices))
;;         (setq tmpsource
;;               (list
;;                (cons 'name prompt)
;;                (cons 'candidates cands)
;;                '(action . (("Expand" . (lambda (selection) selection))))
;;                ))
;;         (setq result (helm-other-buffer '(tmpsource) "*helm-select-yasnippet"))
;;         (if (null result)
;;             (signal 'quit "user quit!")
;;           (cdr (assoc result rmap))))
;;     nil))


;; ;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; ;;	Dockerfile mode
;; ;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; (use-package dockerfile-mode
;;   :config
;;   (add-to-list 'auto-mode-alist '("Dockerfile" . dockerfile-mode)))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Fixme-mode
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendors/"))
(require 'fixme-mode)
(fixme-mode 1)

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; 	SLIME mode
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package slime
  :config
  (progn
    (setq inferior-lisp-program "/usr/local/bin/sbcl")
    (setq slime-contribs '(slime-fancy))
    ))

;; ≈
    ))

;; ************************************************************
;; 	Rainbow mode
;; ************************************************************
(use-package rainbow-mode
  :config
  (progn
    (defun pkg-enable-rainbow ()
      (rainbow-mode t))
    (add-hook 'prog-mode-hook 'pkg-enable-rainbow)
))

(use-package rainbow-delimiters
  :config
  (progn
    (defun pkg-enable-rainbow-delimiters ()
      (rainbow-delimiters-mode t))
    (add-hook 'prog-mode-hook 'pkg-enable-rainbow-delimiters)))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; 	Flycheck
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package flycheck
  :config
  (progn
    (use-package flycheck-pycheckers)
    (use-package flycheck-yamllint)

    (add-hook 'after-init-hook #'global-flycheck-mode)
    (with-eval-after-load 'flycheck
      (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))
    )
  )

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;;	Fold mode
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package vimish-fold
  :config
  (progn
    (vimish-fold-global-mode 1)
    ))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; 	YAML mode
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package yaml-mode
  :config
  (add-to-list 'auto-mode-alist '("yaml" . yaml-mode)))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; 	Smart tab
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package smart-tab
  :config
  (progn
    (defun pkg-enable-smart-tab ()
      (smart-tab-mode))
    (add-hook 'prog-mode-hook 'pkg-enable-smart-tab)
    ))

;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; 	Kubernetes tools
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package kubernetes
  :ensure t
  :commands (kubernetes-overview))


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; 	Plantuml mode
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(require 'plantuml-mode)


;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
;; 	Fiplr - Find in Project for Emacs
;; ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
(use-package fiplr)




(provide 'pkg-packages)
