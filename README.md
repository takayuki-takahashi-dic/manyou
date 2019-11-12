# DB構成

* admin
    * name string

* user
    - name string
    - email string
    - password_digest string

* task
    - title string
    - content text
    - id_user index
    - id_label index

* task
    - color string
    - content string
    - id_task index

# ER図
![ER図](https://github.com/takayuki-takahashi-dic/manyou/blob/master/docs/ermap_1.png)

# herokuへのデプロイ(GITHUB連携ver)

1. `$ heroku create`
1. Herokuサイトにアクセスし、作成したherokuアプリをクリック
1. Deployタブをクリックし、Deployment method欄：GitHubを選択する。
1. GitHubの認証を得る
1. デプロイしたいリポジトリを検索(名前)
1. GitHubへのコネクトを許可
1. Wait for CI〜にチェックをすると、デプロイ前にテストをしてくれる
1. GitHub側でコミットするとHerokuに自動でデプロイされる
