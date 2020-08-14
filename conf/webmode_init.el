;;---------------------------------------------------
;; web-modeの設定
;;---------------------------------------------------

(require 'web-mode)
;;---------- web-modeを適用するフォーマット -------------
(add-to-list 'auto-mode-alist '("\\.jsp$"   . web-mode))  ;; java-servlet
(add-to-list 'auto-mode-alist '("\\.html?$" . web-mode))  ;; html
(add-to-list 'auto-mode-alist '("\\.shtml?$" . web-mode))  ;; shtml
(add-to-list 'auto-mode-alist '("\\.php$"   . web-mode))  ;; php
(add-to-list 'auto-mode-alist '("\\.jsc?$"  . web-mode))  ;; Javascript
(add-to-list 'auto-mode-alist '("\\.json$"  . web-mode))  ;; Json
(add-to-list 'auto-mode-alist '("\\.xml$"   . web-mode))  ;; XML

;;--------- web-mode-hook --------------
(defun my-web-mode-hook ()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  )
(add-hook 'web-mode-hook 'my-web-mode-hook)
