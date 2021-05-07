## usersテーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| first_name         | string     | null: false                    |
| last_name          | string     | null: false                    |
| first_name_ruby    | string     | null: false                    |
| last_name_ruby     | string     | null: false                    |
| email              | string     | null: false                    |
| encrypted_password | string     | null: false                    |
| real_name          | string     | null: false                    |
| birthday           | datetime   | null: false                    |

### Association
- has_many :products
- has_many :purchase records


## productsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | string     | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| delivery_charge | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| day_to_ship     | integer    | null: false                    |
| price           | ineteger   | null: false                    |
| user            | references | foreign_key: true              |

### Association
- belongs_to :user
- has_one :purchase record


## purchase recordsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| record     | string     | null: false                    |
| user       | references | foreign_key: true              |
| product    | references | foreign_key: true              |

### Association
- belongs_to :user
- belongs_to :shipping address
- belongs_to :product

## shipping addressテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | integer    | null: false                    |
| tel           | ineteger   | null: false                    |

### Association
- belongs_to :purchase record