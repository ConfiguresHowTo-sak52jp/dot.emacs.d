(require 'python-mode)

(defun my-python-mode-hook ()
  ;;--- elpy有効化 ---
  (require 'elpy)
  (elpy-enable)
  ;;--- virtualenvのエラーをなくす ---
  (setq elpy-rpc-virtualenv-path 'current)
  ;;--- pyenvのpython実行ディレクトリを教える ---
  (add-to-list 'exec-path "~/.pyenv/shims")
  )
(add-hook 'python-mode-hook 'my-python-mode-hook)
