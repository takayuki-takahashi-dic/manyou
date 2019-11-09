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
