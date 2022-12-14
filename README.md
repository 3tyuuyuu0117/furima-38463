<!-- DB設計 -->


<!-- USERSテーブル -->
| Column             | Type   | Options                  |
| ------------------ | ------ | ------------------------ |
| name               | string | null: false              |
| email              | string | null: false,unique: true |
| encrypted_password | string | null: false              |
| first_name         | string | null: false              |
| last_name          | string | null: false              |
| first_name_kana    | string | null: false              |
| last_name_kana     | string | null: false              |
| birthday           | date   | null: false              |

<!-- Association -->
- has_many :items
- has_many :purchases 



<!-- ITEMSテーブル -->
| Colum            | Type       | Options                       |
| ---------------- | ---------- | ----------------------------- |
| name             | string     | null: false                   |
| discription      | text       | null: false                   |
| category_id      | integer    | null: false                   |
| condition_id     | integer    | null: false                   |
| delivery_cost_id | integer    | null: false                   |
| prefecture_id    | integer    | null: false                   |
| shipping_date_id | integer    | null: false                   |
| price            | integer    | null: false                   |
| user             | references | null: false,foreign_key: true |

<!-- Association -->
- belongs_to :user
- has_one :purchase



<!-- ORDERSテーブル -->
| Colum         | Type       | Options                       |
| ------------- | ---------- | ----------------------------- |
| post_code     | string     | null: false                   |
| prefecture_id | integer    | null: false                   |
| city          | string     | null: false                   |
| address       | string     | null: false                   |
| building_name | string     |                               |
| phone_number  | string     | null: false                   |
| purchase      | references | null: false,foreign_key: true |

<!-- Association -->
- belongs_to :purchase



<!-- PURCHASESテーブル -->
| Colum | Type       | Options                      |
| ----- | ---------- | ---------------------------- |
| user  | references | null: false,unique_key: true |
| item  | references | null: false,unique_key: true |

<!-- Association -->
- belongs_to :user
- belongs_to :item
- has_one :order

