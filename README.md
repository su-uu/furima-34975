# テーブル設計

## users テーブル

| Column          | Type     | Options     |
| --------------- | -------- | ----------- |
| nickname        | string   | null: false |
| email           | string   | null: false |
| password        | string   | null: false |
| last_name       | string   | null: false |
| first_name      | string   | null: false |
| last_name_kana  | string   | null: false |
| first_name_kana | string   | null: false |
| birthday        | datetime | null: false |

### Association

- has_many :products
- has_many :buys
- has_one  :adress

## products テーブル

| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| image    |            | null: false                    |
| title    | string     | null: false                    |
| describe | text       | null: false                    |
| category | string     | null: false                    |
| status   | string     | null: false                    |
| delivery | string     | null: false                    |
| area     | string     | null: false                    |
| date     | string     | null: false                    |
| price    | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :buy

## buys テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| card_number | string     | null: false                    |
| expiration  | string     | null: false                    |
| security    | string     | null: false                    |
| tel         | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |
| product     | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one    :adress

## addresses テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| postal_code | integer    | null: false                    |
| prefectures | string     | null: false                    |
| city        | string     | null: false                    |
| street      | string     | null: false                    |
| building    | string     |                                |
| user        | references | null: false, foreign_key: true |
| buy         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :buy