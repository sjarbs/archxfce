(package-initialize)
(setq config-file (concat user-emacs-directory "config.org"))
(org-babel-load-file config-file)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("fce3524887a0994f8b9b047aef9cc4cc017c5a93a5fb1f84d300391fba313743" "e074be1c799b509f52870ee596a5977b519f6d269455b84ed998666cf6fc802a" "99ea831ca79a916f1bd789de366b639d09811501e8c092c85b2cb7d697777f93" default))
 '(package-selected-packages
   '(org-plus-contrib doom-themes super-save move-text neotree all-the-icons centaur-tabs org-bullets rainbow-delimiters undo-fu use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(my-carriage-return-face ((((class color)) (:background "blue"))) t)
 '(my-tab-face ((((class color)) (:background "green"))) t))
