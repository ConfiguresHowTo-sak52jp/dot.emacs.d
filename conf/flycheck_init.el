;;-------------------------------------------------------------------------
;; flycheck modeを有効化
;;-------------------------------------------------------------------------
(add-hook 'after-init-hook #'global-flycheck-mode)

;;-------------------------------------------------------------------------
;; google C++ style checker
;;-------------------------------------------------------------------------
(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-google-cpplint)
     ;; Add Google C++ Style checker.
     ;; 1. In default, syntax checked by Clang and Cppcheck.
     (flycheck-add-next-checker 'c/c++-cppcheck
                                '(warning . c/c++-googlelint))
     ;; 2. cppcheckを飛ばしてcpplintをかける場合は下記の様にする
     ;; (flycheck-add-next-checker 'c/c++-clang
     ;;                            '(warning . c/c++-googlelint))
     ))
