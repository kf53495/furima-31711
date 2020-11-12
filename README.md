# DB設計

## users テーブル
| Column             | Type   | Options     |
| :----------------: | :----: | :---------: |
| nickname           | string | null: false |
| password_encrypted | string | null: false |
| email              | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_date         | date   | null: false |

### Association
- has_many items
- has_many orders


## items テーブル
| Column             | Type       | Options                        |
| :----------------: | :--------: | :----------------------------: |
| item_name          | string     | null: false                    |
| item_explanation   | text       | null: false                    |
| category           | integer    | null: false                    |
| status             | integer    | null: false                    |
| delivery_fee_payer | integer    | null: false                    |
| delivery_address   | integer    | null: false                    |
| delivery_time      | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

## Association
- belongs_to user
- has_one order


## orders テーブル
| Column           | Type       | Options                        |
| :--------------: | :--------: | :----------------------------: |
| user             | references | null: false, foreign_key: true |
| item             | references | null: false, foreign_key: true |


### Association
- belongs_to user
- has_one destination


## destinations テーブル
| Column        | Type       | Options                        |
| :-----------: | :--------: | :----------------------------: |
| postal_code   | integer    | null: false                    |
| prefecture    | integer    | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | -                              |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

 
### Association
- belongs_to order
