class Item < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :discription, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_cost_id, presence: true
  validates :prefecture_id, presence: true   
  validates :shipping_date_id, presence: true   
  validates :user, presence: true   


    with_options presence: true, format: { with: /\A[0-9]+\z/ } do
    validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999},
                      presence: { message: "can't be blank" }
  end 
end