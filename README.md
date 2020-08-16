# dot.emacs.d
最近、補完（スニペット）機能と文法のオンザフライチェック機能を導入した。
このリポジトリは主にその過程で行ったことを残すために作成した。
## 対象言語
機能の対象言語は取り敢えず C/C++と Python。（次はPerlへの展開を狙っている…）
## 補完機能
### フロントエンド
`company-mode`を使用している。インストールソースはmelpa-stable。
### C/C++言語用エンジン
`company-irony`を使用している。インストールソースはmelpa-stable。  
実体は`irony-mode`であり、`company-irony`インストール時にdependencyとしてインストールされている。

#### irony-mode動作のために必要な外部環境
Platformとしてubuntuを前提とすると、下記のようなモジュールを`apt install`する必要がある。
```
sudo apt install llvm
sudo apt install clang
sudo apt install libclang-dev
sudo apt install make
```
ironyを最初に起動する際、`M-x irony-install-server`を実行してirony-serverをビルド・インストールする必要がある。
この時、上記のモジュールが揃っていないとビルドに失敗してハマるので、注意すること！  
ただし、このリポジトリをダウンロードした場合は、既にサーバーがインストール済みなので、ビルドでハマることはない。
しかし実行時に正体不明のエラーに出くわす可能性はあるので、上記のモジュール群は必ずインストールしておくこと。

### Python用エンジン
pythonではelpyという補完機能周辺統括フレームワークを使って補完・チェック機能を一括管理している。  
ここに含まれるエンジンはjediというものである。jedi本体はpython moduleなので下記の通り外部環境としてインストールしておく。
```
pip install jedi
```
companyとの連携はelpy内部で隠蔽されているようなので、明示的に`company-jedi`をインストールする必要はない。
## 文法チェック機能
### フロントエンド
`flycheck`を使用している。インストールソースはmelpa-stable。
### C/C++言語用エンジン
`flycheck-irony`を使用している。インストールソースはmelpa-stable。  
実体は`irony-mode`であり、前述した`company-irony`インストール時にdependencyとしてインストールされている。

### Python用エンジン
上述した通り、`eply`で統括管理しており、flycheckのバックエンドとして動作するモジュールは、`flake8`及び`autopep8`である。
これらのモジュールはpython moduleであるため、下記の通り外部環境としてインストールしておく。
```
pip install flake8 autopep8
```
