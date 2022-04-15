## usersテーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| email     | string | null: false |
| password  | string | null: false |

### Association
- has_many :babies


## babiesテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| name     | string     | null: false                    |
| gender   | integer    | null: false                    |
| birthday | date       | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association
- belongs_to :user
