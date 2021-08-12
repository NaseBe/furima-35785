# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| email              | string  | null: false               |
| encrypted_password | string  | null: false               |
| nickname           | string  | null: false, unique: true |
| surname_kanji      | string  | null: false               |
| name_kanji         | string  | null: false               |
| surname_kana       | string  | null: false               |
| name_kana          | string  | null: false               |
| birthday           | date    | null: false               |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| name          | string     | null: false                   |
| description   | text       | null: false                   |
| category_id      | integer       | null: false                   |
| condition_id    | integer       | null: false                   |
| payment_type_id  | integer       | null: false                   |
| prefecture_id    | integer     | null: false                   |
| shipment_term_id | integer       | null: false                   |
| price         | integer    | null: false                   |
| user          | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| item    | references | null: false, foreign_key: true |
| user    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :address

## addresses テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| postal_code  | string     | null: false                    |
| prefecture_id   | integer     | null: false                    |
| city         | string     | null: false                    |
| address      | string     | null: false                    |
| building     | string     |                                |
| phone_number | string     | null: false                    |
| order        | references | null: false, foreign_key: true |

### Association

- belongs_to :order

