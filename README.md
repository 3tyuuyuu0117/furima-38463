<!-- DB設計 -->


<!-- USERSテーブル -->
| Column             | Type   | Options                      |
| ------------------ | ------ | ---------------------------- |
| name               | string | null: false,unique_key: true |
| email              | string | null: false,unique_key: true |
| encrypted_password | string | null: false,unique_key: true |
| first_name         | string | null: false                  |
| last _name         | string | null: false                  |
| first _name_kana   | string | null: false                  |
| last _name_kana    | string | null: false                  |
| birthday           | date   | null: false                  |
  
<!-- Association -->
- has_many :items
- has_many :orders



<!-- ITEMSテーブル -->
| Colum          | Type      | Options                       |
| -------------- | --------- | ----------------------------- |
| name           | string    | null: false,true              |
| discription    | text      | null: false,foreign_key: true |
| category       | string    | null: false,foreign_key: true |
| condition      | string    | null: false,foreign_key: true |
| delivery_cost  | integer   | null: false,foreign_key: true |
| delivery_place | string    | null: false,foreign_key: true |
| shipping_date  | string    | null: false,foreign_key: true |
| price          | integer   | null: false,foreign_key: true |
| user_id        | reference | null: false,foreign_key: true |

<!-- Association -->
- belongs_to :user
- belongs_to :order



<!-- ORDERSテーブル -->
| Colum         | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| post_code     | string     | null: false                   |
| cprefecture   | text       | null: false                   |
| city          | tex        | null: false                   |
| address       | references | null: false                   |
| building_name | string     |                               |
| phone_number  | string     | null: false,unique_key: true  |
| user_id       | reference  | null: false,foreign_key: true |
| item_id       | reference  | null: false,foreign_key: true |

<!-- Association -->
- belongs_to :user
- belongs_to :item
