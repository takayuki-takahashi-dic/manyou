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
#
$ heroku create

1. `$ heroku create`
1. `$ rails assets:precompile RAILS_ENV=production`
1. `$ git add -A`
1. `$ git commit -m "test commit"`
1. `$ git push heroku master`
1. `$ heroku run rails db:migrate`

1. `$ heroku create`
1. Herokuサイトにアクセスし、作成したherokuアプリをクリック
1. Deployタブをクリックし、Deployment method欄：GitHubを選択する。
1. GitHub側でコミット
1. Herokuに自動でデプロイ
1. `$ heroku create`
1. `$ heroku create`

Deployment method
GitHubをクリック
Connect to GitHub
Authorize heroku
自分のリポジトリを検索
Connect
Enable Automatic Deploys
Wait for CI to pass before deploy
