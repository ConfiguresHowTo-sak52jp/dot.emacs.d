;;---------------------------------------------------
;; markdown-modeの設定
;;---------------------------------------------------

(require 'web-mode)
;; (autoload 'markdown-mode "markdown-mode"
;;   "Major mode for editing Markdown files" t)
;;---------- markdown-modeを適用するフォーマット -------------
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
