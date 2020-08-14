;;--------------------------------------------
;; c/c++系
;;--------------------------------------------
(defun my-c-mode-hook ()
  ;;-- google style --
  (use-package google-c-style
    :config
    (google-set-c-style))
  ;;-- シンタックスチェックはirony-on-flycheckを使う ---
  (use-package flycheck
    :config
    (when (locate-library "flycheck-irony")
      (flycheck-irony-setup))
    (flycheck-mode)
    )
  ;;--- 補完エンジンとしてironyを使う ---
  (use-package irony
    :config
    (add-to-list 'company-backends 'company-irony)
    (custom-set-variables
     '(irony-additional-clang-options '("-std=c++17")))
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
    (irony-mode))
  ;;--- 基本オフセットは一般的な値にする --
  (setq c-basic-offset 4)
  )
(add-hook 'c-mode-hook 'my-c-mode-hook)
(add-hook 'c++-mode-hook 'my-c-mode-hook)

(provide 'cmode_init)
;;; cmode_init.el ends here
