;;---- requireの代替としてuse-packageを使う ---
(require 'use-package)
(require 'bind-key)

;;---- marmaladeをロードする時に発生する認証エラーを抑制するため ---
(use-package gnutls
  :config
  (add-to-list 'gnutls-trustfiles
               (expand-file-name
                "~/etc/tls/certificates/comodo.rsa.ca.intermediate.crt")))

;;---- Package Repositories ---
(use-package package
  :config
  (add-to-list 'package-archives
               '("melpa" . "https://melpa.org/packages/") t)
  (add-to-list 'package-archives
               '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives
               '("melpa-stable" . "https://stable.melpa.org/packages/"))
  (package-initialize))

;;--- Set shell related functions ---
(setenv "SHELL" "bash")
(setq explicit-shell-file-name "bash")

;;---- Set default TAB mode ---
(setq-default tab-width 4
              indent-tabs-mode nil)

;;--- 補完のフロントエンジンとしてcompanyを使う ---
(use-package company
  :config
  (global-company-mode t)
  ;; C-TABで補完起動
  (global-set-key (kbd "<C-tab>") 'company-complete)
  (bind-keys :map company-active-map
             ("C-n" . company-select-next)
             ("C-p" . company-select-previous))
  (bind-keys :map company-search-map
             ("C-n" . company-select-next)
             ("C-p" . company-select-previous))
  ;; TAB又はEnterで補完確定
  (bind-keys :map company-active-map
             ("<tab>" . company-complete-selection))
  )


;;--------- init.el以外の設定ファイル読み込み ----------
(setq load-path
      (append '("~/.emacs.d/conf") load-path)
      )

(load "cmode_init")     ;; c-mode
(load "webmode_init")   ;; web-mode
(load "gudmode_init")   ;; gud-mode (Debugger)
(load "markdownmode_init")   ;; markdown-mode
(load "cmakemode_init") ;; cmake-mode
(load "yamlmode_init") ;; yaml-mode
;(load "flycheck_init") ;; flycheck
(load "pythonmode_init") ;; python-mode


;;--------- make-modeの設定 ----------
(require 'make-mode)
(setq auto-mode-alist 
      (append '(("Make\\..*$" . makefile-gmake-mode) ;; Make.*
                ) auto-mode-alist))


;;---------- 列番号も表示する -------------------------
(column-number-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(grep-find-command
   (quote
    ("find . -type d \\( -name .svn -o -name .git \\) -prune -o -type f \\( -name \\*.c -o -name \\*.h \\) -print0 | xargs -0 grep -nH -E " . 127)))
 '(irony-additional-clang-options (quote ("-std=c++17")))
 '(package-selected-packages
   (quote
    (use-package flycheck-irony company-irony elpy python-mode gnu-elpa-keyring-update yaml-mode web-mode mozc markdown-mode google-c-style flymake-google-cpplint flycheck cmake-mode)))
 '(tool-bar-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "unknown" :slant normal :weight normal :height 98 :width normal)))))

(cond ((display-graphic-p)
       ;;------ 日本語フォントの設定 ----------
       ; 全角かな設定
       (set-fontset-font (frame-parameter nil 'font)
                         'japanese-jisx0208
                         (font-spec :family "Noto Serif CJK JP" :size 13))
       ; 半角ｶﾅ設定
       (set-fontset-font (frame-parameter nil 'font)
                         'katakana-jisx0201
                         (font-spec :family "Noto Serif CJK JP" :size 13))

       )
      (t 0))

(require 'perl-mode)
;;--------- perl-mode-hook --------------
(defun my-perl-mode-hook ()
  ;;------------ キーボードマクロの記録 ------------------
  (fset 'inocent-debug
        [?# ?- ?- ?- ?- ?- ?- ?- ?- ?  ?i ?n ?o ?c ?e ?n ?t ?  ?d ?e ?b ?u ?g ?  ?s ?t ?a ?r ?t ?  ?- ?- ?- ?- ?- ?- ?- ?- ?- ?- ?- return ?# ?- ?- ?- ?- ?- ?- ?- ?- ?  ?i ?n ?o ?c ?e ?n ?t ?  ?d ?e ?b ?u ?g ?  ?e ?n ?d ?  ?- ?- ?- ?- ?- ?- ?- ?- ?- ?- ?- ?- ?- return])
  )
(add-hook 'perl-mode-hook 'my-perl-mode-hook)

;;; mozc
(require 'mozc)                                 ; mozcの読み込み
(set-language-environment "Japanese")           ; 言語環境を"japanese"に
(setq default-input-method "japanese-mozc")     ; IMEをjapanes-mozcに
(prefer-coding-system 'utf-8)                   ; デフォルトの文字コードをUTF-8に

(provide 'init)
;;; init.el ends here

