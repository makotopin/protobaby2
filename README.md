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
- has_one :memo
- has_one :hospital


## memoテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| content  | string     |                                |
| baby     | references | null: false, foreign_key: true |

## Association
- belongs_to :baby


## hospitalテーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| hospital | string     |                                |
| week     | string     |                                |
| map      | text       |                                |
| baby     | references | null: false, foreign_key: true |

## Association
- belongs_to :baby