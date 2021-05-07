## usersテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| nickname   | string     | null: false                    |
| email      | string     | null: false                    |
| password   | string     | null: false                    |
| real_name  | string     | null: false                    |
| birthday   | date       | null: false                    |

### Association
- has_many :products
- has_many :purchase records


## productsテーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| title           | string     | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| delivery_charge | string     | null: false                    |
| shipment_source | string     | null: false                    |
| day_to_ship     | string     | null: false                    |
| price           | string     | null: false                    |
| users           | references | foreign_key: true              |

### Association
- belongs_to :users
- has_one :purchase records


## purchase recordsテーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| record     | string     | null: false                    |
| users      | references | foreign_key: true              |

### Association
- belongs_to :users
- belongs_to :shipping address
- has_one :products

## shipping addressテーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| creadit_card | string     | null: false                    |
| postal_code  | string     | null: false                    |
| prefectures  | string     | null: false                    |
| municipality | string     | null: false                    |
| address      | string     | null: false                    |
| tel          | string     | null: false                    |

### Association
- belongs_to :purchase records