# DB設計

## users テーブル
| Column                 | Type    | Options     |
| :--------------------: | :-----: | :---------: |
| nickname               | string  | null: false |
| password               | string  | null: false |
| email                  | string  | null: false |
| last_name              | string  | null: false |
| first_name             | string  | null: false |
| how_to_read_last_name  | string  | null: false |
| how_to_read_first_name | string  | null: false |
| birth_year             | integer | null: false |
| birth_month            | integer | null: false |
| birth_date             | integer | null: false |

### Association
- has_many items
- has_many orders


## items テーブル
| Column             | Type       | Options     |
| :----------------: | :--------: | :---------: |
| image              | -          | null: false |
| item_name          | string     | null: false |
| item_explanation   | text       | null: false |
| category           | string     | null: false |
| status             | string     | null: false |
| delivery_fee_payer | string     | null: false |
| delivery_address   | string     | null: false |
| delivery_time      | string     | null: false |
| price              | integer    | null: false |
| user               | references | -           |

## Association
- belongs_to user
- has_one order


## orders テーブル
| Column           | Type       | Options     |
| :--------------: | :--------: | :---------: |
| card_number      | integer    | null: false |
| expiration_month | integer    | null: false |
| expiration_year  | integer    | null: false |
| CVV              | integer    | null: false |
| user             | references | -           |
| item             | references | -           |

### Association
- belongs_to user
- has_one destination


## destinations テーブル
| Column        | Type       | Options     |
| :-----------: | :--------: | :---------: |
| postal_code   | integer    | mull: false |
| prefecture    | string     | mull: false |
| municipality  | string     | mull: false |
| address       | string     | mull: false |
| building_name | string     | mull: false |
| phone_number  | string     | mull: false |
| order         | references | -           |
 
### Association
- belongs_to order
