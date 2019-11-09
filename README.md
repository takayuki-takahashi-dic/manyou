# DB構成

- *** admin
    - name string

- *** user
    - name string
    - email string
    - password_digest string

- *** task
    - title string
    - content text
    - id_user index
    - id_label index

- *** task
    - color string
    - content string
    - id_task index

# ER図

![ER図](/Users/takayukitakahashi/workspace/manyou/docs/ermap_1.png)
